--[[
       _ _                             _           
 _ __ (_) |__  _ __ _   _   _ ____   _(_)_ __ ___  
| '_ \| | '_ \| '__| | | | | '_ \ \ / / | '_ ` _ \ 
| | | | | |_) | |  | |_| |_| | | \ V /| | | | | | |
|_| |_|_|_.__/|_|   \__,_(_)_| |_|\_/ |_|_| |_| |_|

]]--
                                                   
-- Set options
require("opts");

-- Load plugins via Packer
require("plugins");

-- Set autocommands
require("autocmd");

-- Set mappings
require("maps");

-- Load LSP
require("lsp/bash")
require("lsp/css")
require("lsp/ts")

