module Euler.Problem002 (main, fibs) where

import Control.Monad

-- Return the fibonnaci sequence with the next term prepending the list
fibs :: [Int]
fibs = 1 : 2 : [ (x + y) | (x, y) <- zip fibs (tail fibs) ]

main :: IO ()
main = do
  -- maximum <- promptInt "What is the maximum fibonnaci number?"
  -- print (maximum)
  return ()
