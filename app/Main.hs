module Main where

import Data.Strings (strStartsWith)
import Mailboxes (buildMailboxes)
import System.Environment (getArgs)
import System.IO (IOMode(ReadMode), hGetContents, openFile)

filterMailboxes :: String -> [String] -> [String]
filterMailboxes prefix = filter (`strStartsWith` mailPrefix)
  where
    mailPrefix = "\"+" ++ prefix

main :: IO ()
main = do
  (path:prefix:_) <- getArgs
  let mailboxesFile = path ++ "/mailboxes"
  handle <- openFile mailboxesFile ReadMode
  contents <- hGetContents handle
  let resultContent = buildMailboxes . filterMailboxes prefix $ words contents
  writeFile (mailboxesFile ++ "_" ++ prefix) (resultContent ++ "\n")
