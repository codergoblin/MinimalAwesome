local WindowInfoWidget = {
    focused_pid = nil,
    command_line = nil
}
WindowInfoWidget.font = "DejaVu Sans mono 10"

local textbox = wibox.widget.textbox()

textbox:set_font(WindowInfoWidget.font)
textbox:set_align("left")

textbox:buttons(awful.util.table.join(awful.button({}, 1,
    function()
        WindowInfoWidget.copy_full_command()
    end)))

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

        WindowInfoWidget.command_line = eval("cat /proc/" .. pid .. "/cmdline | xargs -0 echo")

        local command = ellipsis(WindowInfoWidget.command_line, 30)

        local markup = "<span color='" .. beautiful.fg_normal .. "'>pid: " .. pid .. "\n" .. command .. "</span>"

        textbox:set_markup(markup)

    else
        textbox:set_markup("")
    end
end

function WindowInfoWidget.copy_full_command()
    if WindowInfoWidget.command_line then
        naughty.notify({ text = WindowInfoWidget.command_line })
    end
end


WindowInfoWidget.update()

client.connect_signal("focus",
    function(c)
        if c.pid then
            WindowInfoWidget.focused_pid = c.pid
            WindowInfoWidget.update()
        end
    end)



return WindowInfoWidget

