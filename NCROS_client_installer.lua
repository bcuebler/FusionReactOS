script [==[

local gpu = component.proxy(component.list("gpu")())
local screen = component.proxy(component.list("screen")())
local modem = component.proxy(component.list("modem")())

gpu.bind(screen.address)
gpu.setResolution(50, 10)
--gpu.setForeground(0xFFFFFF)
--gpu.setBackground(0x000000)

modem.open(port)

while true do
  local sig, _, _, _, _, msg = computer.pullSignal("modem_message")
  if msg then
    gpu.fill(1, 1, 50, 10, " ")

    local i = 1
    for line in tostring(msg):gmatch("([^\n]*)\n?") do
      if i > 10 then break end
      gpu.set(1, i, line:sub(1, 50))
      i = i + 1
    end
  end
end
]==]

