module Mailboxes
  ( buildMailboxes
  ) where

buildMailboxes :: [String] -> String
buildMailboxes = ("mailboxes " ++) . unwords
