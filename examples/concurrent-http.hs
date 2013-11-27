import Control.Concurrent
import Network.HTTP

getHTTP :: String -> IO String
getHTTP url = simpleHTTP (getRequest url) >>= getResponseBody

urls :: [String]
urls = map ("http://ifconfig.me/"++) ["ip", "host"]

startRequest :: String -> IO (MVar ())
startRequest url = do
  v <- newEmptyMVar
  forkIO (getHTTP url >>= putStr >> putMVar v ())
  return v

main :: IO ()
main = do
  mvars <- mapM startRequest urls
  mapM_ takeMVar mvars
