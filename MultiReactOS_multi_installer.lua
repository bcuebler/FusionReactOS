component = require("component")
computer = require("computer")
term = require("term")

function chart()
 print("FusionReactOS Setup V1.0")
 print(" ")
 print("side chart:")
 print("0 = bottom")
 print("1 = top")
 print("2 = back")
 print("3 = front")
 print("4 = right")
 print("5 = left")
 print(" ")
end

 computer.beep()
 term.clear()
 port = 0
 print("MultiReactOS Setup V1.0")
 print(" ")
 print("What would you like to install?")
 print("1. Multi client")
 print("2. Fusion Reactor controller")
 print("3. Fission Reactor controller")
 print("4. Molten Salt Reactor controller")
 program = tonumber(io.read())
term.clear()
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
  print("Installation path and name? E.g.: /home")
  path = tostring(io.read())
  term.clear()
  print("MultiReactOS Setup V1.0")
 end

--Client install
if( program == 1 ) then
 term.clear()
 print("MultiReactOS-Client Setup V1.0")
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
  print("MultiReactOS-Client Setup V1.0")
  print(" ")
  print("Modem port?")
  port = tonumber(io.read())
 end
end

--Fusion Reactor install
if( program == 2 ) then
term.clear()
print("MultiReactOS-Fusion Setup V1.0")
print(" ")
print("Modem installed? [Y/n]")
 modm = string.lower(tostring(io.read()))
 if( modm == "y" ) then
  modm = 1
 else
  modm = 0
 end
term.clear()
print("MultiReactOS-Fusion Setup V1.0")
print(" ")
print("Direct screen installed? [Y/n]")
 scrn = string.lower(tostring(io.read()))
  if( scrn == "y" ) then
  scrn = 1
 else
  scrn = 0
 end
term.clear()
if ( modm == 1 ) then
print("MultiReactOS-Fusion Setup V1.0")
print(" ")
print("Modem port?")
 port = tonumber(io.read())
term.clear()
end
 
if(( modm == 1 ) or ( scrn == 1 )) then
 print("MultiReactOS-Fusion Setup V1.0")
 print(" ")
 print("Data refresh Speed?")
 dt = tonumber(io.read())
 term.clear()
end
 
 
 chart()
 print("Please enter the side value for the alarm output side:")
  sideal = tonumber( io.read() )
 term.clear()
 chart()
 print("Reactor standby input side:")
  sidersleep = tonumber( io.read() )
 term.clear()
 chart()
 print("Reactor Disable input side:")
  offside = tonumber( io.read() )
 term.clear()
 chart()
 print("Reactor input enable output side:")
  outside = tonumber( io.read() )
 term.clear()
 chart()
 print("Energy output enable output side:")
  pwro = tonumber( io.read() )
 term.clear()
 print("MultiReactOS-Fusion Setup V1.0")
 print(" ")
 print("Enable alarm use as computer beeper? [Y/n]")
  almb = string.lower(tostring(io.read()))
   if( almb == "y" ) then
  almb = 1
 else
  almb = 0
 end
 term.clear()
end


if( program == 1 ) then
 programname = "MROS_Multi_client"
