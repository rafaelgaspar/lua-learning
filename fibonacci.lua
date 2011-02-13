function fibonacci(x) 
  if x <= 1 then
    return x
  else
    return fibonacci(x-1) + fibonacci(x-2)
  end
end

require("luaunit")

TestFibonacci = {} --class
  function TestFibonacci:test_for_0()
    assertEquals(fibonacci(0), 0)
  end 
  
  function TestFibonacci:test_for_1()
    assertEquals(fibonacci(1), 1)
  end
  
  function TestFibonacci:test_for_2()
    assertEquals(fibonacci(2), 1)
  end
  
  function TestFibonacci:test_for_3()
    assertEquals(fibonacci(3), 2)
  end
  
  function TestFibonacci:test_for_42()
    assertEquals(fibonacci(42), 267914296)
  end
-- class TestFibonacci

LuaUnit:run() -- run all tests