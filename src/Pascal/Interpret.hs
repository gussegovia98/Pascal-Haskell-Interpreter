module Pascal.Interpret
(
    fullInterpret,
    interpret,
    lookupVar,
    biOp2,
    siOp1,
    intExp,
    boolOp2,
    boolComp,
    boolExp,
    pushScope,
    popScope,
    putVar,
    formatFloat,
    formatBool,
    whileExp,
    forExp
)
where

import qualified Data.Map as Map
import Text.Printf
import Pascal.Data
import Control.Applicative
import           Debug.Trace

lookupVar :: String -> PrgmData -> Maybe Variable
lookupVar name (_, _, _, (vars, globals):_tl, _,_) =
    Map.lookup name vars <|> Map.lookup name globals
lookupVar _ (_, _, _, [], _,_) = Nothing

--THIS IS LIKELY WHERE YOU WILL INTERPRET THE INFO
biOp2 :: String -> Float -> Float -> Float
biOp2 "+" v1 v2 = v1 + v2
biOp2 "-" v1 v2 = v1 - v2
biOp2 "*" v1 v2 = v1 * v2
biOp2 "/" v1 v2 = v1 / v2
biOp2 op _ _ = error $ "Unhandled biOp2 " ++ op

siOp1 :: String -> Float -> Float
siOp1 "-" v1 = -v1
siOp1 op _ = error $ "Unhandled siOp1 " ++ op

intExp :: Exp -> PrgmData -> (Float, PrgmData)
intExp (Op2 op e1 e2) p = (biOp2 op (fst $ intExp e1 p) (fst $ intExp e2 p), p)
intExp (Op1 op e1) p = (siOp1 op (fst $ intExp e1 p), p)
intExp (Real r) p = (r, p)
intExp (IntR i) p = (fromIntegral i :: Float, p)
intExp (Var name) (stdOut, stdErr, didErr, stack, loopFlgs, funcMap) = case lookupVar name (stdOut, stdErr, didErr, stack, loopFlgs, funcMap) of
    Just val ->
        case val of
            RealVal r -> (r, (stdOut, stdErr, didErr, stack, loopFlgs, funcMap))
            _ -> (0.0, (stdOut, "Invalid type for variable " ++ name ++ " expected real", True, stack, loopFlgs, funcMap))
    Nothing -> (0.0, (stdOut, "variable " ++ name ++ " could not be found", True, stack, loopFlgs, funcMap))

intExp _ (stdOut, stdErr, _didErr, s, loopFlgs, funcMap) = (0, (stdOut, stdErr ++ "intExp un implemented", True, s, loopFlgs, funcMap))

boolOp2 :: String -> Bool -> Bool -> Bool
boolOp2 "and" b1 b2 = b1 && b2
boolOp2 "or" b1 b2 = b1 || b2
boolOp2 "xor" b1 b2 = b1 /= b2
boolOp2 op _ _ = error $ "Unhandled boolOp2" ++ op


boolComp :: String -> Float -> Float -> Bool
boolComp "<" r1 r2 = r1 < r2
boolComp ">" r1 r2 = r1 > r2
boolComp "<=" r1 r2 = r1 <= r2
boolComp ">=" r1 r2 = r1 >= r2
boolComp "<>" r1 r2 =  r1 /= r2
boolComp "=" r1 r2 = r1 == r2
boolComp op _ _ = error $ "Unhandled boolComp op " ++ op

boolExp :: BoolExp -> PrgmData -> (Bool, PrgmData)
boolExp (OpB op e1 e2) p = (boolOp2 op (fst $ boolExp e1 p) (fst $ boolExp e2 p), p)
boolExp (Not e1) p = (not $ fst $ boolExp e1 p, p)
boolExp (Comp op e1 e2) p = (boolComp op (fst $ intExp e1 p) (fst $ intExp e2 p), p)
boolExp (Boolean b) p = (b, p)
boolExp True_C p = (True, p)
boolExp False_C p = (False, p)
boolExp (VarB name) (stdOut, stdErr, didErr, stack, loopFlg,funcMap) = case lookupVar name (stdOut, stdErr, didErr, stack, loopFlg,funcMap) of
    Just val ->
        case val of
            BoolVal b -> (b, (stdOut, stdErr, didErr, stack, loopFlg,funcMap))
            _ -> (False, (stdOut, "Invalid type for variable " ++ name ++ " expected bool", True, stack, loopFlg,funcMap))
    Nothing -> (False, (stdOut, "Variable " ++ name ++ " coult not be found", True, stack, loopFlg,funcMap))

