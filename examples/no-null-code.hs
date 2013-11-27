data Maybe a = Just a
             | Nothing

data Either a b = Left a
                | Right b

parseBit :: Char -> Maybe Int
parseBit '0' = Just 0
parseBit '1' = Just 1
parseBit _ = Nothing
