--requirements:
--OpenOS
--network card/ wireless card
--gpu tier 1 minimum
--tier 1 screen minimum
--tier 1 ram or more
--tier 1 cpu/apu or more

local component = require("component")
local gpu = component.proxy(component.list("gpu")())
local screen = component.proxy(component.list("screen")())
local modem = component.proxy(component.list("modem")())
local event = require("event")
local keyboard = component.proxy(component.list("keyboard")())

local input = ""

gpu.bind(screen.address)
gpu.setResolution(50, 10)
--gpu.setForeground(0xFFFFFF)
--gpu.setBackground(0x000000)

gpu.fill(1, 1, 50, 10, " ")

gpu.set(1, 1, "Modem port?")

while true do
  local signalType, _, char, code = event.pull()

  if signalType == "key_down" then
    local c = string.char(char)
    
    if c:match("%d") then
      input = input .. c
      gpu.set(1, 2, input)
    elseif char == 13 then
      break
    elseif char == 8 then
      input = input:sub(1, -2)
      gpu.set(1, 2, input .. " ")
    end
  end
end

port = tonumber(input)

modem.open(tonumber(port))

gpu.fill(1, 1, 50, 10, " ")

local sig, _, _, _, _, msg = event.pull("modem_message")
local _, count = msg:gsub("\n", "")
gpu.setResolution(50, count)

while true do
  if msg then
    gpu.fill(1, 1, 50, count, " ")

    local i = 1
    for line in tostring(msg):gmatch("([^\n]*)\n?") do
      if i > count then break end
      gpu.set(1, i, line:sub(1, 50))
      i = i + 1
    end
  end
  sig, _, _, _, _, msg = event.pull("modem_message")
end