pushScope :: PrgmData -> PrgmData
pushScope (stdOut, stdErr, didErr, hd:tl, loopFlg,funcMap) = (stdOut, stdErr, didErr, [hd, hd] ++ tl, loopFlg,funcMap)
pushScope (stdOut, stdErr, didErr, stack, loopFlg,funcMap) = (stdOut, stdErr, didErr, stack ++ stack, loopFlg,funcMap)

popScope :: PrgmData -> PrgmData
popScope (stdOut, stdErr, didErr, _hd:tl, loopFlg,funcMap) = (stdOut, stdErr, didErr, tl, loopFlg,funcMap)
popScope (stdOut, stdErr, didErr, [], loopFlg,funcMap) = (stdOut, stdErr, didErr, [], loopFlg,funcMap)


putVar :: String -> Variable -> PrgmData -> PrgmData
putVar name var (stdOut, stdErr, didErr, (vars, globals):tl, loopFlg,funcMap) =
    (stdOut, stdErr, didErr, (Map.insert name var vars, globals):tl, loopFlg,funcMap)
putVar _ _ (stdOut, stdErr, _, [], loopFlg,funcMap) =
    (stdOut, stdErr ++ "PutVar with empty scope", True, [], loopFlg,funcMap)

formatFloat :: Float -> String
formatFloat = printf "%0.10E"

formatBool :: Bool -> String
formatBool True = "TRUE"
formatBool False = "FALSE"

whileExp :: BoolExp -> PrgmData -> Statement -> PrgmData
whileExp _ (stdOut, stdErr, didErr, s, (_cont, True),funcMap) _ =
    (stdOut, stdErr, didErr, s, (False, False),funcMap)
whileExp bExp (stdOut, stdErr, didErr, s, (_cont, _brk), funcMap) stmt =
    let (expVal, (nStdOut, nStdErr, nDidErr, nS, (nCont, bBrk), nFuncMap)) = boolExp bExp (stdOut, stdErr, didErr, s, (False, False), funcMap)
    in
        if not nDidErr && expVal
            then whileExp bExp (interpret [stmt] (nStdOut, nStdErr, nDidErr, nS, (nCont, bBrk), nFuncMap)) stmt
            else (stdOut, stdErr, didErr, s, (nCont, bBrk), nFuncMap)

forExp :: String -> Int -> Statement -> PrgmData -> PrgmData
forExp _ _ _ (stdOut, stdErr, didErr, s, (_, True),funcMap) =
    (stdOut, stdErr, didErr, s, (False, False),funcMap)
forExp indexVar end stmt (stdOut, stdErr, didErr, s, (cont, brk),funcMap) =
    let current = lookupVar indexVar (stdOut, stdErr, didErr, s, (cont, brk),funcMap)
    in
        case current of
            Just (RealVal rVal) ->
                if rVal < (fromIntegral end :: Float)
                    then forExp indexVar end stmt (interpret [stmt] $ putVar indexVar (RealVal $ rVal+1) (stdOut, stdErr, didErr, s, (False, False),funcMap))
                    else (stdOut, stdErr, didErr, s, (False, False),funcMap)
            _ -> (stdOut, stdErr ++ "", True, s, (False, False),funcMap)


handleDefinition :: Definition -> PrgmData -> PrgmData
handleDefinition d p = 
    let (out, err, didErr, s, loopFlgs,funcMap) = p
    in case d of
        VarDef (varName:vars) varType ->
            let newP = handleDefinition (SingleVar varName varType) p
            in handleDefinition (VarDef vars varType) newP
        VarDef [] _ -> p
        SingleVar name varType ->
            case varType of
                REAL -> putVar name UninitReal p
                BOOL -> putVar name UninitBool p
                STRING -> putVar name UninitStr p
        RealVars name varType exp ->
            case varType of
                REAL -> 
                    let (flt, (out, err, didErr, s, loopFlgs,funcMap)) = intExp exp p
                    in putVar name (RealVal flt) (out, err, didErr, s, loopFlgs,funcMap)
                _ -> (out, err ++ "\n" ++ "Error wrong type for real var declaration.", True, s, loopFlgs,funcMap)
        BoolVars name varType exp ->
            case varType of
                BOOL ->
                    let (boo, (out, err, didErr, s, loopFlgs,funcMap)) = boolExp exp p
                    in putVar name (BoolVal boo) (out, err, didErr, s, loopFlgs,funcMap)
                _ -> (out, err ++ "\n" ++ "Error wrong type for boolean var declaration.", True, s, loopFlgs,funcMap)
        FunctionCall name paramList returnType (defs, stmts) ->
            case Map.lookup name funcMap of
                Just _ -> (out, err ++ "\n" ++ "Error function " ++ name ++ " already defined", True, s, loopFlgs, funcMap)
                Nothing -> (out, err, didErr, s, loopFlgs, (
                        Map.insert name (paramList, returnType, defs, stmts) funcMap
                    ))

