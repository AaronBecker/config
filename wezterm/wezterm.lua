local wezterm = require("wezterm")
local config = wezterm.config_builder()

local is_darwin =  wezterm.target_triple:find("darwin") ~= nil

config.color_scheme = "Catppuccin Mocha"
if is_darwin then
	config.font_size = 16
else
	config.font_size = 14
end
config.font = wezterm.font_with_fallback {
	{
		family = 'Fira Code',
		harfbuzz_features = { 'calt=0' },
	},
	{
		family = 'JetBrains Mono',
		harfbuzz_features = { 'calt=0' },
	},
}


config.use_fancy_tab_bar = true
config.window_decorations = 'TITLE|RESIZE'

config.audible_bell = "Disabled"
config.visual_bell = {
  fade_in_duration_ms = 75,
  fade_out_duration_ms = 75,
  target = 'CursorColor',
}

local function move_pane(key, direction)
    return {
        key = key,
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection(direction),
    }
end
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    -- Send "CTRL-W" to the terminal when pressing CTRL-W, CTRL-W
    {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
    },
    {
        key = '4',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = '5',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    move_pane('j', 'Down'),
    move_pane('k', 'Up'),
    move_pane('h', 'Left'),
    move_pane('l', 'Right'),
    {
        key = 'w',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    }
}

config.mouse_bindings = {
    -- On click, select text instead of opening links
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'NONE',
        action = wezterm.action.CompleteSelection 'PrimarySelection',
    },
    -- CTRL-click opens links
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    -- Disable the 'Down' event of CTRL-click to avoid weird program behaviors
    {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = wezterm.action.Nop,
    },
}

config.ssh_domains = {
    {
        name = 'basa',
        remote_address = 'basa.c.googlers.com',
        username = 'akb',
        assume_shell = 'Posix',
    },
}

return config
