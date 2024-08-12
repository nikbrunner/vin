local M = {}

---@type LazyPluginSpec
M.spec = {
    "robitx/gp.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>in",
            "<cmd>GpChatNew vsplit<cr>",
            desc = "New Chat",
        },
        {
            "<leader>it",
            "<cmd>GpChatToggle vsplit<cr>",
            desc = "Toggle Last Chat",
        },
        {
            "<leader>if",
            "<cmd>GpChatFinder<cr>",
            desc = "Find Chat",
        },
    },
    opts = {
        ---@diagnostic disable-next-line: param-type-mismatch
        state_dir = vim.fn.stdpath("config"):gsub("/$", "") .. "/gp/persisted",
        ---@diagnostic disable-next-line: param-type-mismatch
        chat_dir = vim.fn.stdpath("config"):gsub("/$", "") .. "/gp/chats",

        providers = {
            openai = {
                endpoint = "https://api.openai.com/v1/chat/completions",
                secret = os.getenv("OPENAI_API_KEY"),
            },
            anthropic = {
                endpoint = "https://api.anthropic.com/v1/messages",
                secret = os.getenv("ANTHROPIC_API_KEY"),
            },
        },

        default_command_agent = "ChatClaude-3-5-Sonnet",
        default_chat_agent = "ChatClaude-3-5-Sonnet",

        agents = {
            {
                name = "ChatGPT4",
                chat = true,
                command = false,
                -- string with model name or table with model name and parameters
                -- model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
                model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
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
                provider = "anthropic",
                name = "ChatClaude-3-5-Sonnet",
                chat = true,
                command = false,
                model = { model = "claude-3-5-sonnet-20240620", temperature = 0.8, top_p = 1 },
                system_prompt = "You are a general AI assistant with expertise in coding.\n\n"
                    .. "Your main coding stack includes TypeScript, SCSS, CSS, JavaScript, HTML, and some Go.\n\n"
                    .. "Please adhere to these guidelines when responding:\n\n"
                    .. "- If unsure, admit you don't know rather than guessing.\n"
                    .. "- Ask for clarification when needed to provide better answers.\n"
                    .. "- Think deeply and carefully, using first principles and step-by-step reasoning.\n"
                    .. "- Start with a broad perspective before focusing on details.\n"
                    .. "- Use the Socratic method to enhance thinking and coding skills.\n"
                    .. "- When coding is required, provide complete code without omissions.\n"
                    .. "- Approach each task confidently - you've got this!",
            },
        },
    },
    config = function(_, opts)
        require("gp").setup(opts)
    end,
}

return M.spec
