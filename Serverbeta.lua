local e = computer
local m = component.proxy(component.list("modem")())

m.open(528)
m.open(529)
m.open(527)

local msg1, msg2

while not (msg1 and msg2) do
  local _, _, _, port, _, data = e.pullSignal(5)
  if port == 528 then msg2 = tostring(data) end
  if port == 529 then msg1 = tostring(data) end
end

local function getFirstTwoNumbers(msg)
  local sorok = {}
  for line in msg:gmatch("[^\n]+") do
    table.insert(sorok, line)
  end
  local num1 = tonumber(sorok[1]) or 0
  local num2 = tonumber(sorok[2]) or 0
  return num1, num2
end


local function splitMessage(msg)
  local lines = {}
  for line in msg:gmatch("[^\n]+") do
    table.insert(lines, line)
  end

  local first = lines[1] or ""
  local second = lines[2] or ""

  local remaining = {}
  for i = 3, #lines do
    table.insert(remaining, lines[i])
  end
  local restText = table.concat(remaining, "\n")

  return first, second, restText
end


while true do
 while not (msg1 and msg2) do
  local _, _, _, port, _, data = e.pullSignal(5)
  if port == 528 then msg2 = tostring(data) end
  if port == 529 then msg1 = tostring(data) end
 end

m11, m12 = getFirstTwoNumbers(msg1)
m21, m22 = getFirstTwoNumbers(msg2)

if m11 > m21 then
 line1 = m11
else
 line1 = m21
end

line2 = m12 + m22

_, _, rest1 = splitMessage(msg1)
_, _, rest2 = splitMessage(msg2)

combined = line1.."\n"..line2.."\n"..  rest1 .. "\n" .. rest2

  m.broadcast(527, combined)
  e.pullSignal(1) -- kb. 1 másodperc szünet
end
