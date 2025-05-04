--requirements:
--OpenOS
--network card/ wireless card
--gpu tier 1 minimum
--tier 1 screen minimum
--tier 1 ram or more
--tier 1 cpu/apu or more

local component = require("component")
local event = require("event")
local term = require("term")
local modem = component.modem

term.clear()
print("Modem port?")
port = tonumber(io.read())
modem.open(port)
term.clear()
while true do
 local _, _, _, _, _, message = event.pull("modem_message")
 term.clear()
 print(tostring(message))
end
