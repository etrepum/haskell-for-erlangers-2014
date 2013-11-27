sum :: Num [a] => [a] -> a
sum = go 0
  where
    go acc _
      | seq acc False = undefined
    go acc (x:xs)     = go (acc + x) (go xs)
    go acc []         = acc
