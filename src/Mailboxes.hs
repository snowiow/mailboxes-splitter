module Mailboxes
  ( buildMailboxesFile
  , filterByPrefix
  , extractMailboxes
  ) where

import Data.Strings (strStartsWith)

filterByPrefix :: String -> [String] -> [String]
filterByPrefix prefix = filter (`strStartsWith` mailPrefix)
  where
    mailPrefix = '+' : prefix

buildMailboxesFile :: [String] -> String
buildMailboxesFile = ("mailboxes " ++) . unwords . map (\x -> "\"" ++ x ++ "\"")

extractMailboxes :: String -> [String]
extractMailboxes = tail . filter (/= " ") . splitByQuote

splitByQuote :: String -> [String]
splitByQuote input =
  case break (== '"') input of
    (first, '"':rest) -> first : splitByQuote rest
    (first, "") -> []
