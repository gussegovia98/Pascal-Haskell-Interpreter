-- HSpec tests for Interpret.hs
-- Execute: runhaskell InterpretSpec.hs

import qualified Data.Map as Map
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Pascal.Data
import Pascal.Interpret

emptyStack :: PrgmData
emptyStack = ("", "", False, [(Map.fromList [], Map.fromList [])], (False, False))

varStackValue = 13.3
varStackBoolValue = True

varStack :: PrgmData
varStack = ("", "", False, [(Map.fromList [("x", RealVal varStackValue), ("b", BoolVal varStackBoolValue)], Map.fromList [])], (False, False))

main :: IO ()
main = hspec $ do
    describe "lookupVar" $ do
        it "just returns initialized var" $ do
            lookupVar "x" varStack `shouldBe` (Just (RealVal 13.3))
        it "just returns un-initialized var" $ do
            lookupVar "x" ("", "", False, [(Map.fromList [("x", UninitReal)], Map.fromList [])], (False, False)) `shouldBe` (Just UninitReal)
        it "returns nothing for missing vars" $ do
            lookupVar "y" varStack `shouldBe` Nothing

    describe "biOp2" $ do
        it "adds two floats" $ do
            biOp2 "+" 1.0 1.0 `shouldBe` 2.0
        it "subtracts two floats" $ do
            biOp2 "-" 1.0 1.0 `shouldBe` 0.0
        it "multiplies two floats" $ do
            biOp2 "*" 1.0 3.0 `shouldBe` 3.0
        it "divides two floats" $ do
            biOp2 "/" 1.0 2.0 `shouldBe` 0.5

    describe "siOp1" $ do
        it "unary minus" $ do
            siOp1 "-" 1.0 `shouldBe` -1.0

    describe "intExp" $ do
        it "converts floats to floats" $ do
            intExp (Real 1.0) emptyStack `shouldBe` (1.0, emptyStack)
        it "converts ints to floats" $ do
            intExp (IntR 1) emptyStack `shouldBe` (1.0, emptyStack)
        it "converts variable to float" $ do
            intExp (Var "x") varStack `shouldBe` (varStackValue, varStack)
        it "returns error on missing variable" $ do
            intExp (Var "y") varStack `shouldBe` (0.0, ("", "variable y could not be found", True, [(Map.fromList [("x", RealVal varStackValue), ("b", BoolVal varStackBoolValue)], Map.fromList [])], (False, False)))
        it "handles basic Op1" $ do
            intExp (Op1 "-" (Real 1.0)) emptyStack `shouldBe` (-1.0, emptyStack)
        it "handles complex Op1" $ do
            intExp (Op1 "-" (Var "x")) varStack `shouldBe` (-varStackValue, varStack)
        it "handles basic Op2" $ do
            intExp (Op2 "-" (Real 1.0) (Real 2.0)) emptyStack `shouldBe` (-1.0, emptyStack)
        it "handles complex Op2" $ do
            intExp (Op2 "-" (Var "x") (Var "x")) varStack `shouldBe` (0.0, varStack)

    describe "boolOp2" $ do
        it "ANDs booleans" $ do
            boolOp2 "and" True True `shouldBe` True
            boolOp2 "and" False True `shouldBe` False
            boolOp2 "and" True False `shouldBe` False
            boolOp2 "and" False False `shouldBe` False
        it "ORs booleans" $ do
            boolOp2 "or" True True `shouldBe` True
            boolOp2 "or" False True `shouldBe` True
            boolOp2 "or" True False `shouldBe` True
            boolOp2 "or" False False `shouldBe` False
        it "XORs booleans" $ do
            boolOp2 "xor" True True `shouldBe` False
            boolOp2 "xor" False True `shouldBe` True
            boolOp2 "xor" True False `shouldBe` True
            boolOp2 "xor" False False `shouldBe` False
    
    describe "boolComp" $ do
        it "LT" $ do
            boolComp "<" 0.0 1.0 `shouldBe` True
            boolComp "<" 1.0 0.0 `shouldBe` False
            boolComp "<" 0.0 0.0 `shouldBe` False
        it "GT" $ do
            boolComp ">" 0.0 1.0 `shouldBe` False
            boolComp ">" 1.0 0.0 `shouldBe` True
            boolComp ">" 0.0 0.0 `shouldBe` False
        it "LT EQ" $ do
            boolComp "<=" 0.0 1.0 `shouldBe` True
            boolComp "<=" 1.0 0.0 `shouldBe` False
            boolComp "<=" 0.0 0.0 `shouldBe` True
        it "GT EQ" $ do
            boolComp ">=" 0.0 1.0 `shouldBe` False
            boolComp ">=" 1.0 0.0 `shouldBe` True
            boolComp ">=" 0.0 0.0 `shouldBe` True
        it "Not Equal" $ do
            boolComp "<>" 0.0 1.0 `shouldBe` True
            boolComp "<>" 1.0 0.0 `shouldBe` True
            boolComp "<>" 0.0 0.0 `shouldBe` False
        it "Equal" $ do
            boolComp "==" 0.0 1.0 `shouldBe` False
            boolComp "==" 1.0 0.0 `shouldBe` False
            boolComp "==" 0.0 0.0 `shouldBe` True
    
    describe "boolExp" $ do
        it "converts bools to bools" $ do
            boolExp (Boolean True) emptyStack `shouldBe` (True, emptyStack)
        it "converts constant true to bool" $ do
            boolExp (True_C) emptyStack `shouldBe` (True, emptyStack)
        it "converts constant false to bool" $ do
            boolExp (False_C) emptyStack `shouldBe` (False, emptyStack)
        it "converts vars to bools" $ do
            boolExp (VarB "b") varStack `shouldBe` (varStackBoolValue, varStack)
        it "inverts simple bools" $ do
            boolExp (Not (Boolean True)) emptyStack `shouldBe` (False, emptyStack)
        it "inverts complex bools" $ do
            boolExp (Not (Not (Boolean True))) emptyStack `shouldBe` (True, emptyStack)
        it "handles simple 2 ops" $ do
            boolExp (OpB "and" (Boolean True) (Boolean False)) emptyStack `shouldBe` (False, emptyStack)
        it "handles complex 2 ops" $ do
            boolExp (OpB "and" (VarB "b") (Not (Boolean False))) varStack `shouldBe` (varStackBoolValue, varStack)
        it "handles simple 2 comps" $ do
            boolExp (Comp "<" (Real 1.0) (Real 2.0)) emptyStack `shouldBe` (True, emptyStack)
        it "handles complex 2 comps" $ do
            boolExp (Comp ">=" (Var "x") (Var "x")) varStack `shouldBe` (True, varStack)

    describe "formatFloat" $ do
        it "formats positive floats" $ do
            formatFloat (1.0) `shouldBe` "1.0000000000E0"
        it "formats negative floats" $ do
            formatFloat (-1.0) `shouldBe` "-1.0000000000E0"

    describe "formatBool" $ do
        it "formats True" $ do
            formatBool True `shouldBe` "TRUE"
        it "formats False" $ do
            formatBool False `shouldBe` "FALSE"

    describe "putVar" $ do
        it "puts a real" $ do
            putVar "i" (RealVal 1.0) emptyStack `shouldBe` ("", "", False, [(Map.fromList [("i", RealVal 1.0)], Map.fromList [])], (False, False))
