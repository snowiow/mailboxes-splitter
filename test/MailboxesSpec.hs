module MailboxesSpec
  ( spec
  ) where

import Mailboxes
import Test.Hspec

spec :: Spec
spec = do
  describe "buildMailboxesFile" $ do
    it "combines all mailboxes from a list into a mailboxes string" $ do
      let actual =
            buildMailboxesFile ["+Work/Sent", "+Work/INBOX", "+Work/Trash"]
          expected = "mailboxes \"+Work/Sent\" \"+Work/INBOX\" \"+Work/Trash\""
      actual `shouldBe` expected
  describe "filterByPrefix" $ do
    it "filters only mailboxes with a specific prefix from a given string" $ do
      let actual =
            filterByPrefix
              "Work"
              [ "mailboxes"
              , "+Work/Sent"
              , "+Work/INBOX"
              , "+Work/Trash"
              , "+Private/INBOX"
              ]
          expected = ["+Work/Sent", "+Work/INBOX", "+Work/Trash"]
      actual `shouldBe` expected
  describe "extractMailboxes" $ do
    it "extracts the mailboxes from a mailboxes file content" $ do
      let actual =
            extractMailboxes
              "mailboxes \"+Work/Sent Items\" \"+Work/INBOX\" \"+Work/Trash\""
          expected = ["+Work/Sent Items", "+Work/INBOX", "+Work/Trash"]
      actual `shouldBe` expected
