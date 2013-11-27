{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign.C.Types
import Control.Monad

foreign import ccall unsafe "stdlib.h rand"
     c_rand :: IO CUInt

main :: IO ()
main = replicateM_ 20 (c_rand >>= print)
