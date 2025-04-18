let%test _ = Fstore.add "add" ["a"; "b"] (Add ((Id "a"), (Id "b"))) []  = ["add", (["a"; "b"], (Add ((Id "a"), (Id "b"))))]
let%test _ = Fstore.find "add" ["add", (["a"; "b"], (Add ((Id "a"), (Id "b"))))]  = (["a"; "b"], (Add ((Id "a"), (Id "b"))))
let%test _ = try
  let _ = Fstore.find "add" [] in
  false
  with
  |Failure msg -> msg = "Undefined function: add"
  |_ -> false
let%test _ = Hw6.interp_expr [("add", (["a"; "b"], (Add ((Id "a"), (Id "b")))))] [] (Call ("add", [Num 2;Num 3])) = NumV 5
let%test _ = Hw6.interp_def (Ast.FunDef ("add", ["a"; "b"], (Add ((Id "a"), (Id "b"))))) [] = [("add", (["a"; "b"], (Add ((Id "a"), (Id "b")))))]
let%test _ = Hw6.interp_prog (Ast.Prog ([], (Ast.Add (Num 3, Num 1)))) = NumV 4
