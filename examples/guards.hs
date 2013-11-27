isNegative :: (Num a) => a -> Bool
isNegative x
  | x < 0     = True
  | otherwise = False
-- desugars to:
isNegative = \x ->
  if (<) x 0
  then True
  else False
