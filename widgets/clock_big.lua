local BigClockWidget = {}
BigClockWidget.font = "DejaVu Sans Light 32"

local textbox = wibox.widget.textbox()

textbox:set_font(BigClockWidget.font)
textbox:set_align("left")

local margin = wibox.layout.margin()

margin:set_top(20)
margin:set_bottom(-20)
margin:set_left(5)
margin:set_right(5)

margin:set_widget(textbox)

BigClockWidget.widget = margin
BigClockWidget.format = "%H:%M:%S"

function BigClockWidget.update()
   local status = eval("date +\"" .. BigClockWidget.format .. "\"")

   textbox:set_markup("<span color='" .. beautiful.fg_focus .. "'>" .. status .. "</span>")
end

BigClockWidget.update()

BigClockWidget.timer = timer({ timeout = 1 })
BigClockWidget.timer:connect_signal("timeout", BigClockWidget.update )
BigClockWidget.timer:start()

return BigClockWidget