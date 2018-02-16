#### Problem 1
```ocaml
(float -> string) -> (float -> string) -> float -> string -> string
```

#### Problem 2
```ocaml
let sum l =
    List.fold_right ( + ) l 0 ;;
```

#### Problem 3
```ocaml
let tuple_generator l =
    List.map (fun x -> (x, -x)) l ;;
```

#### Problem 4
```ocaml
let gcd_finder a b l =
    let rec gcd_euclid a b =
        if b = 0
        then a
        else gcd_euclid b (a mod b) in
    List.filter (fun x -> gcd_euclid a b = x) l ;;
```

#### Problem 5
Same functions without the last input in the signature and the body.

#### Problem 6
```ocaml
(* ('a * 'b -> 'c) -> 'a -> 'b -> 'c *)
let curry f x y = f (x, y) ;;

(* ('a -> 'b -> 'c) -> 'a * 'b -> 'c *)
let uncurry f (x, y) = f x y ;;
```

#### Problem 7
```ocaml
'a -> 'a -> string
```

#### Problem 8
```ocaml
('a -> 'b) -> (string -> 'a) -> string -> string -> 'b
```

#### Problem 9
```ocaml
('a -> 'b) -> 'a list -> 'b list
```

#### Problem 10
```ocaml
let max_option (x : int option) (y : int option) : int option =
    match x, y with
    | None, None -> None
    | None, Some right -> Some right
    | Some left, None -> Some left
    | Some left, Some right -> Some (max left right) ;;
```

#### Problem 11
```ocaml
(type patriot =
    | Player of int * string
    | Coach of string
    | Quarterback)
```

#### Problem 12
```ocaml
let print_information (patriot : patriot) : string =
    match patriot with
    | Player (number, name) -> "Player: #" ^ string_of_int number ^ " - " ^ name
    | Coach (name) -> "Coach: " ^ name
    | Quarterback -> "Haha." ;;
```
