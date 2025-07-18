component = require("component")
computer = require("computer")
term = require("term")
event = require("event")

function chart()
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
 dt = 0
 program = 0
 port = 0
 print("MultiReactOS Setup V1.0")
 print(" ")
 print("What would you like to install?")
 print("1. Multi client")
 print("2. Fusion Reactor controller")
 print("3. Fission Reactor controller")
 print("4. Molten Salt Reactor controller")
 print("5. Geiger Counter reader")
 print("6. Help / info")
 print("7. Exit")
 program = tonumber(io.read())
if(program == 6) then
 term.clear()
 print("- help/info text here -")
 event.pull("key_down")
end
if(program < 6) then
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
  print("Set EEPROM as readonly? [Y/n]")
   wrp = string.lower(tostring(io.read()))
    if( wrp == "y" ) then
    wrp = 1
   else
    wrp = 0
   end
 else
  fs = require("filesystem")
  print("Installation path? E.g.: /home")
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
 print("Data refresh delay? (sec)")
 dt = tonumber(io.read())
 term.clear()
end

 print("FusionReactOS Setup V1.0")
 chart()
 print("Please enter the side value for the alarm output side:")
  sideal = tonumber( io.read() )
 term.clear()
 print("FusionReactOS Setup V1.0")
 chart()
 print("Reactor standby input side:")
  sidersleep = tonumber( io.read() )
 term.clear()
 print("FusionReactOS Setup V1.0")
 chart()
 print("Reactor Disable input side:")
  offside = tonumber( io.read() )
 term.clear()
 print("FusionReactOS Setup V1.0")
 chart()
 print("Reactor input enable output side:")
  outside = tonumber( io.read() )
 term.clear()
 print("FusionReactOS Setup V1.0")
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

--Geiger counter install
if(program == 5) then
 sideal = 0
  term.clear()
print("MultiReactOS-Geiger counter Setup V1.0")
print(" ")
 print("Direct screen installed? [Y/n]")
 scrn = string.lower(tostring(io.read()))
  if( scrn == "y" ) then
  scrn = 1
 else
  scrn = 0
 end
term.clear()
print("MultiReactOS-Geiger counter Setup V1.0")
print(" ")
print("Modem installed? [Y/n]")
 modm = string.lower(tostring(io.read()))
 if( modm == "y" ) then
  modm = 1
 else
  modm = 0
 end
 if ( modm == 1 ) then
   term.clear()
 print("MultiReactOS-Geiger counter Setup V1.0")
print(" ")
print("Modem port?")
 port = tonumber(io.read())
 end
term.clear()
  if(( modm == 1 ) or ( scrn == 1 )) then
 print("MultiReactOS-Geiger counter Setup V1.0")
 print(" ")
 print("Data refresh delay? (sec)")
 dt = tonumber(io.read())
 term.clear()
  else
   dt = 1
  end
 term.clear()
 print("MultiReactOS-Geiger counter Setup V1.0")
 print(" ")
  print("Readioactivity threshold? (0 for disable)")
   warn = tonumber(io.read())

   term.clear()
 print("MultiReactOS-Geiger counter Setup V1.0")
 print(" ")
 print("Redstone I/O? [Y/n]")
  red = string.lower(tostring(io.read()))
   if( red == "y" ) then
   red = 1
  else
   red = 0
  end
 
  if(red == 1) then
 term.clear()
 print("MultiReactOS-Geiger counter Setup V1.0")
 print(" ")
  chart()
 print("Please enter the side value for the alarm output side:")
  sideal = tonumber( io.read() )
 term.clear()
  end
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
if(pport == 0) then
 keyboard = component.proxy(component.list("keyboard")())
end
maxW, maxH = gpu.maxResolution()
if( inst == 0 ) then
 oldW, oldH = gpu.getResolution()
end

debugg = 0
 
while (pport == 0) or (debugg == 0) do
input = ""
enbl = 1
lenght = maxW
count = maxH
debugg = 1

gpu.bind(screen.address)
gpu.setResolution(12, 2)

gpu.fill(1, 1, 12, 2, " ")

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

gpu.fill(1, 1, 12, 2, " ")

while true do
 if( inst == 0 ) then
  sig, _, _, mport, _, msg = event.pull()
   if( sig == "key_down" ) then
   gpu.setResolution(oldW, oldH)
   gpu.fill(1, 1, oldW, oldH, " ")
   break
  end
 else
  sig, _, _, mport, _, msg = computer.pullSignal()
  if( sig == "key_down" ) and (pport == 0) then
   break
  end
 end
 
  if ( sig == "modem_message" ) and (mport == port) then
 
 texts = msg
liness = {}
for lins in texts:gmatch("[^\n]+") do
  table.insert(liness, lins)
end

lenght = tonumber(liness[1])
count = tonumber(liness[2])
raw = {}
for i = 3, #liness do
  table.insert(raw, liness[i])
end
othrs = table.concat(raw, "\n")
 
 gpu.setResolution(lenght, count)
    gpu.fill(1, 1, lenght, count, " ")

