module MailboxesSpec
  ( spec
  ) where

import Mailboxes
import Test.Hspec

spec :: Spec
spec =
  describe "buildMailboxes" $ do
    it "combines all mailboxes from a list into a mailboxes string" $ do
      actual `shouldBe` expected
  where
    actual =
      buildMailboxes ["\"+Work/Sent\"", "\"+Work/INBOX\"", "\"+Work/Trash\""]
    expected = "mailboxes \"+Work/Sent\" \"+Work/INBOX\" \"+Work/Trash\""
