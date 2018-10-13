module Main where

import Mailboxes (buildMailboxesFile, extractMailboxes, filterByPrefix)
import System.Environment (getArgs)
import System.IO (IOMode(ReadMode), hGetContents, openFile)

main :: IO ()
main = do
  (path:prefix:_) <- getArgs
  let mailboxesFile = path ++ "/mailboxes"
  handle <- openFile mailboxesFile ReadMode
  contents <- hGetContents handle
  let resultContent =
        buildMailboxesFile . filterByPrefix prefix $ extractMailboxes contents
  writeFile (mailboxesFile ++ "_" ++ prefix) (resultContent ++ "\n")
