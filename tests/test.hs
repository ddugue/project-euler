import Test.Tasty
import Test.Tasty.HUnit

import Data.List
import Data.Ord

import qualified Euler.Problem001
import qualified Euler.Problem002

main = defaultMain problems

problems :: TestTree
problems = testGroup "Problems 001-025" [problem001, problem002]

problem001 :: TestTree
problem001 = testGroup "Problem 001"
  [ testCase "Sum products 1"
    (assertEqual "Sumproducts of 10 must equal 23" 23
     (Euler.Problem001.sumProducts 10 [3,5])) ]

problem002 :: TestTree
problem002 = testGroup "Problem 002"
  [ testCase "Fibonnaci"
    (assertEqual "Fibonnaci sequence" [1,2,3,5,8,13,21]
     (take 7 Euler.Problem002.fibs)) ]
