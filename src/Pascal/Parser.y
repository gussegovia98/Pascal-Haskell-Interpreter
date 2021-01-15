{
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Lexer
}


%name happyParser
%tokentype { Token }

%monad { Parser } { thenP } { returnP }
%lexer { lexer } { Token _ TokenEOF }

%token 
        int             { Token _ (TokenInt $$) }
        real            { Token _ (TokenReal $$) }
        bool            { Token _ (TokenBool $$)}
        string          { Token _ (TokenString $$) }
        ID              { Token _ (TokenID $$)  }
        '+'             { Token _ (TokenOp "+")   }
        '-'             { Token _ (TokenOp "-")   }
        '*'             { Token _ (TokenOp "*")   }
        '/'             { Token _ (TokenOp "/")   }
        '='             { Token _ (TokenOp "=")   }
        ':='            { Token _ (TokenOp ":=")   }
        '<>'             { Token _ (TokenOp "<>")   }
        '>'             { Token _ (TokenOp ">")   }
        '<'             { Token _ (TokenOp "<")   }
        '>='             { Token _ (TokenOp ">=")   }
        '<='             { Token _ (TokenOp "<=")   }
        '('             { Token _ (TokenK  "(")   }
        ')'             { Token _ (TokenK  ")")   }
        'begin'         { Token _ (TokenK "begin") }
        'end.'           { Token _ (TokenK "end.")  }
        'boolean'         { Token _ (TokenK "boolean") }
        'real'           { Token _ (TokenK "real") }
        'string'           { Token _ (TokenK "string") }
        'var'           { Token _ (TokenK "var") }
        'end'           { Token _ (TokenK "end")  }
        'and'           { Token _ (TokenK "and") }
        'or'           { Token _ (TokenK "or") }
        'not'           { Token _ (TokenK "not") }
	    ','            { Token _ (TokenK ",")   }
        ':'          { Token _ (TokenOp ":") }
        'program'           { Token _ (TokenK "program") }
        'sin'         { Token _ (TokenK "sin") }
        'cos'           { Token _ (TokenK "cos") }
        'sqrt'           { Token _ (TokenK "sqrt") }
        'exp'           { Token _ (TokenK "exp") }
        'ln'           { Token _ (TokenK "ln") }
        'writeln'           { Token _ (TokenK "writeln") }
        'break'          { Token _ (TokenK "break") }
        'continue'         { Token _ (TokenK "continue") }
        'if'           { Token _ (TokenK "if") }
        'then'           { Token _ (TokenK "then") }
        'else'           { Token _ (TokenK "else") }
        'while'           { Token _ (TokenK "while") }
        'for'           { Token _ (TokenK "for") }
        'case'           { Token _ (TokenK "case") }
        'function'           { Token _ (TokenK "function") }
        'procedure'           { Token _ (TokenK "procedure") }
        'of'           { Token _ (TokenK "of") }
        'to'           { Token _ (TokenK "to") }
        'do'           { Token _ (TokenK "do") }
        ';'           { Token _ (TokenK ";") }
        'true'          { Token _ (TokenK "true") }
        'false'        { Token _ (TokenK "false") }
        'readln'        { Token _ (TokenK "false") }

-- associativity of operators in reverse precedence order
%nonassoc '>' '>=' '<' '<=' '==' '<>'
%left '+' '-'
%left '*' '/'
%nonassoc ':='
%%

-- Entry point
Program :: {FullProgram}
    : 'program' ID ';' Defs 'begin' Statements 'end.' { ($4, $6) }

-- Variable definitions
Defs :: {[Definition]} 
    : { [] } -- nothing; make empty list 
    | Definition Defs {$1:$2 } -- put statement as Definition

Definition :: {Definition}
    : 'var' ID_list ':' Type ';'  {VarDef $2 $4 }
    | 'var' ID ':' Type '=' Exp ';' {RealVars $2 $4 $6}
    | 'var' ID ':' Type '=' BoolExp ';' {BoolVars $2 $4 $6}
    | 'function' ID '(' Functions ')' ':' Type ';' Defs 'begin' Statements 'end'';' {FunctionCall $2 $4 $7 ($9, $11)}
    | 'procedure' ID '(' Functions ')' ';' Defs 'begin' Statements 'end'';' {ProcedureCall $2 $4 ($7, $9)}


Type :: {VType}
    : 'boolean' { BOOL }
    | 'real' { REAL }
    | 'string' { STRING }

Functions ::  {[([String], VType)]}
    : {[]}
    | List ';' Functions {$1:$3}

List :: {([String], VType)}
    : ID_list ':' Type  {($1, $3)}