--client
script = [==[
 pport = ]==] .. pport .. [==[
 port = ]==] .. port .. [==[
 inst = ]==] .. inst .. [==[

if( inst == 0 ) then
 component = require("component")
 event = require("event")
end
gpu = component.proxy(component.list("gpu")())
screen = component.proxy(component.list("screen")())
modem = component.proxy(component.list("modem")())
keyboard = component.proxy(component.list("keyboard")())

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
 --sig, _, _, _, _, msg = event.pull("modem_message")
  name, _, _, codee = event.pull(0)
 else
  --sig, _, _, _, _, msg = computer.pullSignal("modem_message")
  name, _, _, codee = computer.pullSignal(0)
 end
 
  if codee and ( name == "modem_message" ) then
    if( enbl == 1 ) then
     enbl = 0
     _, count = tostring(codee):gsub("\n", "")
     gpu.setResolution(50, count)
    end
    gpu.fill(1, 1, 50, count, " ")

    local i = 1
    for line in tostring(codee):gmatch("([^\n]*)\n?") do
      if i > count then break end
      gpu.set(1, i, line:sub(1, 50))
      i = i + 1
    end
  end
 
   if name == "key_down" then
   if( codee == 16 ) then
     gpu.fill(1, 1, 50, count, " ")
     break
   end
  end
 
end
]==]
end

 if( program == 2 ) then
 programname = "Fusion_RC"
 script = [====[
 sideal = ]====] .. sideal .. [====[
 side = ]====] .. sidersleep .. [====[
 alert = false
 offside = ]====] .. offside .. [====[
 outside = ]====] .. outside .. [====[
 almb = ]====] .. almb .. [====[
 pwro = ]====] .. pwro .. [====[
 modm = ]====] .. modm .. [====[
 scrn = ]====] .. scrn .. [====[
 port = ]====] .. port .. [====[
 dt = ]====] .. dt .. [====[
 inst = ]====] .. inst .. [====[
 
 mod = "nil"
 
 delaly = 0
if( inst == 0 ) then
 component = require("component")
end
 invoke = component.invoke
 computer = component.proxy(component.list("computer")())
 reactor = component.proxy(component.list("nc_fusion_reactor")())
 rs = component.proxy(component.list("redstone")())
if( scrn == 1 ) then
 gpu = component.list("gpu")()
 screen = component.list("screen")()
 component.invoke(gpu, "bind", screen)
-- maxX, maxY = component.invoke(gpu, "maxResolution")
 component.invoke(gpu, "setResolution", 50, 10)
 component.invoke(gpu, "fill", 1, 1, 50, 10, " ")
 component.invoke(gpu, "set", 1, 1, "Starting")
end
 
if( modm == 1 ) then
 modem = component.proxy(component.list("modem")())
 modem.open(port)
 modem.broadcast(port, "Port: ".. port .. "started!")
 if( modem.isOpen(port) == false ) then
  repeat
   computer.beep(2000, 0.5)
   sleep(10)
  until (1 == 0)
 end
end
 enable = 1
 preheat = 1
 a = 0
 b = 0
 rs.setOutput(pwro, 0)
 eff = 0 

function electromagnetsPowered()
   problem = reactor.getProblem()
  return problem == "E-magnets not Powered"
end
 
function sleep(delay)
 repeat
 b = ( b + 1 )
 until b == ( delay * 10 )
 b = 0
end
 
computer.beep(1000, 0.1)
if ( almb == 1 ) then
 rs.setOutput(sideal, 15)
 sleep(0.1)
 rs.setOutput(sideal, 0)
end
 rs.setOutput(sideal, 0)
mod = "Starting"
 
while true do
 if ( rs.getInput(side) < 1) or ( electromagnetsPowered() ) then
  rs.setOutput(outside, 15)
  repeat
   reactor.deactivate()
   sleep(1)
  until ( false == electromagnetsPowered() )
 else
  if ( eff > 0.9999 ) then
   rs.setOutput(outside, 0)
  else
   rs.setOutput(outside, 15)
  end
 end
 
 maxtemp = reactor.getMaxTemperature()

 delaly = delaly + 1
 if( delaly > dt ) then
  local x = 1
  local y = 1
  local message = "Temperature: " .. temp .. " K\n"
  .. "Problem: " .. reactor.getProblem() .. "\n"
  .. "Stored energy: " .. reactor.getEnergyStored() .. " RF" .. "\n"
  .. "First reactor fuel: " .. reactor.getFirstFusionFuel() .."\n"
  .. "Second reactor fuel: " .. reactor.getSecondFusionFuel() .. "\n"
  .. "Energy change: " .. reactor.getEnergyChange() .. " RF/t" .. "\n"
  .. "State: " .. mod .. "\n"
  .. "Efficiency: " .. eff .. " %" .. "\n"
  .. "Max temperature: " .. maxtemp .. " K" .. "\n"
  .. "Max energy stored: " .. reactor.getMaxEnergyStored() .. " RF"
 if( modm == 1 ) then
  modem.broadcast(port, message)
 end
 if( scrn == 1 ) then
 component.invoke(gpu, "fill", 1, 1, 50, 10, " ")
 for line in string.gmatch(message, "([^\n]+)") do
  component.invoke(gpu, "set", x, y, line)
  y = y + 1
 end
end
  delaly = 0
 end
 
 if ( alert == true ) then
  rs.setOutput(sideal, 15)
 reactor.deactivate()
 mod = "Alert"
 repeat
  computer.beep(2000, 0.5)
  if ( almb == 1 ) then
   rs.setOutput(sideal, 15)
   sleep(0.1)
   rs.setOutput(sideal, 0)
  end
  sleep(0.5)
 until ( 1 == 0 )
 end
 switch = ( rs.getInput(side) > 0)
 if ( enable == 1 ) and ( preheat == 1 ) and ( rs.getInput(offside) > 0) then
  reactor.activate()
 else
  reactor.deactivate()
 end
 
temp = reactor.getTemperature()
 if ( eff > 1 ) and ( switch == false ) then
  preheat = 0
 else
  preheat = 1
 end
 
 if (( switch == false ) and ( rs.getInput(offside) > 0)) then
  mod = "Preheating"
 else
  if ( rs.getInput(offside) > 0) then
   mod = "Working"
  else
   mod = "Off"
  end
 end
 
 if ( temp > maxtemp ) or ( electromagnetsPowered() ) then
  alert = true
 end
 
 if ( switch == false ) then
  a = ( a + 1 )
  if ( a > 45 ) then
   a = 0
    computer.beep()
     if ( almb == 1 ) then
     rs.setOutput(sideal, 15)
     sleep(0.1)
     rs.setOutput(sideal, 0)
    end
  end
 end
 
 eff = reactor.getEfficiency()

 if ( eff > 90 ) and ( switch == true ) and ( rs.getInput(offside) > 0) then
  rs.setOutput(pwro, 15)
 else
  rs.setOutput(pwro, 0)
 end
 
 if ( eff > 99.999  ) and ( switch == true ) then
  enable = 0
 else
  enable = 1
 end
 if ( switch == false ) then
  enable = 1
 end
end
]====]
end


if( program == 3 ) then
 programname = "MROS_Fission_RC"
end
if( program == 4 ) then
 programname = "MROS_Molten_Salt_RC"
end


 term.clear()
 print("MultiReactOS Setup V1.0")
 print(" ")
 print("Writing " .. programname)
 if( inst == 1 ) then
  eeprom.set(script)
  eeprom.setLabel(programname)
  if ( wrp == 1 ) then
   eeprom.makeReadonly("mros")
  end
  print("EEPROM succesfully written!")
 else
   path = path .. "/" .. programname .. ".lua"
   local file = io.open(path, "w")
   file:write(script)
   print("Program succesfully written!")
   file:close()
 end
 os.sleep(3)
 term.clear()
