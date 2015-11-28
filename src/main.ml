exception Error of string
let a = Grammar.top Lexer.read (Lexing.from_string "a 1")

let _ = print_endline (String.concat "\n" (List.map Ast.string_of_statement a))
