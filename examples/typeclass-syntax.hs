-- from using-types.hs
data Choice = Definitely
            | Possibly
            | NoWay
--
class Equals a where
  isEqual :: a -> a -> Bool

instance Equals Choice where
  isEqual Definitely Definitely = True
  isEqual Possibly   Possibly   = True
  isEqual NoWay      NoWay      = True
  isEqual _          _          = False

instance (Equals a) => Equals [a] where
  isEqual (a:as) (b:bs) = isEqual a b &&
                          isEqual as bs
  isEqual as     bs     = null as && null bs
