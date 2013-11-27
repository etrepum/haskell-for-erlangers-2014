{-# LANGUAGE OverloadedStrings #-}
module SJSON where
import Prelude hiding (concat)
import Data.Text (Text, concat)
import Data.Attoparsec.Text
import Control.Applicative

data JSON = JArray [JSON]
          | JObject [(Text, JSON)]
          | JText Text
          deriving (Show)

pJSON :: Parser JSON
pJSON = choice [ pText, pObject, pArray ]
  where
    pString = concat <$> "\"" .*> many pStringChunk <*. "\""
    pStringChunk = choice [ "\\\"" .*> pure "\""
                          , takeWhile1 (not . (`elem` "\\\""))
                          , "\\" ]
    pText = JText <$> pString
    pPair = (,) <$> pString <*. ":" <*> pJSON
    pObject = JObject <$> "{" .*> (pPair `sepBy` ",") <*. "}"
    pArray = JArray <$> "[" .*> (pJSON `sepBy` ",") <*. "]"