class (Functor f) => Applicative f where
  pure :: a -> f a
  infixl 4 <*>
  (<*>) :: f (a -> b) -> f a -> f b

instance Applicative [] where
  pure x = [x]
  fs <*> xs = concatMap (\f -> map f xs) fs

instance Applicative Maybe where
  pure = Just
  Just f <*> Just x = Just (f x)
  _      <*> _      = Nothing
