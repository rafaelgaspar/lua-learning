require "luarocks.loader"
require "complex"

function is_in_mendelbrot_set(c)
  z = complex.new(0,0)
  h = {complex.new(0,0)}
  i = 1
  while true do
    z = z*z + c
    if not (z:real() >= 0 or z:real() <= 0) or not (z:imag() >= 0 or z:imag() <= 0) then
      return false
    end
    
    for j=1, i do
      if math.floor(h[j]:real()*100) == math.floor(z:real()*100) and math.floor(h[j]:imag()*100) == math.floor(z:imag()*100) then
        return true
      end
    end
    
    i = i+1
    h[i] = z
  end
end

function main()
  x = 2000
  y = 2000
  
  print("P1")
  print(x .. " " .. y)
  for i=0, x-1 do
    for j=0, y-1 do
      if is_in_mendelbrot_set(complex.new((j-(6*y/9))/(y/3),(i-(x/2))/(x/3))) then
        io.write("1")
      else
        io.write("0")
      end
      if j == y-1 then
        io.write("\n")
      else
        io.write(" ")
      end
    end
  end
  
end

main()


--[[require("luaunit")

TestMendelbrot = {} --class
  function TestMendelbrot:test_for_1()
    assertEquals(is_in_mendelbrot_set(complex.new(1,0)), false)
  end
  
  function TestMendelbrot:test_for_i()
    assertEquals(is_in_mendelbrot_set(complex.new(0,1)), true)
  end
  
  function TestMendelbrot:test_for_2()
    assertEquals(is_in_mendelbrot_set(complex.new(2,0)), false)
  end
  
  function TestMendelbrot:test_for_2i()
    assertEquals(is_in_mendelbrot_set(complex.new(0,2)), false)
  end
  
  function TestMendelbrot:test_for_2_plus_2i()
    assertEquals(is_in_mendelbrot_set(complex.new(2,2)), false)
  end
  
  function TestMendelbrot:test_for_minus_1()
    assertEquals(is_in_mendelbrot_set(complex.new(-1,0)), true)
  end
  
  
-- class TestMendelbrot

LuaUnit:run() -- run all tests]]--
