local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[    ,.-.                        ,.-·.                ,.         ,·´'; '       ]],
	[[   /   ';\ '                    /    ;'\'         ;'´*´ ,'\       ,'  ';'\°   ]],
	[[  ';    ;:'\      ,·'´';        ;    ;:::\        ;    ';::\      ;  ;::'\    ]],
	[[   ';   ;::;     ,'  ,''\      ';    ;::::;'      ;      '\;'      ;  ;:::;   ]],
	[[   ';   ';::;   ,'  ,':::'\'     ;   ;::::;      ,'  ,'`\   \      ;  ;:::;   ]],
	[[    ';   ;:;  ,'  ,':::::;'    ';  ;'::::;       ;  ;::;'\  '\    ;  ;:::;    ]],
	[[     ;   ;:;'´ ,'::::::;'  '   ;  ';:::';       ;  ;:::;  '\  '\ ,'  ;:::;'   ]],
	[[     ';   '´ ,·':::::;'        ';  ;::::;'     ,' ,'::;'     '\   ¨ ,'\::;'   ]],
	[[      ,'   ,.'\::;·´           \*´\:::;‘     ;.'\::;        \`*´\::\; °       ]],
	[[      \`*´\:::\;     ‘         '\::\:;'      \:::\'          '\:::\:' '       ]],
	[[       '\:::\;'                   `*´‘         \:'             `*´'‚          ]],
	[[         `*´‘                                                                 ]],
	[[                                                                              ]],
}

dashboard.section.buttons.val = {
	dashboard.button("p", "  Find project", ":Telescope projects<CR>"),
	dashboard.button("f", "  Find file", ":FzfLua files<CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
	dashboard.button("r", "  Recently used files", ":FzfLua oldfiles<CR>"),
	dashboard.button("t", "  Find text", ":FzfLua live_grep_native<CR>"),
	dashboard.button(".", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
	return "https://nibru.dev"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