if(maxW < lenght) or (maxH < count) then
 error("Max resolution reached")
end
 
    local i = 1
    for line in tostring(othrs):gmatch("([^\n]*)\n?") do
      if i > count then break end
      gpu.set(1, i, line:sub(1, lenght))
      i = i + 1
    end
  end
end
end
]==]
end

 if( program == 2 ) then
 programname = "Fusion_RC"
 --Fusion reactor controller
 
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
if(inst == 0) then
 component = require("component")
 event = require("event")
end
 invoke = component.invoke
 computer = component.proxy(component.list("computer")())
 reactor = component.proxy(component.list("nc_fusion_reactor")())
 rs = component.proxy(component.list("redstone")())
if(scrn == 1) then
 gpu = component.list("gpu")()
 screen = component.list("screen")()
 component.invoke(gpu, "bind", screen)
 W, H =  component.invoke(gpu, "getResolution")
 component.invoke(gpu, "setResolution", 50, 9)
 component.invoke(gpu, "fill", 1, 1, 50, 9, " ")
end
if(modm == 1) then
 modem = component.proxy(component.list("modem")())
 modem.open(port)
 if(modem.isOpen(port) == false) then
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
function elm()
   prob = reactor.getProblem()
  return prob == "E-magnets not Powered"
end
function sleep(delay)
 repeat
 b = b+1
 until b == (delay * 10)
 b = 0
end

if (almb == 1) then
 rs.setOutput(sideal, 15)
 sleep(0.1)
 rs.setOutput(sideal, 0)
end
 rs.setOutput(sideal, 0)
mod = "Starting"
while true do
 engst = reactor.getEnergyStored()
 if (rs.getInput(side) < 1) or (elm()) then
  rs.setOutput(outside, 15)
  if elm() then
  repeat
   reactor.deactivate()
   sleep(1)
  until (false == elm())
 end
 else
  if (engst > 6000000) then
   rs.setOutput(outside, 0)
  else
   rs.setOutput(outside, 15)
  end
 end
 eff = reactor.getEfficiency()
 temp = reactor.getTemperature()
 maxtemp = reactor.getMaxTemperature()
 delaly = delaly + 1
 if(delaly > dt) then
x = 1
y = 1
message = "Temperature: "..temp.." K\n"
.."Problem: "..prob.."\n"
.."Stored energy: "..engst.." RF".."\n"
.."First fuel: "..reactor.getFirstFusionFuel().."\n"
.."Second fuel: "..reactor.getSecondFusionFuel().."\n"
.."State: ".. mod .."\n"
.."Max temp: "..maxtemp.." K".."\n"
.."Efficiency: "..eff.." %".."\n"
.."Max energy: "..reactor.getMaxEnergyStored().." RF"
 if(modm == 1) then
  modem.broadcast(port, "50".."\n".."9".."\n"..message)
 end
 if(scrn == 1) then
 component.invoke(gpu, "fill", 1, 1, 50, 9, " ")
 for line in string.gmatch(message, "([^\n]+)") do
  component.invoke(gpu, "set", x, y, line)
  y = y + 1
 end
end
  delaly = 0
 end
 if(inst == 0) and (scrn == 1) and (1 == 0) then
 sig, _, _, _, _, msg = event.pull(0)
 if(sig == "key_down") then
 component.invoke(gpu, "setResolution", W, H)
 component.invoke(gpu, "fill", 1, 1, W, H, " ")
  break
 end
end
 if (alert == true) then
  rs.setOutput(sideal, 15)
 reactor.deactivate()
 mod = "Alert"
 repeat
  computer.beep(2000, 0.5)
  if (almb == 1) then
   rs.setOutput(sideal, 15)
   sleep(0.1)
   rs.setOutput(sideal, 0)
  end
  sleep(0.5)
 until ( 1 == 0 )
 end
 switch = (rs.getInput(side) > 0)
 if (enable == 1) and (preheat == 1) and (rs.getInput(offside) > 0) then
  reactor.activate()
 else
  reactor.deactivate()
 end
 if (engst > 5999900) and (switch == false) then
  preheat = 0
 else
  preheat = 1
 end
 if ((switch == false) and (rs.getInput(offside) > 0)) then
  mod = "Preheating"
 else
  if (rs.getInput(offside) > 0) then
   mod = "Working"
  else
   mod = "Off"
  end
 end
 if (temp > (maxtemp - 100)) or (elm()) then
  alert = true
 end
 if (switch == false) then
  a = a+1
  if (a > 45) then
   a = 0
    computer.beep()
     if (almb == 1) then
     rs.setOutput(sideal, 15)
     sleep(0.1)
     rs.setOutput(sideal, 0)
    end
  end
 end
 if (engst > 6000000) and (switch == true) and (rs.getInput(offside) > 0) then
  rs.setOutput(pwro, 15)
 else
  rs.setOutput(pwro, 0)
 end
 if (eff > 99.99999) and (switch == true) then
  enable = 0
 else
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