paramCount :: [([String], VType)] -> Int
paramCount ((names, _):tl) = (length names) + paramCount tl
paramCount [] = 0

callFunction :: String -> [String] -> FunctionData -> PrgmData -> PrgmData
callFunction name params (paramMap, returnType, defs, stmts) p =
    let (out, err, didErr, s, loop, fMap) = p
    in if (length params /= paramCount paramMap) then
        (out, err ++ "\n" ++ "Incorrect number of parameters for function " ++ name, True, s, loop, fMap)
    else
        let newP = setupFunctionStack name returnType params paramMap p
        in fullInterpret (defs, stmts) newP

setupFunctionStack :: String -> VType -> [String] -> [([String], VType)] -> PrgmData -> PrgmData
setupFunctionStack name returnType params paramMap p =
    let ((varNames, varMap), (out, err, didErr, prevS:tl, l, f)) = declareFuncVars paramMap (([], Map.fromList []) ,p)
    in let newP = putFuncParams params varNames prevS (out, err, didErr, ((varMap, Map.fromList []):prevS:tl), l, f)
    in putVar name (snd $ convertFuncType returnType "") newP


declareFuncVars :: [([String], VType)] -> (([String], Map.Map String Variable), PrgmData) -> (([String], Map.Map String Variable), PrgmData)
declareFuncVars ((names, typ):tl) ((v, vMap), p) =
    declareFuncVars tl ((v ++ names, Map.union vMap (Map.fromList (map (convertFuncType typ) names))), p)
declareFuncVars [] ret = ret

convertFuncType :: VType -> String -> (String, Variable)
convertFuncType v n = case v of
    REAL -> (n, UninitReal)
    BOOL -> (n, UninitBool)
    STRING -> (n, UninitStr)

putFuncParams :: [String] -> [String] -> ((Map.Map String Variable), (Map.Map String Variable)) -> PrgmData -> PrgmData
putFuncParams (outerName:onTl) (funcName:fnTl) (vars, globals) p =
    let (out, err, didErr, hd:s, loopFlg, funcMap) = p
    in case lookupVar outerName (out, err, didErr, [(vars, globals)], loopFlg, funcMap) of
        Just v -> putFuncParams onTl fnTl (vars, globals) $ putVar funcName v (out, err, didErr, hd:s, loopFlg, funcMap)
        Nothing -> (out, err ++ "\n" ++ "Error param does not exist", True, hd:s, loopFlg, funcMap)
putFuncParams [] _ _ p = p
putFuncParams _ [] _ p = p


fullInterpret :: FullProgram -> PrgmData -> PrgmData
fullInterpret ((def:tl), stmts) p = fullInterpret (tl, stmts) $ handleDefinition def p
fullInterpret ([], stmts) p = interpret stmts p

interpret :: Program -> PrgmData -> PrgmData
interpret _ (stdout, stdErr, True, scope, loopFlg,funcMap) = (stdout, stdErr, True, scope, loopFlg,funcMap)
interpret (_stmt:tl) (stdout, stdErr, didErr, scope, (True, loopBreak),funcMap) =
    interpret tl (stdout, stdErr, didErr, scope, (True, loopBreak),funcMap)
interpret (_stmt:tl) (stdout, stdErr, didErr, scope, (loopCont, True),funcMap) =
    interpret tl (stdout, stdErr, didErr, scope, (loopCont, True),funcMap)
