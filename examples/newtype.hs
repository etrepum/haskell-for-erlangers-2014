import Data.List (sort)

newtype Down a = Down { unDown :: a }
                 deriving (Eq)

instance (Ord a) => Ord (Down a) where
  compare (Down a) (Down b) = case compare a b of
    LT -> GT
    EQ -> EQ
    GT -> LT

reverseSort :: Ord a => [a] -> [a]
reverseSort = map unDown . sort . map Down
