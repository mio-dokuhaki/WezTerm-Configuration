local wezterm = require("wezterm")

local function BaseName(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-window-title", function(tab)
	return BaseName(tab.active_pane.foreground_process_name)
end)

local HEADER = "" -- 文字化けしちゃってるかもしれませんが、アイコンフォント入ってます。

local SYMBOL_COLOR = { "#ffb2cc", "#ffb2cc" }
local FONT_COLOR = { "#00d200", "#00d200" }
local BACK_COLOR = "#2d2d2d"
local HOVER_COLOR = "#434343"

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local index = tab.is_active and 1 or 2

	local bg = hover and HOVER_COLOR or BACK_COLOR
	local zoomed = tab.active_pane.is_zoomed and "🔎 " or " "

	return {
		{ Foreground = { Color = SYMBOL_COLOR[index] } },
		{ Background = { Color = bg } },
		{ Text = HEADER .. zoomed },

		{ Foreground = { Color = FONT_COLOR[index] } },
		{ Background = { Color = bg } },
		{ Text = BaseName(tab.active_pane.title) },
	}
end)

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)
