h> let x = x in x
-- Infinite recursion, not a fun case to deal with!

h> case False of True -> ()
*** Exception: <interactive>:29:1-24: Non-exhaustive patterns in case

h> head []
*** Exception: Prelude.head: empty list

h> error "this throws an exception"
*** Exception: this throws an exception

h> undefined
*** Exception: Prelude.undefined
