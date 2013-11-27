-- Function composition
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)

-- Function application (with a lower precedence)
($) :: (a -> b) -> a -> b
f $ x =  f x
