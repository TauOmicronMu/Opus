{
open Lexing
open Grammar
}
let int = ['0'-'9'] ['0'-'9']*
let ident = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read =
    parse
    | white       { read lexbuf }
    | newline     { read lexbuf }
    | '+'         { ADD }
    | '('         { OPEN_PAREN }
    | ')'         { CLOSE_PAREN }
    | '{'         { OPEN_BRACE }
    | '}'         { CLOSE_BRACE }
    | ','         { COMMA }
    | '~'         { TILDE }
    | int         { INT (int_of_string (Lexing.lexeme lexbuf)) }
    | ident       { IDENT (Lexing.lexeme lexbuf) }
    | eof         { EOF }
