-- WordCount3.hs

main :: IO ()
main = getContents >>= print . length . words
