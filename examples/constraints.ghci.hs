h> let f x = head True

<interactive>:23:16:
    Couldn't match expected type `[a0]' with actual type `Bool'
    In the first argument of `head', namely `True'
    In the expression: head True
    In an equation for `f': f x = head True

h> let f x = heads True

<interactive>:24:11:
    Not in scope: `heads'
    Perhaps you meant one of these:
      `reads' (imported from Prelude), `head' (imported from Prelude)
