local wezterm = require("wezterm")

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "VibrantInk"
	else
		return "primary"
	end
end

wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

return {
	font = wezterm.font("FuraCode Nerd Font"),
	hide_tab_bar_if_only_one_tab = true,
	send_composed_key_when_left_alt_is_pressed = true,
	term = "wezterm",
}
