type statement =
    | Declare of (string)
    | Assign of (string * expr)
and expr =
    | Ident of string
    | Int of int
    | Add of (expr * expr)
    | Call of (string * expr list)
    | F of (string list * statement list)

let rec string_of_statement = function
    | Declare x -> "(Declare " ^x^")"
    | Assign (x,y) -> "(Assign "^x^", " ^ (string_of_expr y) ^")"
and string_of_expr = function
    | Ident i -> "(Ident "^i^")"
    | Int i -> "(Int "^(string_of_int i)^")"
    | Add (l,r) -> "(Add ("^(string_of_expr l)^" "^(string_of_expr r)^")"
    | Call (f, es) -> "(Call "^ f ^ " (" ^ (String.concat "," (List.map string_of_expr es)) ^ "))"
    | F (ps, body) -> "(FUNCTION)"
