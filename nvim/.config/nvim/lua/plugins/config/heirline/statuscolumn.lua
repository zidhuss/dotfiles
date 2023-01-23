local shared = require("plugins.config.heirline.shared")

local LineNumbers = { provider = "%=%4{v:wrap ? '' : &nu ? (&rnu && v:relnum ? v:relnum : v:lnum) : ''}" }

local Signs = { provider = "%s" }

local Folds = { provider = "%C" }

local statuscolumn = {
	LineNumbers,
	shared.Space,
	Signs,
	Folds,
}

return statuscolumn
