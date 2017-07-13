module Euler.Problem001 (main, sumProducts) where

import Control.Monad
import Data.List (nub)
import Data.List.Split

import Utils.Prompt


multiples :: Int -> [Int]
multiples multiple = [multiple, multiple * 2..]

limitMultiples :: Int -> Int -> [Int]
limitMultiples maxValue = takeWhile (< maxValue) . multiples

mergeList :: Int -> [Int] -> [Int]
mergeList maxValue = concat . (map (limitMultiples maxValue))

sumProducts :: Int -> [Int] -> Int
sumProducts maxValue = sum . nub . (mergeList maxValue)

-- assert1 = assert (sumProducts 10 [3,5] == 25) "Sumproducts of 10 must equal 23"
-- assert2 = assert (sumProducts 1000 [3,5] == 23) "Sumproducts of 1000 must equal 23"

main :: IO ()
main = do
  maximum <- promptInt "What is the max?"
  products <- promptIntList "What are the products? (Comma-separated)"
  print (sumProducts maximum products)
  return ()
