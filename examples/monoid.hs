class Monoid a where
  mempty :: a
  mappend :: a -> a -> a

instance Monoid [a] where
  mempty = []
  mappend = (++)

infixr 6 <>
(<>) :: (Monoid a) => a -> a -> a
(<>) = mappend