if( program == 5 ) then
 programname = "MROS_geiger_counter"
 --geiger counter program

 script = [======[
 inst = ]======] .. inst .. [======[
 dt = ]======] .. dt .. [======[
 port = ]======] .. port .. [======[
 scrn = ]======] .. scrn .. [======[
 modm = ]======] .. modm .. [======[
 warn = ]======] .. warn .. [======[
 red = ]======] .. red .. [======[
 sideal = ]======] .. sideal .. [======[

--warn = 0 if not warning

state = "nil"
  
if(inst == 0) then
 component = require("component")
 event = require("event")
end
ccomputer = component.proxy(component.list("computer")())
if(red == 1) then
  rs = component.proxy(component.list("redstone")())
end
geiger = component.proxy(component.list("nc_geiger_counter")())
invoke = component.invoke
 if(scrn == 1) then
  gpu = component.list("gpu")()
  screen = component.list("screen")()
  component.invoke(gpu, "bind", screen)
  W, H = component.invoke(gpu, "getResolution")
  component.invoke(gpu, "setResolution", 10, 2)
  component.invoke(gpu, "fill", 1, 1, 10, 2, " ")
 end
 if(modm == 1) then
  modem = component.proxy(component.list("modem")())
 end
delaly = 0

state = "starting..."
  
if(scrn == 1) then
 component.invoke(gpu, "setResolution", 28, 2)
 component.invoke(gpu, "fill", 1, 1, 28, 2, " ")
end

if(modm == 1) then
 modem.open(tonumber(port))
end

while true do
 if(delaly > (dt*10000000)) then
  rad = tostring(geiger.getChunkRadiationLevel()).." Rads/t".."\n"
  ..state
 if(geiger.getChunkRadiationLevel() > warn) and (warn > 0) then
  ccomputer.beep(2000, 0.5)
  state = "Alert"
  if(red == 1) then
   rs.setOutput(sideal, 15)
  end
 else
  state = "Normal"
  if(red == 1) then
   rs.setOutput(sideal, 0)
  end
 end
  if(modm == 1) then
   modem.broadcast(tonumber(port), "28".."\n".."2".."\n"..rad)
  end
  if(scrn == 1) then
   x = 1
   y = 1
   component.invoke(gpu, "fill", 1, 1, 28, 2, " ")
   for line in string.gmatch(rad, "([^\n]+)") do
     component.invoke(gpu, "set", x, y, line)
     y = y + 1
   end
  end
  delaly = 0
 end
delaly = delaly + 1

  if( inst == 0 ) and (scrn == 1) and (1 == 0) then
   sig, _, _, _ = event.pull(0)
   if( sig == "key_down" ) then
   component.invoke(gpu, "setResolution", W, H)
   component.invoke(gpu, "fill", 1, 1, W, H, " ")
   break
  end
 end
end
]======]
end


 term.clear()
 print("MultiReactOS Setup V1.0")
 print(" ")
 print("Writing " .. programname)
 if( inst == 1 ) then
 content = eeprom.get()
 content = content:gsub("^%s+", ""):gsub("%s+$", "")
 if content ~= "" then
  computer.beep(2000, 0.5)
  print("EEPROM is not empty!")
  print("Overwrite? [Y/n]")
  ow = string.lower(tostring(io.read()))
  if (ow == "n") then
   error("Overwrite aborted by user, file not written")
  else
   print("Overwriting")
  end
 end
  eeprom.set(script)
  eeprom.setLabel(programname)
  if ( wrp == 1 ) then
   wp = eeprom.makeReadonly(eeprom.getChecksum())
   if (wp ~= true) then
    error("Setting EEPROM as readonly: failed")
   else
    print("Setting EEPROM as readonly: done")
   end
  end
  content = eeprom.get()
  if (content == script) then
   print("EEPROM succesfully written!")
  else
   error("Error writing "..programname..". The EEPROM is readonly or not present")
  end
 else
   if require("filesystem").get(path).isReadOnly() then
    error(path.." is readonly")
   end
   path = path .. "/" .. programname .. ".lua"
   if fs.exists(path) then
    computer.beep(2000, 0.5)
    print("Another "..programname.." founded in this path")
    print("Overwrite? [Y/n]")
    ow = string.lower(tostring(io.read()))
    if (ow == "n") then
     error("Overwrite aborted by user, file not written")
   else
    print("Overwriting "..programname)
   end
   end
   file = io.open(path, "w")
   if file then
   file:write(script)
   file:close()
   file = io.open(path, "r")
   if file then
   data = file:read("*a")
   file:close()
   else
    error("File cannot be opened")
   end
  if (fs.exists(path) == false) then
   error("File write error: file not exists")
  elseif (data == script) then
   print("Program succesfully written!")
  else
   error("File write error: file content not equal with the program")
  end
  else
   error("File cannot be opened")
  end
 end
 print(" ")
 print("Press any key to exit")
 event.pull("key_down")
end
 term.clear()
