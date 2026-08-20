-- Autostart
-- https://wiki.hypr.land/0.56.0/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("swaync")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- Dark mode Config
	-- for libadwaita gtk4 apps you can use this command:
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'") -- for GTK4 apps

	-- for gtk3 apps you need to install adw-gtk3 theme (in arch linux sudo pacman -S adw-gtk-theme)
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'") -- for GTK3 apps
end)

-- Dark mode Config
-- for kde apps you need to install: sudo pacman -S qt5ct qt6ct kvantum kvantum breeze-icons
-- you will need to set dark theme for qt apps from kde more difficult thans with gnome :D:
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct") --  for Qt apps# Theme

-- Change cursor size
-- https://wiki.hypr.land/0.56.0/Hypr-Ecosystem/hyprcursor/#hyprcursor-themes
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Set XDG_MENU_PREFIX
-- https://wiki.archlinux.org/title/XDG_MIME_Applications
-- hl.env("XDG_MENU_PREFIX", "arch- kbuildsycoca6")
-- If not working use the following
hl.env("XDG_MENU_PREFIX", "arch-")

hl.config({
	cursor = {
		invisible = false,
		no_hardware_cursors = true,
	},

	misc = {
		render_unfocused_fps = 60,
	},

	debug = {
		disable_logs = false,
	},

	general = {
		gaps_in = 5,
		gaps_out = 0,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = { colors = { "rgba(595959aa)" } },
		},

		resize_on_border = false,

		allow_tearing = false,

		layout = "dwindle",
	},

	dwindle = {
		preserve_split = true,
		use_active_for_splits = true,
	},

	input = {
		kb_layout = "us",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.1,
		},

		kb_options = "caps:swapescape",
	},

	xwayland = {
		enabled = true,
		use_nearest_neighbor = false,
		force_zero_scaling = true,
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = { colors = { "rgba(1a1a1aee)" } },
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,

			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
	},
})

hl.window_rule({
	name = "no-border-on-floating",
	match = {
		float = true,
	},
	border_size = 0,
})

hl.window_rule({
	name = "probably-like-this",
	match = {
		class = "*",
	},
	suppress_event = "maximize",
})

hl.window_rule({
	name = "always-render-winboat",
	match = {
		class = "xfreerdp",
	},
	render_unfocused = true,
})

hl.window_rule({
	name = "zoom-fix",
	match = {
		class = "zoom",
	},
	no_follow_mouse = true,
	no_blur = true,
})

hl.window_rule({
	name = "timeshift-fix",
	match = {
		class = "timeshift-gtk",
	},
	tile = true,
})

local super = function(key)
	return "SUPER + " .. key
end

--
-- Closing app
--
hl.bind(super("SHIFT + Q"), hl.dsp.window.close())
hl.bind(super("CTRL + SHIFT + Q"), hl.dsp.window.kill())

--
-- Locking screen
--
hl.bind(super("M"), hl.dsp.exec_cmd("hyprlock"))
hl.bind(super("CTRL + SHIFT + ALT + M"), hl.dsp.exec_cmd("hyprshutdown"))

