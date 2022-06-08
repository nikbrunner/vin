-- https://github.com/chentoast/marks.nvim

local status_ok, marks = pcall(require, "marks")
if not status_ok then
	return
end

-- TODO Try to setup functional bindings
-- If its too much work, just stick with the defaults

marks.setup({
	-- whether to map keybinds or not. default true
	default_mappings = true,
	-- which builtin marks to show. default {}
	builtin_marks = {},
	-- whether movements cycle back to the beginning/end of buffer. default true
	cyclic = true,
	-- whether the shada file is updated after modifying uppercase marks. default false
	force_write_shada = false,
	-- how often (in ms) to redraw signs/recompute mark positions.
	-- higher values will have better performance but may cause visual lag,
	-- while lower values may cause performance penalties. default 150.
	refresh_interval = 250,
	-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
	-- marks, and bookmarks.
	-- can be either a table with all/none of the keys, or a single number, in which case
	-- the priority applies to all marks.
	-- default 10.
	sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	-- disables mark tracking for specific filetypes. default {}
	excluded_filetypes = {},
	-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
	-- sign/virttext. Bookmarks can be used to group together positions and quickly move
	-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
	-- default virt_text is "".
	bookmark_0 = {
		sign = "⚑",
		virt_text = "hello world",
	},
	mappings = {
		-- set_next = "mm", -- Set next available lowercase mark at cursor.
		-- next = "]m", -- Goes to next mark in buffer.
		-- prev = "[m", -- Goes to previous mark in buffer. toggle = "mm", -- Toggle next available mark at cursor.
		-- annotate = "ml", -- Prompts the user for a virtual line annotation that is then placed above the bookmark.
		-- Requires neovim 0.6+ and is not mapped by default.
		-- delete_line            Deletes all marks on current line.
		-- delete_buf             Deletes all marks in current buffer.
		-- next
		-- prev
		-- preview                Previews mark (will wait for user input). press <cr> to just preview the next mark.
		-- set                    Sets a letter mark (will wait for input).
		-- delete                 Delete a letter mark (will wait for input).
		--
		-- set_bookmark[0-9]      Sets a bookmark from group[0-9].
		-- delete_bookmark[0-9]   Deletes all bookmarks from group[0-9].
		-- delete_bookmark        Deletes the bookmark under the cursor.
		-- next_bookmark          Moves to the next bookmark having the same type as the
		--                        bookmark under the cursor.
		-- prev_bookmark          Moves to the previous bookmark having the same type as the
		--                        bookmark under the cursor.
		-- next_bookmark[0-9]     Moves to the next bookmark of of the same group type. Works by
		--                        first going according to line number, and then according to buffer
		--                        number.
		-- prev_bookmark[0-9]     Moves to the previous bookmark of of the same group type. Works by
		--                        first going according to line number, and then according to buffer
		--                        number.
	},
})

-- <Plug>(Marks-set)
-- <Plug>(Marks-setnext)
-- <Plug>(Marks-toggle)
-- <Plug>(Marks-delete)
-- <Plug>(Marks-deleteline)
-- <Plug>(Marks-deletebuf)
-- <Plug>(Marks-preview)
-- <Plug>(Marks-next)
-- <Plug>(Marks-prev)
-- <Plug>(Marks-delete-bookmark)
-- <Plug>(Marks-next-bookmark)
-- <Plug>(Marks-prev-bookmark)
-- <Plug>(Marks-set-bookmark[0-9])
-- <Plug>(Marks-delete-bookmark[0-9])
-- <Plug>(Marks-next-bookmark[0-9])
-- <Plug>(Marks-prev-bookmark[0-9])
