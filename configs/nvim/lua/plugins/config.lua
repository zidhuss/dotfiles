local function load(name)
	local Util = require("lazy.core.util")
	for _, mod in ipairs({ "config." .. name }) do
		Util.try(function()
			require(mod)
		end, {
			msg = "Failed loading " .. mod,
			on_error = function(msg)
				local modpath = require("lazy.core.cache").find(mod)
				if modpath then
					Util.error(msg)
				end
			end,
		})
	end
end

load("options")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		load("keymaps")
	end,
})

return {}
