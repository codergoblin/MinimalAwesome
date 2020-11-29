local wibox = require("wibox")
local beautiful = require("beautiful")

local ClockWidget = {}
ClockWidget.widget = wibox.widget.textbox()
ClockWidget.widget:set_align("right")
ClockWidget.format = "%Y-%m-%d %H:%M"

function ClockWidget.update()
   local status = eval("date +\"" .. ClockWidget.format .. "\"")

   ClockWidget.widget:set_markup("<span color='" .. beautiful.fg_normal .. "'>" .. status .. "</span>")
end

ClockWidget.update()

ClockWidget.timer = timer({ timeout = 10 })
ClockWidget.timer:connect_signal("timeout", ClockWidget.update )
ClockWidget.timer:start()

return ClockWidget