module Utils.Prompt (promptInt, promptIntList) where

import Data.List.Split
import Control.Monad

readIntList :: String -> [Int]
readIntList = (map (read::String->Int)) . (splitOn ",")

promptInt :: String -> IO Int
promptInt prompt = do
  putStrLn prompt
  readLn

promptIntList :: String -> IO [Int]
promptIntList prompt = do
  putStrLn prompt
  ints <- getLine
  return (readIntList ints)
