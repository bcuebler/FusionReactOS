--requirements:
--Writable eeprom(installer)
--Redstone I/O block/card tier 1/2 (only one!)
--Modem or wireless modem(if enabled in setup)
--tier 1 gpu, and screen or more(if enabled in setup)
--tier 1 ram or more
--tier 1 cpu/apu or more
--NuclearCraft Fusion reactor
 
 
 component = require("component")
 computer = require("computer")
 term = require("term")
 eeprom = component.eeprom
 
computer.beep()
term.clear()
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
 
print("FusionReactOS Setup V1.0")
print(" ")
print("Insert an EEPROM to be written THEN continue")
print(" ")
print("Modem installed? [Y/n]")
 modm = string.lower(tostring(io.read()))
 if( modm == "y" ) then
  modm = 1
 else
  modm = 0
 end
term.clear()
print("FusionReactOS Setup V1.0")
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
print("FusionReactOS Setup V1.0")
print(" ")
print("Modem port?")
 port = tonumber(io.read())
term.clear()
end
 
if(( modm == 1 ) or ( scrn == 1 )) then
 print("FusionReactOS Setup V1.0")
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
 print("FusionReactOS Setup V1.0")
 print(" ")
 print("Enable alarm use as computer beeper? [Y/n]")
  almb = string.lower(tostring(io.read()))
   if( almb == "y" ) then
  almb = 1
 else
  almb = 0
 end
 term.clear()
 
print("FusionReactOS Setup V1.0")
print(" ")
print("Set EEPROM as read only? [Y/n]")
 wrp = string.lower(tostring(io.read()))
  if( wrp == "y" ) then
  wrp = 1
 else
  wrp = 0
 end
term.clear()
print("FusionReactOS Setup V1.0")
print(" ")
 
-- Main script
 script = [==[
 sideal = ]==] .. sideal .. [==[
 side = ]==] .. sidersleep .. [==[
 alert = false
 offside = ]==] .. offside .. [==[
 outside = ]==] .. outside .. [==[
 almb = ]==] .. almb .. [==[
 pwro = ]==] .. pwro .. [==[
 modm = ]==] .. modm .. [==[
 scrn = ]==] .. scrn .. [==[
 port = ]==] .. port .. [==[
 dt = ]==] .. dt .. [==[
 
 mod = "nil"
 
 delaly = 0
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
]==]
 
print("Writing FusionReactOS to EEPROM...")
eeprom.set(script)
eeprom.setLabel("FusionReactOS")
if ( wrp == 1 ) then
 eeprom.makeReadonly("fros")
end
print("EEPROM succesfully written!")
os.sleep(3)
term.clear()
