local component = require("component")
local event = require("event")
local term = require("term")
local modem = component.modem

term.clear()
print("Modem port?")
port = tonumber(io.read())
modem.open(port)
-- gpu = component.list("gpu")()
-- screen = component.list("screen")()
-- component.invoke(gpu, "bind", screen)
-- component.invoke(gpu, "setResolution", 50, 16)
 term.clear()
while true do
 local _, _, _, _, _, message = event.pull("modem_message")
print(tostring(message))
end