--
-- Fullscreen
--
hl.bind(super("F"), hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(super("SHIFT + F"), hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(super("CTRL + SHIFT + PERIOD"), hl.dsp.window.pseudo())
hl.bind(super("CTRL + SHIFT + MINUS"), hl.dsp.layout("togglesplit"))

--
-- App
--
hl.bind(super("Q"), hl.dsp.exec_cmd("ghostty"))
hl.bind(super("E"), hl.dsp.exec_cmd("dolphin"))
hl.bind(super("SPACE"), hl.dsp.exec_cmd("rofi -modi emoji -show drun -show-icons"))
hl.bind(super("PERIOD"), hl.dsp.exec_cmd("rofi -modi emoji -show emoji"))

--
-- Reload waybar
--
hl.bind(super("CTRL + SHIFT + ALT + W"), function()
	hl.dispatch(hl.dsp.exec_cmd("pkill waybar"))
	hl.dispatch(hl.dsp.exec_cmd("waybar &"))
end)

--
-- Shortcut
--
-- Screenshot
hl.bind(super("CTRL + SHIFT + S"), hl.dsp.exec_cmd("hyprshot -m region --clipboard-only --freeze"))
hl.bind(super("PRINT"), hl.dsp.exec_cmd("hyprshot -m window --freeze -o /home/ucul/own/screenshot"))
hl.bind(super("SHIFT + PRINT"), hl.dsp.exec_cmd("hyprshot -m region --freeze -o /home/ucul/own/screenshot"))

-- Notification
hl.bind(super("CTRL + SHIFT + N"), hl.dsp.exec_cmd("swaync-client -t -sW"))

-- Custom script
hl.bind(super("S"), hl.dsp.exec_cmd("$HOME/script/change-window.sh"))
hl.bind(super("SHIFT + S"), hl.dsp.exec_cmd("$HOME/script/move-window.sh"))

-- Media
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("CTRL + SHIFT + ALT + L", hl.dsp.exec_cmd("playerctl next"))
hl.bind("CTRL + SHIFT + ALT + K", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("CTRL + SHIFT + ALT + J", hl.dsp.exec_cmd("playerctl previous"))

-- Laptop multimedia
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

--
-- Floating
--
hl.bind(super("V"), hl.dsp.window.float({ action = "toggle" }))
hl.bind(super("SHIFT + V"), hl.dsp.window.pin({ action = "toggle" }))

local submap_resize = "resize"
hl.bind(super("CTRL + R"), hl.dsp.submap(submap_resize))
hl.define_submap(submap_resize, function()
	hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
	hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }))
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = -10, relative = true }))

	hl.bind("SHIFT + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
	hl.bind("SHIFT + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
	hl.bind("SHIFT + K", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))
	hl.bind("SHIFT + J", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))

	hl.bind("CTRL + SHIFT + L", hl.dsp.window.resize({ x = 200, y = 0, relative = true }))
	hl.bind("CTRL + SHIFT + H", hl.dsp.window.resize({ x = -200, y = 0, relative = true }))
	hl.bind("CTRL + SHIFT + K", hl.dsp.window.resize({ x = 0, y = 200, relative = true }))
	hl.bind("CTRL + SHIFT + J", hl.dsp.window.resize({ x = 0, y = -200, relative = true }))

	hl.bind("escape", hl.dsp.submap("reset"))
end)

--
-- Move Window position
--
hl.bind(super("mouse:272"), hl.dsp.window.drag(), { mouse = true }) -- ALT + LMB: Move a window
hl.bind(super("mouse:273"), hl.dsp.window.resize(), { mouse = true }) -- ALT + RMB: Resize a window

local submap_movewindow = "movewindow"
hl.bind(super("CTRL + M"), hl.dsp.submap(submap_movewindow))
hl.define_submap(submap_movewindow, function()
	hl.bind("L", hl.dsp.window.move({ x = 10, y = 0, relative = true }))
	hl.bind("H", hl.dsp.window.move({ x = -10, y = 0, relative = true }))
	hl.bind("J", hl.dsp.window.move({ x = 0, y = 10, relative = true }))
	hl.bind("K", hl.dsp.window.move({ x = 0, y = -10, relative = true }))

	hl.bind("SHIFT + L", hl.dsp.window.move({ x = 50, y = 0, relative = true }))
	hl.bind("SHIFT + H", hl.dsp.window.move({ x = -50, y = 0, relative = true }))
	hl.bind("SHIFT + J", hl.dsp.window.move({ x = 0, y = 50, relative = true }))
	hl.bind("SHIFT + K", hl.dsp.window.move({ x = 0, y = -50, relative = true }))

	hl.bind("CTRL + SHIFT + L", hl.dsp.window.move({ x = 200, y = 0, relative = true }))
	hl.bind("CTRL + SHIFT + H", hl.dsp.window.move({ x = -200, y = 0, relative = true }))
	hl.bind("CTRL + SHIFT + J", hl.dsp.window.move({ x = 0, y = 200, relative = true }))
	hl.bind("CTRL + SHIFT + K", hl.dsp.window.move({ x = 0, y = -200, relative = true }))

	hl.bind("escape", hl.dsp.submap("reset"))
end)

