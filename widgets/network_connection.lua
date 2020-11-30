local NetworkConnectionWidget = {}
NetworkConnectionWidget.font = "DejaVu Sans mono 10"

local textbox = wibox.widget.textbox()

textbox:set_font(NetworkConnectionWidget.font)
textbox:set_align("left")

local margin = wibox.layout.margin()

--margin:set_top(20)
--margin:set_bottom(-40)
margin:set_left(5)
margin:set_right(5)

margin:set_widget(textbox)

NetworkConnectionWidget.widget = margin

function NetworkConnectionWidget.update()
   local status = eval("echo `hostname -I` ;echo `iwgetid -r`")

   textbox:set_markup("<span color='" .. beautiful.fg_focus .. "'>" .. status .. "</span>")
end

NetworkConnectionWidget.update()

NetworkConnectionWidget.timer = timer({ timeout = 5})
NetworkConnectionWidget.timer:connect_signal("timeout", NetworkConnectionWidget.update )
NetworkConnectionWidget.timer:start()


return NetworkConnectionWidget