VarList :: {[(String, VType)]}
    : {[]}
    | VarIndividual ';' VarList {$1:$3}

VarIndividual :: {(String, VType)}
    : 'var' ID ':' Type  {($2, $4)} 


ID_list :: {[String]}
    : ID  {[$1]}
    | ID ',' ID_list { $1:$3 }

CompExp :: {BoolExp}
    : FloatExp '=' FloatExp { Comp "=" $1 $3}
    | FloatExp '<>' FloatExp { Comp "<>" $1 $3}
    | FloatExp '<' FloatExp { Comp "<" $1 $3}
    | FloatExp '>' FloatExp { Comp ">" $1 $3}
    | FloatExp '<=' FloatExp { Comp "<=" $1 $3}
    | FloatExp '>=' FloatExp { Comp ">=" $1 $3}

FloatExp :: {Exp}
    : Exp { $1 }
    | MathExp { $1 }
    | FloatExp '+' FloatExp { Op2 "+" $1 $3 }
    | FloatExp '*' FloatExp { Op2 "*" $1 $3 }
    | FloatExp '/' FloatExp { Op2 "/" $1 $3 }
    | FloatExp '-' FloatExp { Op2 "-" $1 $3 }
    | '(' FloatExp ')' { $2 }

MathExp :: {Exp}
    : 'sin' '(' FloatExp ')'  { Op3 "sin" $3 }
    | 'cos' '(' FloatExp ')'  { Op3 "cos" $3 }
    | 'sqrt' '(' FloatExp ')' { Op3 "sqrt" $3 }
    | 'exp' '(' FloatExp ')'  { Op3 "exp" $3 }
    | 'ln' '(' FloatExp ')'   { Op3 "ln" $3 }

Exp :: {Exp}
    : Exp '+' Exp { Op2 "+" $1 $3 }
    | Exp '*' Exp { Op2 "*" $1 $3 }
    | Exp '/' Exp { Op2 "/" $1 $3 }
    | Exp '-' Exp { Op2 "-" $1 $3 }
    | '(' Exp ')' { $2 } -- ignore brackets
    | '+' Exp { $2 } -- ignore Plus
    | '-' Exp { Op1 "-" $2}
    | ID {Var $1}
    | real {Real $1}
    | int {IntR $1}

BoolExp :: {BoolExp}
    : 'true' { True_C }
    | 'false' { False_C }
    | '(' BoolExp ')' { $2 } 
    | 'not' BoolExp { Not $2 }
    | CompExp { $1 }
    | BoolExp 'and' BoolExp { OpB "and" $1 $3 }
    | BoolExp 'or' BoolExp { OpB "or" $1 $3 }
    
    | bool { Boolean $1 }
    | ID {VarB $1}

-- Statements
MultipleLines :: {[String]}
    : OneLine {[$1]}
    | OneLine ',' MultipleLines {$1:$3}

OneLine :: {String}
    : ID {$1}
    | string {$1}

Statements :: {[Statement]}
    : { [] } -- nothing; make empty list
    | Statement Statements { $1:$2 } -- put statement as first element of statements

Statement :: {Statement}
    : BoolExp ';' {EvalSingleB $1}
    | FloatExp ';' {EvalSingleR $1}
    | ID ':=' FloatExp ';' { AssignVarR $1 $3 }
    | ID ':=' BoolExp ';' { AssignVarB $1 $3 }
    | 'writeln' '(' ID ')' ';' {VarIO "writeln" $3}
    | 'writeln' '(' FloatExp ')' ';' {FloatIO "writeln" $3}
    | 'writeln' '(' BoolExp ')' ';' {BoolIO "writeln" $3}
    | 'readln' '(' ID ')' ';' {ReadIO "writeln" $3}
    | ID '(' MultipleLines ')' ';' { FuncCall $1 $3 }
    | ID ':=' ID '(' MultipleLines ')' ';' { AssignFuncCall $1 $3 $5}
    | 'continue' ';' { LoopStop "continue"}
    | 'break' ';' { LoopStop "break"}
    | 'begin' Statements 'end' ';'{Block $2}
    | 'if' '(' BoolExp ')' 'then' Statement 'else' Statement  { IF $3 $6 $8}
    | 'while' '(' BoolExp ')' 'do' Statement  {WHILE $3 $6}
    | 'for' ID ':=' int 'to' int 'do' Statement  {FOR $2 $4 $6 $8}
    | 'case' '(' BoolExp ')' 'of' bool ':' Statement  bool ':' Statement  'end' ';' { CASE $3 $6 $8 $9 $11} 
    
    

{}