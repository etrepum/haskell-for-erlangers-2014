-- [1..] is an infinite list, [1, 2, 3, ...]
print (head (map (*2) [1..]))
-- Outside in, print x = putStrLn (show x)
putStrLn (show (head (map (*2) [1..]))
-- head (x:_) = x
-- map f (x:xs) = f x : map f xs
-- desugar [1..] syntax
putStrLn (show (head (map (*2) (enumFrom 1))))
-- enumFrom n = n : enumFrom (succ n)
putStrLn (show (head (map (*2) (1 : enumFrom (succ 1)))))
-- apply map
putStrLn (show (head ((1*2) : map (*2) (enumFrom (succ 1)))))
-- apply head
putStrLn (show (1*2))
-- show pattern matches on its argument
putStrLn (show 2)
-- apply show
putStrLn "2"
