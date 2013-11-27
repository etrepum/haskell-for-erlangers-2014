class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b
  (>>)  :: m a -> m b -> m b
  ma >> mb = ma >>= \_ -> mb

instance Monad [] where
  return = pure
  m >>= f = concatMap f m

instance Monad Maybe where
  return = pure
  Just x  >>= f = f x
  Nothing >>= _ = Nothing
