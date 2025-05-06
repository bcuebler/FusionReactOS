--requirements:
--Writable eeprom(installer)
--network card/ wireless card
--gpu tier 1 minimum
--tier 1 screen minimum
--tier 1 ram or more
--tier 1 cpu/apu or more

component = require("component")
 computer = require("computer")
fs = require("filesystem")
 term = require("term")
 eeprom = component.eeprom
 computer.beep()
 term.clear()
print("MultiReactOS client Setup V1.0")
print(" ")
print("Install into EEPROM or Disk? [E/D]
  inst = string.lower(tostring(io.read()))
  if( inst == "E" ) then
  inst = 1
 else
  inst = 0
 end
 term.clear()
print("MultiReactOS client Setup V1.0")
print(" ")
if( inst == 1 ) then
 print("Insert an EEPROM to be written THEN continue")
 print(" ")
else
 Print("Installation path and name?")
 path = tostring(io.read())
end
print("Predefined modem port? [Y/n]")
 pport = string.lower(tostring(io.read()))
  if( pport == "y" ) then
  pport = 1
 else
  pport = 0
 end
if( pport == 1 ) then
 term.clear()
 print("MultiReactOS client Setup V1.0")
 print(" ")
 print("Modem port?")
 port = tonumber(io.read())
end
if( inst == 1 ) then
 term.clear()
 print("MultiReactOS client Setup V1.0")
 print(" ")
 print("Set EEPROM as read only? [Y/n]")
  wrp = string.lower(tostring(io.read()))
   if( wrp == "y" ) then
   wrp = 1
  else
   wrp = 0
  end
 end
term.clear()
print("MultiReactOS client Setup V1.0")
print(" ")

--Main script
script = [==[
 pport = ]==] .. pport .. [==[
 port = ]==] .. port .. [==[
 inst = ]==] .. inst .. [==[
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

if( pport == 0 )
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
end

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
]==]

print("Writing MultiReactOS client")
if( inst == 1 ) then
 eeprom.set(script)
 eeprom.setLabel("MultiReactOS client")
 if ( wrp == 1 ) then
  eeprom.makeReadonly("fros")
 end
 print("EEPROM succesfully written!")
else
  local handle, reason = fs.open(path, "w")
 if not handle then
   error("Nem sikerült megnyitni: " .. tostring(reason))
 end
  fs.write(handle, script)
  print("Program succesfully written!")
  fs.close(handle)
end
os.sleep(3)
term.clear()
