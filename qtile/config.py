from libqtile import bar, layout, widget
from libqtile.backend.wayland import InputConfig
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
import os, random

colors = {
    "background": "#282A36",
    "selection": "#44475A",
    "foreground": "#F8F8F2",
    "comment": "#6272A4",
    "cyan": "#8BE9FD",
    "green": "#50FA7B",
    "orange": "#FFB86C",
    "pink": "#FF79C6",
    "purple": "#BD93F9",
    "red": "#FF5555",
    "yellow": "#F1FA8C",
}

cursor_warp = True
focus_on_window_activation = "urgent"

path = os.path.expanduser("~/media/pix/wallpapers/")
wallpaper = path + random.choice(os.listdir(path))

prompt = widget.Prompt()
spacer = widget.Spacer()
notify = widget.Notify(background=colors["selection"])
clock = widget.Clock()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentScreen(),
                widget.GroupBox(),
                prompt,
                spacer,
                notify,
                clock,
            ],
            24,
            border_color=colors["comment"],
            border_width=[0, 0, 2, 0],
        ),
        wallpaper=wallpaper,
        wallpaper_mode="fill",
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentScreen(),
                widget.GroupBox(),
                prompt,
                spacer,
                notify,
                clock,
            ],
            24,
            border_color=colors["comment"],
            border_width=[0, 0, 2, 0],
        ),
        wallpaper=wallpaper,
        wallpaper_mode="fill",
    ),
]

widget_defaults = dict(
    active=colors["foreground"],
    active_color=colors["green"],
    background=colors["background"],
    background_low=colors["background"],
    background_urgent=colors["red"],
    borderwidth=2,
    cursor_color=colors["cyan"],
    cursorblink=0,
    disable_drag=True,
    font="monospace",
    fontsize=16,
    foreground=colors["foreground"],
    foreground_low=colors["foreground"],
    foreground_urgent=colors["background"],
    format="%F %T%z",
    highlight_method="block",
    ignore_dups_history=True,
    inactive=colors["comment"],
    inactive_color=colors["red"],
    other_current_screen_border=colors["background"],
    other_screen_border=colors["background"],
    padding=10,
    rounded=False,
    this_current_screen_border=colors["selection"],
    this_screen_border=colors["selection"],
    urgent_alert_method="text",
    urgent_text=colors["red"],
    visual_bell_color=colors["red"],
)

groups = [Group(group) for group in "12345"]

layouts = [
    layout.Spiral(
        border_focus=colors["comment"],
        border_normal=colors["selection"],
        border_width=2,
        margin=10,
    ),
]

floating_layout = layout.Floating(
    border_focus=colors["comment"],
    border_normal=colors["selection"],
    border_width=2
)

keys = [
    Key(["mod4", "shift"], "1", lazy.window.togroup("1")),
    Key(["mod4", "shift"], "2", lazy.window.togroup("2")),
    Key(["mod4", "shift"], "3", lazy.window.togroup("3")),
    Key(["mod4", "shift"], "4", lazy.window.togroup("4")),
    Key(["mod4", "shift"], "5", lazy.window.togroup("5")),
    Key(["mod4", "shift"], "backspace", lazy.spawn("pulsemixer --toggle-mute")),
    Key(["mod4", "shift"], "comma", lazy.window.toscreen(0)),
    Key(["mod4", "shift"], "equal", lazy.spawn("pulsemixer --change-volume +20")),
    Key(["mod4", "shift"], "j", lazy.layout.shuffle_down()),
    Key(["mod4", "shift"], "k", lazy.layout.shuffle_up()),
    Key(["mod4", "shift"], "minus", lazy.spawn("pulsemixer --change-volume -20")),
    Key(["mod4", "shift"], "period", lazy.window.toscreen(1)),
    Key(["mod4", "shift"], "q", lazy.shutdown()),
    Key(["mod4", "shift"], "r", lazy.reload_config()),
    Key(["mod4", "shift"], "return", lazy.spawn("alacritty")),
    Key(["mod4", "shift"], "s", lazy.spawn("flameshot gui")),
    Key(["mod4"], "1", lazy.group["1"].toscreen()),
    Key(["mod4"], "2", lazy.group["2"].toscreen()),
    Key(["mod4"], "3", lazy.group["3"].toscreen()),
    Key(["mod4"], "4", lazy.group["4"].toscreen()),
    Key(["mod4"], "5", lazy.group["5"].toscreen()),
    Key(["mod4"], "backspace", lazy.spawn("playerctl play-pause")),
    Key(["mod4"], "comma", lazy.to_screen(0)),
    Key(["mod4"], "equal", lazy.spawn("playerctl next")),
    Key(["mod4"], "f", lazy.window.toggle_fullscreen()),
    Key(["mod4"], "h", lazy.layout.shrink_main()),
    Key(["mod4"], "j", lazy.group.next_window()),
    Key(["mod4"], "k", lazy.group.prev_window()),
    Key(["mod4"], "l", lazy.layout.grow_main()),
    Key(["mod4"], "minus", lazy.spawn("playerctl previous")),
    Key(["mod4"], "n", lazy.layout.normalize()),
    Key(["mod4"], "period", lazy.to_screen(1)),
    Key(["mod4"], "r", lazy.spawncmd()),
    Key(["mod4"], "return", lazy.layout.swap_main()),
    Key(["mod4"], "s", lazy.spawn("flameshot full")),
    Key(["mod4"], "t", lazy.window.toggle_floating()),
    Key(["mod4"], "tab", lazy.widget["notify"].clear()),
    Key(["mod4"], "w", lazy.window.kill()),
]

mouse = [
    Click(["mod4"], "Button2", lazy.window.bring_to_front()),
    Drag(["mod4"], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag(["mod4"], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
]
