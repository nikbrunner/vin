local M = {}

---@type LazySpec
M.spec = {
    "robitx/gp.nvim",
    event = "VeryLazy",
    keys = {
        -- TODO: setup
    },
    opts = {
        openai_api_key = os.getenv("OPENAI_API_KEY"),
        openai_api_endpoint = "https://api.openai.com/v1/chat/completions",

        state_dir = vim.fn.stdpath("config"):gsub("/$", "") .. "/gp/persisted",
        chat_dir = vim.fn.stdpath("config"):gsub("/$", "") .. "/gp/chats",

        -- default command agents (model + persona)
        -- name, model and system_prompt are mandatory fields
        -- to use agent for chat set chat = true, for command set command = true
        -- to remove some default agent completely set it just with the name like:
        agents = {
            {
                name = "ChatGPT4",
                chat = true,
                command = false,
                -- string with model name or table with model name and parameters
                model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
                -- system prompt (use this to specify the persona/role of the AI)
                system_prompt = "You are a general AI assistant.\n\n"
                    .. "The user provided the additional info about how they would like you to respond:\n\n"
                    .. "- If you're unsure don't guess and say you don't know instead.\n"
                    .. "- Ask question if you need clarification to provide better answer.\n"
                    .. "- Think deeply and carefully from first principles step by step.\n"
                    .. "- Zoom out first to see the big picture and then zoom in to details.\n"
                    .. "- Use Socratic method to improve your thinking and coding skills.\n"
                    .. "- Don't elide any code from your output if the answer requires coding.\n"
                    .. "- Take a deep breath; You've got this!\n",
            },
            {
                name = "ChatGPT3-5",
                chat = true,
                command = false,
                -- string with model name or table with model name and parameters
                model = { model = "gpt-3.5-turbo-1106", temperature = 1.1, top_p = 1 },
                -- system prompt (use this to specify the persona/role of the AI)
                system_prompt = "You are a general AI assistant.\n\n"
                    .. "The user provided the additional info about how they would like you to respond:\n\n"
                    .. "- If you're unsure don't guess and say you don't know instead.\n"
                    .. "- Ask question if you need clarification to provide better answer.\n"
                    .. "- Think deeply and carefully from first principles step by step.\n"
                    .. "- Zoom out first to see the big picture and then zoom in to details.\n"
                    .. "- Use Socratic method to improve your thinking and coding skills.\n"
                    .. "- Don't elide any code from your output if the answer requires coding.\n"
                    .. "- Take a deep breath; You've got this!\n",
            },
            {
                name = "CodeGPT4",
                chat = false,
                command = true,
                -- string with model name or table with model name and parameters
                model = { model = "gpt-4-1106-preview", temperature = 0.8, top_p = 1 },
                -- system prompt (use this to specify the persona/role of the AI)
                system_prompt = "You are an AI working as a code editor.\n\n"
                    .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
                    .. "START AND END YOUR ANSWER WITH:\n\n```",
            },
            {
                name = "CodeGPT3-5",
                chat = false,
                command = true,
                -- string with model name or table with model name and parameters
                model = { model = "gpt-3.5-turbo-1106", temperature = 0.8, top_p = 1 },
                -- system prompt (use this to specify the persona/role of the AI)
                system_prompt = "You are an AI working as a code editor.\n\n"
                    .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
                    .. "START AND END YOUR ANSWER WITH:\n\n```",
            },
        },
    },
    config = function(_, opts)
        require("gp").setup(opts)
    end,
}

return M.spec
