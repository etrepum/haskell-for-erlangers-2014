-- MergeSort1.hs
module MergeSort1 (mergeSort) where

-- | Bottom-up merge sort.
mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort xs = mergeAll [[x] | x <- xs]

mergeAll :: Ord a => [[a]] -> [a]
mergeAll [xs] = xs
mergeAll xss  = mergeAll (mergePairs xss)

mergePairs :: Ord a => [[a]] -> [[a]]
mergePairs (a:b:xs) =
  merge a b : mergePairs xs
mergePairs xs = xs

merge :: Ord a => [a] -> [a] -> [a]
merge as@(a:as') bs@(b:bs')
 | a > b     = b : merge as bs'
 | otherwise = a : merge as' bs
merge [] bs = bs
merge as [] = as
