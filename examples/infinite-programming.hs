fib :: [Integer]
fib = 0 : 1 : zipWith (+) fib (tail fib)

cycle :: [a] -> [a]
cycle xs = xs ++ cycle xs

iterate :: (a -> a) -> a -> [a]
iterate f x = x : iterate f (f x)

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs)
  | p x       = x : takeWhile p xs
  | otherwise = []
