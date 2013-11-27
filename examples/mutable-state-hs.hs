import Control.Concurrent
data Foo = Foo {bar :: Int, baz :: Int}
         deriving (Show)

main :: IO ()
main = do
  fooVar <- newMVar (Foo { bar = 1, baz = 20 })
  let whileLoop = do
      foo <- takeMVar fooVar
      if baz foo > bar foo
      then do
        putMVar fooVar (foo { bar = 1 + bar foo })
        whileLoop
      else
        putMVar fooVar foo
  whileLoop
  withMVar fooVar print