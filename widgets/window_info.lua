local wibox = require("wibox")
local beautiful = require("beautiful")

local WindowInfoWidget = {
    focused_pid = nil
}
WindowInfoWidget.font = "DejaVu Sans mono 11"

local textbox = wibox.widget.textbox()

textbox:set_font(WindowInfoWidget.font)
textbox:set_align("left")

local margin = wibox.layout.margin()

margin:set_top(5)
margin:set_bottom(5)
margin:set_left(5)
margin:set_right(5)

margin:set_widget(textbox)

WindowInfoWidget.widget = margin

function WindowInfoWidget.update()

    if WindowInfoWidget.focused_pid then



        local pid = WindowInfoWidget.focused_pid

        local fd = io.popen("cat /proc/" .. pid .. "/cmdline | xargs -0 echo")
        local command = fd:read("*all")
        fd:close()

        command = command:sub(1,30)

        local markup = "<span color='" .. beautiful.fg_focus .. "'>pid: " .. pid .. "</span><span> " .. command .. "</span>"

        textbox:set_markup(markup)

    else
        textbox:set_markup("")
    end
end

function WindowInfoWidget.set_client(c)
    if c.pid then
        WindowInfoWidget.focused_pid = c.pid
        WindowInfoWidget.update()
    end
end

WindowInfoWidget.update()

client.connect_signal("manage", function(c, startup)
    c:connect_signal("mouse::enter",
        function(c)
            if c.pid then
                WindowInfoWidget.focused_pid = c.pid
                WindowInfoWidget.update()
            end
        end)
end)

client.connect_signal("focus",
    function(c)
        if c.pid then
            WindowInfoWidget.focused_pid = c.pid
            WindowInfoWidget.update()
        end
    end)

return WindowInfoWidget

