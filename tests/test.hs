import Test.Tasty
import Test.Tasty.HUnit

import Data.List
import Data.Ord

import qualified Euler.Problem001

main = defaultMain problem001

problem001 :: TestTree
problem001 = testGroup "Problem 001"
  [ testCase "Sum products 1"
    (assertEqual "Sumproducts of 10 must equal 23" 23
     (Euler.Problem001.sumProducts 10 [3,5])) ]
