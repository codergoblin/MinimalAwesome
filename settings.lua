return {
    commands = {
        screensaver = "i3lock -u -c 000000; sleep 4; xset dpms force off",
        volumeUp = "amixer -D pulse sset Master 10%+",
        volumeDown = "amixer -D pulse sset Master 10%-",
        volumeMute = "amixer set Master toggle",
        screenshot = "PIC=\"$HOME/Pictures/Screenshot_`date +\"%Y-%m-%d %H:%M\"`.png\" ; shutter -s -e -o=$PIC && copyq write image/png - < $PIC && copyq select 0"
    },
    menu = {
        {
            "tools",
            {
                { "disk management", "gnome-disks" },
                { "disk space", "baobab" },
                { "screen management", "arandr" },
                { "themes", "lxappearance" },
                { "sound", "alsamixergui" },
                { "default apps", "exo-preferred-applications" },
                {
                    "wine",
                    {
                        { "desktop", "wine explorer /desktop=foo,800x600" },
                        { "config", "winecfg" },
                        { "tricks", "winetricks" },
                    }
                },
                { "restart", awesome.restart },
                { "quit", awesome.quit },
            }
        },
        {
            "Debian", debian.menu.Debian_menu.Debian
        }
    },
    tags = {
        "1",
        "2",
        "3",
        "4",
        "5"
    },
    keyboard_layouts = {
        { "us", "", "US" },
        { "lt", "", "LT" }
    },
    toolbar = {
        position = "bottom",
        widgets = {
            "widgets.separator",
            "widgets.kblayout",
            "widgets.separator",
 --           "widgets.battery",
            "widgets.separator",
            "widgets.volume"
        }
    },
    popup_bar = {
        width = 200,
        position = "left",
        tasklist = {
            item_height = 50
        },
        widgets_top = {
            "widgets.clock_big",
            "widgets.calendar"
        },
        widgets_bottom = {
            "widgets.network_connection",
            "widgets.window_info",
            "widgets.separator",
        }
    },
    terminal = "x-terminal-emulator",
    modkey = "Mod4",
}
