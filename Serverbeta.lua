local e = computer
local m = component.proxy(component.list("modem")())

m.open(528)
m.open(529)
m.open(527)

msg1 = "1".."\n".."1".."\n"
msg2 = "1".."\n".."1".."\n"

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
  local _, _, _, port, _, data = e.pullSignal(1)
  if port == 528 then msg2 = tostring(data) end
  if port == 529 then msg1 = tostring(data) end

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
end
