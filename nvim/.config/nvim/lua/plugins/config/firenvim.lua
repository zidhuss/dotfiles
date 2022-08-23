-- -- Firenvim setup
-- function _G.FirenvimSetup(channel)
-- 	local channel_info = vim.api.nvim_get_chan_info(channel)
-- 	if channel_info.client and channel_info.client.name == "Firenvim" then
-- 		vim.opt.laststatus = 0
-- 	end
-- end

vim.cmd([[

  if exists('g:started_by_firenvim')
    set laststatus=0
    set guifont=FiraCode\ Nerd\ Font:h18
  endif


  au BufEnter github.com_*.txt set filetype=markdown
  au BufEnter reddit.com_*.txt set filetype=markdown
  let g:firenvim_config = { "globalSettings": { "alt": "all", }, "localSettings": { ".*": { "cmdline": "neovim", "content": "text", "priority": 0, "selector": "textarea", "takeover": "never", }, } }
  let fc = g:firenvim_config["localSettings"]
  let fc["https?://mail.google.com/"] = { "takeover": "never", "priority": 1 }
  let fc["https?://discord.com/"] = { "takeover": "never", "priority": 1 }
  let fc["https?://github.com/"] = { "takeover": "always", "priority": 1 }
]])
