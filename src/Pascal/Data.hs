-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Pascal.Data
    (
        Exp(..),
        BoolExp(..),
        OneLine(..),
        Statement(..),
        VType(..),
        Definition(..),
        FullProgram,
        Program,
        FunctionData,
        PrgmData,
        Variable(..)
    ) where

import qualified Data.Map as Map

-- Data-structure for  numeric expressions
data Exp = 
    -- unary operator: Op name expression
    Op1 String Exp
    -- binary operator: Op name leftExpression rightExpression
    | Op2 String Exp Exp
    -- special operator
    | Op3 String Exp 
    -- function call: FunctionCall name ListArguments
    | FunCall String [Exp]
    -- real value: e.g. Real 1.0
    | Real Float
    | IntR Int
    -- variable: e.g. Var "x"
    | Var String
    deriving(Show)

-- Data-structure for boolean expressions
data BoolExp = 
    -- binary operator on boolean expressions
    OpB String BoolExp BoolExp
    -- negation, the only unary operator
    | Not BoolExp
    -- comparison operator: Comp name expression expression
    | Comp String Exp Exp
    
    -- true and false constants
    | True_C
    | False_C
    | Boolean Bool
    | VarB String
    deriving(Show)

data OneLine = 
    String

-- Data-structure for statements
data Statement = 
    -- TODO: add other statements
    -- Variable assignment
     AssignVarR String Exp
    | AssignVarB String BoolExp
    -- Evaluate espression
    | EvalSingleB BoolExp
    | EvalSingleR Exp
     -- IO
    | VarIO String String
    | FloatIO String Exp
    | BoolIO String BoolExp
    | ReadIO String String
    --func stuff
    | FuncCall String [String]
    | AssignFuncCall String String [String]
    -- If statement
    | IF BoolExp Statement Statement
    --break/continue
    | LoopStop String
    --loops
    | WHILE BoolExp Statement
    | FOR String Int Int Statement 
    -- Case
    | CASE BoolExp Bool Statement Bool Statement
    -- Block
    | Block [Statement]
    deriving(Show)

data VType =  REAL | BOOL | STRING
    deriving(Show)

data Definition = 
    -- Variable definition, list of var, type  CHECK THIS 
    VarDef [String] VType
    | SingleVar String VType
    | RealVars String VType Exp
    | FunctionCall  String [([String], VType)] VType ([Definition],[Statement])
    | ProcedureCall String [([String], VType)] ([Definition],[Statement])
    | BoolVars String VType BoolExp
    deriving(Show)

-- Data-structure for whole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
--main program is list of definitions: use a tuple (check book)
type FullProgram = ([Definition], [Statement])
type Program = [Statement]
type FunctionData = ([([String], VType)], VType, [Definition], [Statement])

data Variable =
    RealVal Float
    | BoolVal Bool
    | StrVal String
    | UninitReal
    | UninitBool
    | UninitStr
    | PUninitReal
    | PUninitBool
    | PUninitStr
    | NothingValue
    deriving(Show, Eq)

type StdOut = String
type StdErr = String
type DidError = Bool
type DoContinue = Bool
type DoBreak = Bool
type LoopFlags = (DoContinue, DoBreak)
type Vars = Map.Map String Variable
type Globals = Map.Map String Variable
type ScopeStack = [(Vars, Globals)]
type FunctMap = Map.Map String FunctionData

type PrgmData = (StdOut, StdErr, DidError, ScopeStack, LoopFlags, FunctMap)
