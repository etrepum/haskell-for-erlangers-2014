module List where

data List a = Cons a (List a)
            | Nil

instance (Eq a) => Eq (List a) where
  (Cons a as) == (Cons b bs) = a == b && as == bs
  Nil         == Nil         = True
  _           == _           = False

instance Functor List where
  fmap _ Nil         = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)
