-- Polymorphic and recursive
data List a = Cons a (List a)
            | Nil
            deriving (Show)

data Tree a = Leaf a
            | Branch (Tree a) (Tree a)
            deriving (Show)

listMap :: (a -> b) -> List a -> List b
listMap _ Nil         = Nil
listMap f (Cons x xs) = Cons (f x) (listMap f xs)

treeToList :: Tree a -> List a
treeToList root = go root Nil
  where
    -- Note that `go` returns a function!
    go (Leaf x)     = Cons x
    go (Branch l r) = go l . go r
