local M = {}

---@type LazyPluginSpec
M.spec = {
    "robitx/gp.nvim",
    event = "VeryLazy",
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

        hooks = {
            -- example of adding command which writes unit tests for the selected code
            UnitTests = function(gp, params)
                local template = "I have the following code from {{filename}}:\n\n"
                    .. "```{{filetype}}\n{{selection}}\n```\n\n"
                    .. "Please respond by writing table driven unit tests for the code above."
                local agent = gp.get_command_agent()
                gp.Prompt(params, gp.Target.vnew, agent, template)
            end,

            CommitMessage = function(gp, params)
                local base_template = "You are an expert at following the Conventional Commit specification."
                    .. "Given the git diff listed below, please generate a detailed commit message for me and return it to me directly without explanation:"
                    .. "Use the summary line to describe the overall change, followed by an empty line, and then a more detailed, consice description of the change in the body in bullet points."
                    .. "If the commit only affects a single file, or one file has the main role in the change, please use the following format:"
                    .. "- feat|fix|docs|style|refactor|test|chore|revert(<affected-file or scope>): description"
                    .. "In the bullet points, use the following format:"
                    .. "- feat|fix|docs|style|refactor|test|chore|revert(<affected-file or scope>): description"
                    .. "\n\n```\n"
                    .. vim.fn.system("git diff --cached")
                    .. "\n```"

                local template = base_template

                -- If the branch name includes an issue ticket number, we use it to prefix the commit message.
                -- Example: bcd-1234-some-new-feature -> BCD-1234 feat: some new feature
                local current_branch = vim.fn.system("git rev-parse --abbrev-ref HEAD")
                local issue_id = string.match(current_branch, "^bcd%-(%d%d%d%d)")
                local prefix = issue_id and "BCD-" .. issue_id .. " " or ""

                if issue_id then
                    template = base_template
                        .. "\n\n"
                        .. "Please prefix the summary line with the following issue ID: "
                        .. prefix
                        .. "\n\n"
                        .. "Example: BCD-1234 feat: some new feature"
                end

                local agent = gp.get_command_agent()
                gp.Prompt(params, gp.Target.vnew, agent, template)
            end,

            -- TODO: This does not work yet
            -- example of usig enew as a function specifying type for the new buffer
            CodeReview = function(gp, params)
                local template = "I have the following code from {{filename}}:\n\n"
                    .. "```{{filetype}}\n{{selection}}\n```\n\n"
                    .. "Please analyze for code smells and suggest improvements."
                local agent = gp.get_chat_agent()
                gp.Prompt(params, gp.Target.vnew("markdown"), agent, template)
            end,

            Explain = function(gp, params)
                local template = "I have the following code from {{filename}}:\n\n"
                    .. "```{{filetype}}\n{{selection}}\n```\n\n"
                    .. "Please respond by explaining the code above."
                local agent = gp.get_chat_agent()
                gp.Prompt(params, gp.Target.popup, agent, template)
            end,

            -- example of making :%GpChatNew a dedicated command which
            -- opens new chat with the entire current buffer as a context
            BufferChatNew = function(gp, _)
                -- call GpChatNew command in range mode on whole buffer
                vim.cmd.vsplit()
                vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
            end,
        },

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
    keys = {
        {
            "<leader>in",
            "<cmd>GpChatNew vsplit<cr>",
            desc = "New Chat",
        },
        {
            "<leader>iN",
            "<cmd>GpBufferChatNew vsplit<cr>",
            desc = "New Chat with Buffer",
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
        {
            "<leader>im",
            "<cmd>GpCommitMessage<cr>",
            desc = "Generate Commit Message",
        },
        {
            "<leader>ie",
            "<cmd>GpExplain<cr>",
            desc = "Explain Code",
        },
        {
            "<leader>ir",
            ":<C-u>'<,'>GpCodeReview<cr>",
            desc = "Code Review",
            mode = "x",
        },
        {
            "<leader>ip",
            ":<C-u>'<,'>GpChatPaste<cr>",
            desc = "Pase selection to chat",
            mode = "x",
        },
    },
    config = function(_, opts)
        require("gp").setup(opts)
    end,
}

return M.spec