--
-- move focus
--
hl.bind(super("J"), hl.dsp.focus({ direction = "down" }))
hl.bind(super("K"), hl.dsp.focus({ direction = "up" }))
hl.bind(super("H"), hl.dsp.focus({ direction = "left" }))
hl.bind(super("L"), hl.dsp.focus({ direction = "right" }))

hl.bind(super("down"), hl.dsp.focus({ direction = "down" }))
hl.bind(super("up"), hl.dsp.focus({ direction = "up" }))
hl.bind(super("left"), hl.dsp.focus({ direction = "left" }))
hl.bind(super("right"), hl.dsp.focus({ direction = "right" }))

hl.bind(super("tab"), function()
	hl.dispatch(hl.dsp.window.cycle_next({ next = true, tiled = true, floating = true }))
	hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

--
-- Move window across screen
--
hl.bind(super("SHIFT + H"), hl.dsp.window.swap({ direction = "left" }))
hl.bind(super("SHIFT + L"), hl.dsp.window.swap({ direction = "right" }))
hl.bind(super("SHIFT + J"), hl.dsp.window.swap({ direction = "down" }))
hl.bind(super("SHIFT + K"), hl.dsp.window.swap({ direction = "up" }))

hl.bind(super("mouse_up"), hl.dsp.focus({ workspace = "e-1" }))
hl.bind(super("mouse_down"), hl.dsp.focus({ workspace = "e+1" }))

--
-- Change focus on workspace
--
hl.bind(super("1"), hl.dsp.focus({ workspace = "1" }))
hl.bind(super("2"), hl.dsp.focus({ workspace = "2" }))
hl.bind(super("3"), hl.dsp.focus({ workspace = "3" }))
hl.bind(super("4"), hl.dsp.focus({ workspace = "4" }))
hl.bind(super("5"), hl.dsp.focus({ workspace = "5" }))
hl.bind(super("6"), hl.dsp.focus({ workspace = "6" }))
hl.bind(super("7"), hl.dsp.focus({ workspace = "7" }))
hl.bind(super("8"), hl.dsp.focus({ workspace = "8" }))
hl.bind(super("9"), hl.dsp.focus({ workspace = "9" }))
hl.bind(super("0"), hl.dsp.focus({ workspace = "10" }))

hl.bind(super("N"), hl.dsp.focus({ workspace = "+1" }))
hl.bind(super("P"), hl.dsp.focus({ workspace = "-1" }))

--
-- Move window to other workspace
--
hl.bind(super("SHIFT + 1"), hl.dsp.window.move({ workspace = "1" }))
hl.bind(super("SHIFT + 2"), hl.dsp.window.move({ workspace = "2" }))
hl.bind(super("SHIFT + 3"), hl.dsp.window.move({ workspace = "3" }))
hl.bind(super("SHIFT + 4"), hl.dsp.window.move({ workspace = "4" }))
hl.bind(super("SHIFT + 5"), hl.dsp.window.move({ workspace = "5" }))
hl.bind(super("SHIFT + 6"), hl.dsp.window.move({ workspace = "6" }))
hl.bind(super("SHIFT + 7"), hl.dsp.window.move({ workspace = "7" }))
hl.bind(super("SHIFT + 8"), hl.dsp.window.move({ workspace = "8" }))
hl.bind(super("SHIFT + 9"), hl.dsp.window.move({ workspace = "9" }))
hl.bind(super("SHIFT + 0"), hl.dsp.window.move({ workspace = "10" }))

hl.bind(super("SHIFT + N"), hl.dsp.window.move({ workspace = "+1" }))
hl.bind(super("SHIFT + P"), hl.dsp.window.move({ workspace = "-1" }))

hl.bind(super("SHIFT + mouse_up"), hl.dsp.window.move({ workspace = "-1" }))
hl.bind(super("SHIFT + mouse_down"), hl.dsp.window.move({ workspace = "+1" }))

--
-- move between monitor
--
hl.bind(super("SHIFT + COMMA"), hl.dsp.workspace.move({ monitor = "-1" }))
hl.bind(super("SHIFT + PERIOD"), hl.dsp.workspace.move({ monitor = "+1" }))

-- Dynamically load monitor config
local has_monitor_config = pcall(require, "culs.monitor")
if not has_monitor_config then
	print("No monitor config found")
end
