-- WordCount2.hs

main :: IO ()
main =
  getContents >>= \input ->
    let wordCount = length (words input)
    in print wordCount
