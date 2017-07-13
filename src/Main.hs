module Main where
import Data.Map (Map, fromList, (!))
import System.Environment (getArgs)

-- imports
import qualified Euler.Problem001
problems :: Map Integer (IO ())
problems = fromList
  [ (1, Euler.Problem001.main) ]

main :: IO ()
main = do
    putStrLn "Please choose a run: "
    p <- readLn
    fn <- problems ! p
    return ()
