local component = require("component")
local event = require("event")
local term = require("term")
local modem = component.modem

term.clear()
print("Modem port?")
port = tonumber(io.read())
modem.open(port)
 gpu = component.list("gpu")()
 screen = component.list("screen")()
 component.invoke(gpu, "bind", screen)
 component.invoke(gpu, "setResolution", 50, 16)
 component.invoke(gpu, "fill", 1, 1, 50, 16, " ")
while true do
 local _, _, _, _, _, message = event.pull("modem_message")
  local x = 1
  local y = 1
  component.invoke(gpu, "fill", 1, 1, 50, 16, " ")
 for line in string.gmatch(message, "([^\n]+)") do
  component.invoke(gpu, "set", x, y, line)
  y = y + 1
 end
end
