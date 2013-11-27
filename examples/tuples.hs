-- [a], type can be written prefix as `[] a`
someList, someOtherList :: [Int]
someList = [1, 2, 3]
someOtherList = (:) 4 (5 : (:) 6 [])

-- (a, b), can be written prefix as `(,) a b`
someTuple, someOtherTuple :: (Int, Char)
someTuple = (10, '4')
someOtherTuple = (,) 4 '2'

-- [Char], also known as String
-- (also see the OverloadedStrings extension)
someString :: String
someString = "foo"