interpret [] p = p
interpret (stmt:tl) p = case stmt of
    AssignVarR name rExp ->
        let (flt, (out, err, didErr, s, loopFlgs,funcMap)) = intExp rExp p
        in if didErr
            then (out, err, didErr, s, loopFlgs,funcMap)
            else interpret tl $ putVar name (RealVal flt) (out, err, didErr, s, loopFlgs,funcMap)
    AssignVarB name bExp ->
        let (boo, (out, err, didErr, s, loopFlgs,funcMap)) = boolExp bExp p
        in if didErr
            then (out, err, didErr, s, loopFlgs,funcMap)
            else interpret tl $ putVar name (BoolVal boo) (out, err, didErr, s, loopFlgs,funcMap)
    VarIO "writeln" name ->
        let (out, err, didErr, s, loopFlgs,funcMap) = p
        in
        case lookupVar name p of
            Just val ->
                case val of
                    RealVal flt ->
                        interpret tl (out ++ formatFloat flt ++ "\n", err, didErr, s, loopFlgs,funcMap)
                    BoolVal boo ->
                        interpret tl (out ++ formatBool boo ++ "\n", err, didErr, s, loopFlgs,funcMap)
                    StrVal str ->
                        interpret tl (out ++ str ++ "\n", err, didErr, s, loopFlgs,funcMap)
                    _ ->
                        interpret tl (out ++ "\n" ++ name, err, didErr, s, loopFlgs,funcMap)
            Nothing ->
                (out, err ++ "\n" ++ "Error could not find variable " ++ name, True, s, loopFlgs,funcMap)
    VarIO _ _ ->
        let (out, err, _didErr, s, loopFlgs,funcMap) = p
        in (out, err ++ "\n" ++ "Unknown VarIO", True, s, loopFlgs,funcMap)
    FloatIO "writeln" rExp ->
        let (flt, (out, err, didErr, s, loopFlgs,funcMap)) = intExp rExp p
        in if didErr
            then (out, err, didErr, s, loopFlgs,funcMap)
            else interpret tl (out ++ formatFloat flt ++ "\n", err, didErr, s, loopFlgs,funcMap)
    FloatIO _ _ ->
        let (out, err, _didErr, s, loopFlgs,funcMap) = p
        in (out, err ++ "\n" ++ "Unknown FloatIO", True, s, loopFlgs,funcMap)
    BoolIO "writeln" bExp ->
        let (boo, (out, err, didErr, s, loopFlgs,funcMap)) = boolExp bExp p
        in if didErr
            then (out, err, didErr, s, loopFlgs,funcMap)
            else interpret tl (out ++ formatBool boo ++ "\n", err, didErr, s, loopFlgs,funcMap)
    BoolIO _ _ ->
        let (out, err, _didErr, s, loopFlgs,funcMap) = p
        in (out, err ++ "\n" ++ "Unknown BoolIO", True, s, loopFlgs,funcMap)
    WHILE bExp stmts ->
        whileExp bExp p stmts
    Block stmts ->
        interpret (stmts ++ tl) $ pushScope p
    LoopStop "continue" ->
        let (out, err, didErr, s, (_doCont, doBrk),funcMap) = p
        in interpret tl (out, err, didErr, s, (True, doBrk),funcMap)
    LoopStop "break" ->
        let (out, err, didErr, s, (doCont, _doBrk),funcMap) = p
        in interpret tl (out, err, didErr, s, (doCont, True), funcMap)
    LoopStop _ ->
        let (out, err, _didErr, s, loopFlgs,funcMap) = p
        in (out, err ++ "\n" ++ "Unknown LoopStop", True, s, loopFlgs,funcMap)
    FOR name start stop stmts ->
        let (out, err, didErr, s, (doCont, doBrk),funcMap) = pushScope p
        in
            let newP = popScope $ forExp name stop stmts $ putVar name (RealVal (fromIntegral (start-1) :: Float)) (out, err, didErr, s, (doCont, doBrk),funcMap)
            in interpret tl newP
    IF b1 stmt1 stmt2 -> if fst $ boolExp b1 p then interpret (stmt1 : tl) p else interpret (stmt2 : tl) p
    EvalSingleB bExp ->
        let (_, newP) = boolExp bExp p
        in newP
    EvalSingleR rExp ->
        let (_, newP) = intExp rExp p
        in newP
    ReadIO _ _name ->
        let (out, err, _didErr, s, loopFlgs,funcMap) = p
        in (out, err ++ "\n" ++ "Readln not supported", True, s, loopFlgs,funcMap)
    CASE {} ->
        let (out, err, _didErr, s, loopFlgs,funcMap) = p
        in (out, err ++ "\n" ++ "Case not supported", True, s, loopFlgs,funcMap)
    FuncCall name params ->
        let (out, err, _didErr, s, loopFlgs,funcMap) = p
        in case Map.lookup name funcMap of
            Just funcData -> interpret tl $ callFunction name params funcData p
            Nothing -> (out, err ++ "\n" ++ "Function " ++ name ++ " cannot be found.", True, s, loopFlgs, funcMap)
    AssignFuncCall varName name params ->
        let (out, err, _didErr, s, loopFlgs,funcMap) = p
        in case Map.lookup name funcMap of
            Just funcData -> 
                let funP = callFunction name params funcData p
                in case lookupVar name funP of
                    Just v ->
                        let newerP = putVar varName v $ popScope funP
                        in interpret tl newerP
                    Nothing -> (out, err ++ "\n" ++ "Function " ++ name ++ " return value cannot be found.", True, s, loopFlgs, funcMap)
            Nothing -> (out, err ++ "\n" ++ "Function " ++ name ++ " cannot be found.", True, s, loopFlgs, funcMap)
