greeting :: String
greeting = "Hello, "

sayHello :: String -> String
sayHello name = greeting ++ name
-- desugars to:
sayHello = \name -> (++) greeting name

sayHello name = result
  where result = greeting ++ name
-- desugars to:
sayHello = \name ->
  let result = (++) greeting name
  in result
