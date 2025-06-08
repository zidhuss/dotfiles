local wezterm = require("wezterm")

local config = wezterm.config_builder()

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

local font_family = "Berkeley Mono Variable"
config.font = wezterm.font({
	family = font_family,
})

config.hide_tab_bar_if_only_one_tab = true
config.send_composed_key_when_left_alt_is_pressed = true
config.term = "wezterm"

config.leader = { key = "a", mods = "CTRL" }
config.tab_bar_at_bottom = true

local wez_tmux = require("plugins.wez-tmux")
local smart_splits = require("plugins.smart-splits")

wez_tmux.apply_to_config(config)
smart_splits.apply_to_config(config)

table.insert(config.keys, {
	key = "w",
	mods = "CMD",
	action = wezterm.action.CloseCurrentPane({ confirm = true }),
})

table.insert(config.keys, {
	key = "k",
	mods = "CMD",
	action = wezterm.action.ActivateCommandPalette,
})

return config
