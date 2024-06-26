-- Glorious list of warnings: https://luacheck.readthedocs.io/en/stable/warnings.html
ignore = {
    "631", -- Too long lines
    "212", -- Unused argument, In the case of callback function, _arg_name is easier to understand than _, so this option is set to off.
    "411", -- Redefining a local variable.
    "412", -- Redefining an argument.
    "422", -- Shadowing an argument
    "122", -- Indirectly setting a readonly global
    "121", -- setting read-only global variable
    "111", -- setting read-only global variable
    "112", -- setting read-only global variable
}

-- Global objects defined by the C code
read_globals = {
    "vim",
}
