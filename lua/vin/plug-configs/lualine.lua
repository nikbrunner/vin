local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local gps_status_ok, gps = pcall(require, "nvim-gps")
if not gps_status_ok then
	return
end

local lualine_theme
local current_colorscheme = Vin.lib.get_current_colorscheme()

-- if Vin.colorscheme.arvo.is_enabled then
if current_colorscheme == "onenord" and Vin.colorscheme.arvo.is_enabled then
	lualine_theme = require("vin.colorscheme.arvo.lualine").lualine_theme()
elseif current_colorscheme == "material" then
	lualine_theme = "material-stealth"
else
	lualine_theme = "auto"
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = lualine_theme,
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },

		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },

		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },

		disabled_filetypes = {
			"alpha",
			-- "neo-tree",
			-- "",
		},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				padding = 3,
			},
		},
		lualine_b = {
			{
				"branch",
				padding = 3,
			},
			"diff",
			"diagnostics",
		},
		lualine_c = {
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				path = 1, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory

				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
					readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[No Name]", -- Text to show for unnamed buffers.
				},
			},

			{ gps.get_location, cond = gps.is_available },
		},
		lualine_x = {},
		lualine_y = {
			{
				"filetype",
				colored = true, -- Displays filetype icon in color if set to true
				icon_only = false, -- Display only an icon for filetype
				icon = { align = "left" }, -- Display filetype icon on the right hand side
				-- icon =    {'X', align='right'}
				-- Icon string ^ in table is ignored in filetype component
				padding = 3,
			},
		},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
