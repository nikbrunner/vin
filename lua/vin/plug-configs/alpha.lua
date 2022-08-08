local present, alpha = pcall(require, "alpha")
if not present then
	return
end

local function vim_version()
	local version = vim.version()
	local version_string = "Neovim "
		.. version.major
		.. "."
		.. version.minor
		.. "."
		.. version.patch

	return {
		type = "text",
		val = version_string,
		opts = {
			position = "center",
			hl = "String",
		},
	}
end

local function getGreeting(name)
	local tableTime = os.date("*t")
	local hour = tableTime.hour
	local greetingsTable = {
		[1] = "  It's bedtime",
		[2] = "  Good morning",
		[3] = "  Good afternoon",
		[4] = "  Good evening",
		[5] = "望 Good night",
	}
	local greetingIndex = ""
	if hour == 23 or hour < 7 then
		greetingIndex = 1
	elseif hour < 12 then
		greetingIndex = 2
	elseif hour >= 12 and hour < 18 then
		greetingIndex = 3
	elseif hour >= 18 and hour < 21 then
		greetingIndex = 4
	elseif hour >= 21 then
		greetingIndex = 5
	end
	return greetingsTable[greetingIndex] .. ", " .. name
end

local userName = "Nik"
local greeting = getGreeting(userName)

local greetHeading = {
	type = "text",
	val = greeting,
	opts = {
		position = "center",
		hl = "String",
	},
}

-- TODO Fix for Linux
local plugins = ""
if vim.fn.has("linux") == 1 or vim.fn.has("mac") == 1 then
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer"

	local handle = io.popen(
		"fd -d 2 . " .. install_path .. ' | grep pack | wc -l | tr -d "\n" '
	)

	if handle == nil then
		return nil
	end

	plugins = handle:read("*a")
	handle:close()

	plugins = plugins:gsub("^%s*(.-)%s*$", "%1")
else
	plugins = "N/A"
end

local pluginCount = {
	type = "text",
	val = "  " .. plugins .. " plugins",
	opts = {
		position = "center",
		hl = "String",
	},
}

local quote = [[
“We are more often frightened than hurt; 
and we suffer more in imagination than in reality.”
]]
local quoteAuthor = "Seneca"
local fullQuote = quote .. "\n \n                  - " .. quoteAuthor

local fortune = {
	type = "text",
	val = fullQuote,
	opts = {
		position = "center",
		hl = "Comment",
	},
}

local function button(sc, txt, keybind)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		text = txt,
		shortcut = sc,
		cursor = 6,
		width = 19,
		align_shortcut = "right",
		hl_shortcut = "Number",
		hl = "Function",
	}

	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		button(".", "   Curr. Dir", ":edit .<CR>"),
		button("l", "   Load", ":SessionManager load_session<CR>"),
		button("h", "   History", ":Telescope oldfiles<CR>"),
		button("p", "   Projects", ":Telescope projects<CR>"),
		button("e", "   New Empty", ":ene <BAR> startinsert<CR>"),
		button("c", "   Config", ":e ~/.config/nvim/<CR>"),
		button("q", "   Quit", ":qa!<CR>"),
	},
	opts = {
		position = "center",
		spacing = 1,
	},
}

local section = {
	buttons = buttons,
	greetHeading = greetHeading,
	vim_version = vim_version(),
	pluginCount = pluginCount,
}

local opts = {
	layout = {
		{ type = "padding", val = 4 },
		section.greetHeading,
		{ type = "padding", val = 3 },
		section.vim_version,
		section.pluginCount,
		{ type = "padding", val = 3 },
		section.buttons,
		{ type = "padding", val = 2 },
	},
	opts = {
		margin = 44,
	},
}
alpha.setup(opts)
