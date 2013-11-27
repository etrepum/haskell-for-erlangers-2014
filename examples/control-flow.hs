if' :: Bool -> a -> a -> a
if' cond a b = case cond of
  True  -> a
  False -> b

(&&) :: Bool -> Bool -> Bool
a && b = case a of
  True  -> b
  False -> False

const :: a -> b -> a
const x = \_ -> x
