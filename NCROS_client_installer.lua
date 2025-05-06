--requirements:
--Writable eeprom(installer)
--network card/ wireless card
--gpu tier 1 minimum
--tier 1 screen minimum
--tier 1 ram or more
--tier 1 cpu/apu or more

component = require("component")
 computer = require("computer")
 term = require("term")
 eeprom = component.eeprom
 computer.beep()
 term.clear()
print("FusionReactOS client Setup V1.0")
print(" ")
print("Insert an EEPROM to be written THEN continue")
print(" ")
print("Modem port?")
 port = tonumber(io.read())
term.clear()
print("FusionReactOS client Setup V1.0")
print(" ")
print("Set EEPROM as read only? [Y/n]")
 wrp = string.lower(tostring(io.read()))
  if( wrp == "y" ) then
  wrp = 1
 else
  wrp = 0
 end
term.clear()
print("FusionReactOS client Setup V1.0")
print(" ")

--Main script
script = [==[
 port = ]==] .. port .. [==[
local gpu = component.proxy(component.list("gpu")())
local screen = component.proxy(component.list("screen")())
local modem = component.proxy(component.list("modem")())

gpu.bind(screen.address)
gpu.setResolution(50, 10)
--gpu.setForeground(0xFFFFFF)
--gpu.setBackground(0x000000)

modem.open(tonumber(port))

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
  local sig, _, _, _, _, msg = event.pull("modem_message")
end
]==]

print("Writing FusionReactOS client to EEPROM...")
eeprom.set(script)
eeprom.setLabel("FusionReactOS client")
if ( wrp == 1 ) then
 eeprom.makeReadonly("fros")
end
print("EEPROM succesfully written!")
os.sleep(3)
term.clear()
