{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Tuples(testShow) where

import qualified Data.Text as T
import qualified Database.PostgreSQL.Simple as SQL

creds :: SQL.ConnectInfo
creds =
  SQL.defaultConnectInfo
    { SQL.connectUser = "suppliers",
      SQL.connectPassword = "1234",
      SQL.connectDatabase = "suppliers"
    }

selectBooks :: SQL.Connection -> IO[(Int, T.Text, Int)]
selectBooks conn = SQL.query_ conn "select id, title, author_id from testbooks"

testShow :: IO()
testShow = do
  conn <- SQL.connect creds
  books <- selectBooks conn
  print books
      
