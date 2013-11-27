-- WordCount1.hs

main :: IO ()
main = do
  input <- getContents
  let wordCount = length (words input)
  print wordCount
