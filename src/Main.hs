module Main where

import Pascal
import qualified Data.Map as Map
import System.Environment

defaultStack :: PrgmData
defaultStack = ("", "", False, [(Map.fromList [], Map.fromList [])], (False, False),Map.fromList [])

main :: IO ()
main = do
    (fileName:_) <- getArgs
    contents <- readFile fileName
    case parseString contents of 
        Left err -> print $ show err
        Right ast -> 
            let (stdout, stderr, didErr, _, _,_) = fullInterpret ast defaultStack
            in if didErr then putStrLn (stderr ++ " AST: " ++ show ast) else putStrLn $ stdout ++ " AST: " ++ show ast
