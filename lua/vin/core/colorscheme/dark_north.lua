local M = {}

M.slate_gray = {
	"#101216",
	"#12151A",
	"#15171D",
	"#171A20",
	"#191D23",
	"#1C1F26",
	"#1E222A",
}

local bg_githbub_dimmed = "#22272e"
local bg_nord = "#2E3440"
local bg_dark_north = "#1D2530"

M.colors = function()
	return {
		fg_dark = "#B1BDD3",
		fg = "#e5e9f0",
		fg_light = "#eceff4",
		bg = bg_dark_north,
		bg_light = M.slate_gray[6],
		gray = "#646A76",
		light_gray = "#6C7A96",
		cyan = "#70a9a1",
		blue = "#81A1C1",
		dark_blue = "#5E81AC",
		green = "#79B791",
		light_green = "#ABD1B5",
		dark_red = "#BF616A",
		red = "#D57780",
		light_red = "#DE878F",
		pink = "#E85B7A",
		dark_pink = "#E44675",
		orange = "#D08F70",
		yellow = "#EBCB8B",
		purple = "#DD99BB",
		light_purple = "#B48EAD",
		none = "NONE",

		-- active = M.slate_gray[6],
		active = "#2A3646",
		-- float = M.slate_gray[1],
		float = "#2A3646",
		-- highlight = M.slate_gray[6],
		-- highlight_dark = M.slate_gray[5],
		-- selection = colors_darker.slate_gray_3,
	}
end

M.custom_highlights = function()
	return {

		TSConstructor = { fg = M.colors().orange },
		TSFunction = { fg = M.colors().yellow },
		TSVariable = { fg = M.colors().fg_dark },
		TSMethod = { fg = M.colors().yellow },
		TSKeyword = { fg = M.colors().dark_blue },
		TSType = { fg = M.colors().cyan },
		TSProperty = { fg = M.colors().blue },
		TSParameter = { fg = M.colors().fg },
		TSString = { fg = M.colors().light_green },

		StorageClass = { fg = M.colors().fg_dark }, -- CSS Property
		sassMixing = { fg = M.colors().pink }, -- CSS Property
		sassVariable = { fg = M.colors().orange }, -- CSS Property
		sassDefinition = { fg = M.colors().dark_blue }, -- CSS Property
	}
end

return M
