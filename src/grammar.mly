%token <int> INT
%token <string> STRING
%token <string> IDENT

%token TILDE
%token EOF
%token ADD
%token OPEN_BRACE
%token CLOSE_BRACE
%token OPEN_PAREN
%token CLOSE_PAREN
%token COMMA

%start <Ast.statement list> top
%%
top:
    | el = list(statement); EOF { el }
    ;

statement:
    | i = IDENT; TILDE { Declare i }
    | i = IDENT; e = expr { Assign (i, e) }
    ;

expr:
    | e = expr; ADD; f = expr { Add (e, f) }
    | ps = list(IDENT); OPEN_BRACE; ss = list(statement); CLOSE_BRACE { F (ps, ss) }
    | i = IDENT; OPEN_PAREN; ps = separated_list(COMMA, expr); CLOSE_PAREN { Call (i, ps) }
    | i = IDENT { Ast.Ident i }
    | n = INT { Ast.Int n }
    ;
