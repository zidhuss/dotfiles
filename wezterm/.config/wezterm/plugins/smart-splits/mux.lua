---@param pane _.wezterm.Pane
local get_process_name = function(pane)
	local process_name = pane:get_foreground_process_name()
	if process_name == nil then
		return nil
	end
	return string.gsub(process_name, "(.*[/\\])(.*)", "%2")
end

---@param process string
---@param pane _.wezterm.Pane
local has_foreground_process = function(process, pane)
	return get_process_name(pane) == process
end

---@param pane _.wezterm.Pane
local has_mux = function(pane)
	local is_zellij = has_foreground_process("zellij", pane)
	local is_tmux = has_foreground_process("tmux", pane)

	-- this is set by the smart-splits.nvim plugin, and unset on ExitPre in Neovim
	local is_vim = pane:get_user_vars().IS_NVIM == "true"

	return is_vim or is_tmux or is_zellij
end

return {
	has_mux = has_mux,
}
