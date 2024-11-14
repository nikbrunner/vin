# topic: React Query refetching

- file: 2024-11-14.11-15-53.213.md

Write your queries after 💬:. Use `<C-g><C-g>` or :GpChatRespond to generate a response.
Response generation can be terminated by using `<C-g>s` or :GpChatStop command.
Chats are saved automatically. To delete this chat, use `<C-g>d` or :GpChatDelete.
Be cautious of very long chats. Start a fresh chat by using `<C-g>c` or :GpChatNew.

---

💬:

I have the following from bc-desktop-client/src/client/commons/libs/queries/use-active-brands.ts:

```typescript
export const useActiveBrands = (options: BrandsQueryOptions = {}) => {
  const query = useQuery({
    ...options,
    queryKey: activeBrandsQueryKey,
    queryFn: getActiveBrands,
    onSuccess: activeBrands => {
      options.onSuccess?.(activeBrands);
    }
  });

  // QUESTION: 
  // Does the reference of `data` change even when a refetch of `query` happened but it results in the same data?
  const data = useMemo(() => query.data ?? [], [query.data]);

  const activeBrandsMap = useMemo(() => keyBy(data, brand => brand.key), [data]);

  const activeBrandKeys = useMemo(() => data.map(brand => brand.key), [data]);

  const highlightedBrandKeys = useMemo(() => data.filter(brand => brand.highlighted).map(brand => brand.key), [data]);

  const getActiveBrand = useCallback(
    (brandKey: string) => data.find(activeBrand => activeBrand.key === brandKey),
    [data]
  );

  return {
    ...query,
    data,
    activeBrandsMap,
    activeBrandKeys,
    highlightedBrandKeys,
    getActiveBrand
  };
};
```

I have the following from bc-desktop-client/src/client/kiosk/container/App/AppLifecycles.tsx:

```typescriptreact
const useFetchCustomerWorldSlides = () => {
  const dispatch = useDispatch();
  const activeTools = useSelector(state => state.customerWorld.activeTools);

  const { activeBrandKeys } = useActiveBrands();

  useFetchData<Slides[]>(
    () => {
      return customerWorld.getSlides(activeTools, activeBrandKeys);
    },
    [activeTools, activeBrandKeys],
    {
      handleError: error => actions.error.set(error),
      onDone: slides => dispatch(actions.customerWorld.slidesReceived(slides))
    }
  );
};
```


We observed that the slides are fetched everytime the activeBrands are fetched, although the returned `data` is the same as before. We thought that `useMemo` would hold the `data` variable reference stable as long as `query.data` content would be the same?
But maybe we missunderstand.

Basically what we want to achieve is that the slides should only be refetched if `activeTools` or `activeBrandKeys` changes. And by that we mean the content of these variables itself.

The issue disappears if we set the `staleTime` of the `activeBrands` query to `Infinity`, which would be IMHO viable, because `activeBrands` would not change during a runtime. Everytime the user changes active brands, the device restarts anyway.

But maybe you understand the problem better and have another solution.

🤖:[ChatClaude-3-5-Sonnet]
I understand the issue. Let me explain what's happening and suggest possible solutions:

1. **Reference Stability with useMemo**
The `useMemo` hook does maintain reference stability, but only if the dependencies (`query.data` in this case) remain referentially equal. When React Query refetches data, even if the returned data is identical in content, it creates a new reference. This is because React Query follows immutability principles.

2. **Solutions:**

A. Using `staleTime`:
```typescript
export const useActiveBrands = (options: BrandsQueryOptions = {}) => {
  const query = useQuery({
    ...options,
    queryKey: activeBrandsQueryKey,
    queryFn: getActiveBrands,
    staleTime: Infinity, // As you suggested
    onSuccess: activeBrands => {
      options.onSuccess?.(activeBrands);
    }
  });
  // ... rest of the code
};
```

B. Using deep comparison:
```typescript
import { isEqual } from 'lodash';

export const useActiveBrands = (options: BrandsQueryOptions = {}) => {
  const query = useQuery({
    ...options,
    queryKey: activeBrandsQueryKey,
    queryFn: getActiveBrands,
    onSuccess: activeBrands => {
      options.onSuccess?.(activeBrands);
    }
  });

  // Use deep comparison for stability
  const data = useMemo(
    () => query.data ?? [], 
    [JSON.stringify(query.data)] // or use useDeepCompareMemo
  );

  // ... rest of the code
};
```

C. Creating a custom hook for deep comparison:
```typescript
function useDeepCompareMemo<T>(value: T, deps: React.DependencyList): T {
  const ref = useRef<T>();

  if (!isEqual(ref.current, value)) {
    ref.current = value;
  }

  return useMemo(() => ref.current as T, deps);
}
```

Given your specific use case where:
1. Active brands don't change during runtime
2. The device restarts when brands change

I would actually agree that setting `staleTime: Infinity` is the most appropriate solution. It's:
- Simple to implement
- Matches your business logic
- Prevents unnecessary refetches
- Avoids the performance overhead of deep comparisons

If you still want to keep the ability to refetch occasionally, you could use a large but not infinite staleTime:
```typescript
staleTime: 1000 * 60 * 60 // 1 hour
```

Would you like me to explain any of these approaches in more detail or discuss other potential solutions?


💬:
No thats a good point. Thank you very much.

🤖:[ChatClaude-3-5-Sonnet]
You're welcome! Just to reinforce your decision: using `staleTime: Infinity` in this case is not just a workaround, but actually the most semantically correct solution since it accurately represents your application's behavior where active brands remain constant during runtime. It's a good example of aligning the caching strategy with the actual business logic.

Feel free to ask if you have any other questions!


💬:

I have the following from bc-desktop-client/src/client/commons/libs/queries/use-active-brands.ts:

```typescript
    // Active Brands does not change during runtime, but its cache gets invalidated by mutations.
    staleTime: Infinity,
```

Is the comment good?

🤖:[ChatClaude-3-5-Sonnet]
The comment is good but could be even more precise. Here's a suggested enhancement:

```typescript
    // Active Brands do not change during runtime (device restarts on changes),
    // but the cache can still be invalidated by mutations. Setting staleTime
    // to Infinity prevents unnecessary refetches.
    staleTime: Infinity,
```

This enhanced comment:
1. Explicitly states why the brands don't change (device restart behavior)
2. Explains the consequence of mutations
3. Clarifies why we're using `Infinity`

However, if you prefer more concise comments, your original version is also fine. It captures the key points (no runtime changes, mutation invalidation) in a shorter form.

Which version do you prefer?


💬:

