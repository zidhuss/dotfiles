" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/abri/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/abri/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/abri/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/abri/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/abri/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ale = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/ale"
  },
  firenvim = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pears.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\npears\frequire\0" },
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/pears.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  scrivener = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/scrivener"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets"
  },
  ["vscode-go"] = {
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/vscode-go"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n|\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fplugins\1\0\0\rspelling\1\0\0\1\0\2\fenabled\1\16suggestions\3\20\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/abri/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: todo-comments.nvim
time("Config for todo-comments.nvim", true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time("Config for todo-comments.nvim", false)
-- Config for: trouble.nvim
time("Config for trouble.nvim", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time("Config for trouble.nvim", false)
-- Config for: pears.nvim
time("Config for pears.nvim", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\npears\frequire\0", "config", "pears.nvim")
time("Config for pears.nvim", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\n|\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fplugins\1\0\0\rspelling\1\0\0\1\0\2\fenabled\1\16suggestions\3\20\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
