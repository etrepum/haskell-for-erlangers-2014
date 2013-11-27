-- Unlike Erlang, pattern matching is only on
-- constructors, never variables
isJust (Just _) = True
isJust Nothing  = False
-- desugars to:
isJust = \x ->
  case x of
    (Just _) -> True
    Nothing  -> False
