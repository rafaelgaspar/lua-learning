function fizzbuzz()
  a = {} -- new array
  for i=1, 1000 do
    if i%3 == 0 and i%7 ~= 0 then
      a[i] = "fizz"
    elseif i%3 ~= 0 and i%7 == 0 then
      a[i] = "buzz"
    elseif i%3 == 0 and i%7 == 0 then
      a[i] = "fizzbuzz"
    else
      a[i] = i
    end
  end
  
  return a
end

require("luaunit")

TestFizzBuzz = {} --class
  function TestFizzBuzz:test_for_1()
    assertEquals(fizzbuzz()[1], 1)
  end
  
  function TestFizzBuzz:test_for_2()
    assertEquals(fizzbuzz()[2], 2)
  end
  
  function TestFizzBuzz:test_for_3()
    assertEquals(fizzbuzz()[3], "fizz")
  end
  
  function TestFizzBuzz:test_for_4()
    assertEquals(fizzbuzz()[4], 4)
  end
  
  function TestFizzBuzz:test_for_7()
    assertEquals(fizzbuzz()[7], "buzz")
  end
  
  function TestFizzBuzz:test_for_21()
    assertEquals(fizzbuzz()[21], "fizzbuzz")
  end
-- class TestFizzBuzz

LuaUnit:run() -- run all tests