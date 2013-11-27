-- FlipImage.hs
import System.Environment
import Data.Word
import Data.Array.Repa hiding ((++))
import Data.Array.Repa.IO.DevIL
import Data.Array.Repa.Repr.ForeignPtr

main :: IO ()
main = do
  [f] <- getArgs
  (RGB v) <- runIL $ readImage f
  rotated <- (computeP $ rot180 v) :: IO (Array F DIM3 Word8)
  runIL $ writeImage ("flip-"++f) (RGB rotated)

rot180 :: (Source r e) => Array r DIM3 e -> Array D DIM3 e
rot180 g = backpermute e flop g
  where
    e@(Z :. x :. y :. _) = extent g
    flop (Z :. i         :. j         :. k) =
         (Z :. x - i - 1 :. y - j - 1 :. k)
