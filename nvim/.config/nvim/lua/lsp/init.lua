local callbacks = require("lsp.callbacks")
local capabilities = callbacks.capabilities
local on_attach = callbacks.on_attach

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

for _, server in ipairs({
	"clang",
	"css",
	"docker",
	"dotnet",
	"go",
	"json",
	"lua",
	"markdown",
	"nix",
	"php",
	"python",
	"ruby",
	"rust",
	"sourcekit",
	"terraform",
	"typescript",
	"typst",
	"yaml",
	"zig",
}) do
	require("lsp." .. server).setup(on_attach, capabilities)
end
