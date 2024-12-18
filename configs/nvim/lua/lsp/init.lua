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
	"html",
	"json",
	"lua",
	"markdown",
	"nix",
	"php",
	"python",
	"rego",
	"ruby",
	"rust",
	"sourcekit",
	"terraform",
	"toml",
	"typescript",
	"typst",
	"xml",
	"yaml",
	"zig",
}) do
	require("lsp." .. server).setup(on_attach, capabilities)
end
