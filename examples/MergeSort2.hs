-- MergeSort2.hs
module MergeSort2 (mergeSort) where

-- | Bottom-up merge sort.
mergeSort :: Ord a => [a] -> [a]
mergeSort = mergeAll . map (:[])
  where
    mergeAll []   = []
    mergeAll [xs] = xs
    mergeAll xss  = mergeAll (mergePairs xss)

    mergePairs (a:b:xs) =
      merge a b : mergePairs xs
    mergePairs xs = xs

    merge as@(a:as') bs@(b:bs')
      | a > b     = b : merge as bs'
      | otherwise = a : merge as' bs
    merge [] bs = bs
    merge as [] = as
