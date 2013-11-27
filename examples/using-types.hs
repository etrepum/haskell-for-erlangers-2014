-- Bindings can be annotated
success :: a -> Maybe a
-- Constructors are functions
success = Just

-- Constructors can be pattern matched
-- _ is a wildcard
case success True of
  Just True -> ()
  _         -> ()

-- Values can be annotated in-line
2 ^ (1 :: Int)
