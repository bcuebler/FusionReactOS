component = require("component")
computer = require("computer")
term = require("term")




 computer.beep()
 term.clear()
 port = 0
 print("MultiReactOS Setup V1.0")
 print(" ")
 print("Install into EEPROM or Disk? [E/D]")
   inst = string.lower(tostring(io.read()))
   if( inst == "e" ) then
   inst = 1
  else
   inst = 0
  end
  term.clear()
 print("MultiReactOS Setup V1.0")
 print(" ")
  if( inst == 1 ) then
  print("Insert an EEPROM to be written THEN continue")
  eeprom = component.eeprom
   print(" ")
  print("Set EEPROM as read only? [Y/n]")
   wrp = string.lower(tostring(io.read()))
    if( wrp == "y" ) then
    wrp = 1
   else
    wrp = 0
   end
 else
  fs = require("filesystem")
  print("Installation path and name?")
  path = tostring(io.read())
  term.clear()
  print("MultiReactOS Setup V1.0")
 end
 term.clear()
 print("MultiReactOS Setup V1.0")
 print(" ")
 print("Predefined modem port? [Y/n]")
  pport = string.lower(tostring(io.read()))
   if( pport == "y" ) then
   pport = 1
  else
   pport = 0
  end
 if( pport == 1 ) then
  term.clear()
  print("MultiReactOS Setup V1.0")
  print(" ")
  print("Modem port?")
  port = tonumber(io.read())
 end
 term.clear()
 print("MultiReactOS Setup V1.0")
 print(" ")
 print("Writing MultiReactOS " .. program)
 if( inst == 1 ) then
  eeprom.set(script)
  eeprom.setLabel("MultiReactOS " .. program)
  if ( wrp == 1 ) then
   eeprom.makeReadonly("mros")
  end
  print("EEPROM succesfully written!")
 else
   local file = io.open(path, "w")
   file:write(client)
   print("Program succesfully written!")
   file:close()
 end
 os.sleep(3)
 term.clear()

 





 client = [==[
 pport = ]==] .. pport .. [==[
 port = ]==] .. port .. [==[
 inst = ]==] .. inst .. [==[

if( inst == 0 ) then
 component = require("component")
 event = require("event")
end
local gpu = component.proxy(component.list("gpu")())
local screen = component.proxy(component.list("screen")())
local modem = component.proxy(component.list("modem")())
local keyboard = component.proxy(component.list("keyboard")())

input = ""
enbl = 1

gpu.bind(screen.address)
gpu.setResolution(50, 10)

gpu.fill(1, 1, 50, 10, " ")

if( pport == 0 ) then
gpu.set(1, 1, "Modem port?")

 while true do
   if( inst == 0 ) then
     signalType, _, char, code = event.pull()
   else
     signalType, _, char, code = computer.pullSignal()
   end

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

while true do
 if( inst == 0 ) then
  sig, _, _, _, _, msg = event.pull("modem_message")
 else
  sig, _, _, _, _, msg = computer.pullSignal("modem_message")
 end

  if msg then
    if( enbl == 1 ) then
     enbl = 0
     _, count = tostring(msg):gsub("\n", "")
     gpu.setResolution(50, count)
    end
    gpu.fill(1, 1, 50, count, " ")

    local i = 1
    for line in tostring(msg):gmatch("([^\n]*)\n?") do
      if i > count then break end
      gpu.set(1, i, line:sub(1, 50))
      i = i + 1
    end
  end
end
]==]
