#### Problem 1

```ocaml
val x : int * 'a option = (5, None)

val f : 'a -> 'b -> ('b -> 'a -> 'c) -> 'c = <fun>

val g : 'a list -> 'b -> 'c -> 'd -> 'c option = <fun>
```

#### Problem 2

`f1`: No `rec`
`f2`: Option and string type as output.
`f3`: `f3` in match case refers to inner `f3` function
`f4`: Tuples must have same type in each part.

```ocaml
val f1 : int -> float -> 'a = <fun>

val f2 : 'a list -> 'a list option = <fun>

val f3 : int option -> int = <fun>

val f4 : ('a * 'a) list -> ('a * 'a) list -> ('a * 'a) list = <fun>
```

#### Problem 4

```ocaml
let map_drop l f e =
    List.fold_right (fun x a -> if x <> e then f x :: a else a) l [] ;;
```

#### Problem 5

```ocaml
(type 'a llist =
| Empty
| Cons of 'a * 'a llist) ;;
```

#### Problem 6

```ocaml
let empty () = Empty ;;
```

#### Problem 7
```ocaml
let rec convert l =
    match l with
    | [] -> Empty
    | h :: t -> Cons (h, convert t) ;;
```

#### Problem 8
```ocaml
let rec map_llist f ll =
    match ll with
    | Empty -> Empty
    | Cons (h, t) -> Cons (f h, map_llist f t) ;;

let rec filter_llist f ll =
    match ll with
    | Empty -> Empty
    | Cons (h, t) ->
        if f h then Cons (h, filter_llist f t)
        else filter_llist f t ;;

let rec fold_llist f acc ll =
    match ll with
    | Empty -> acc
    | Cons (h, t) ->
        fold_llist f (f acc h) t ;;
```

#### Problem 9

```ocaml
module StudentDictArg : (DictArg with type key = string and type v = student) 
    struct
        type key = string
        type v = student
    end ;;
```

#### Problem 11

```ocaml
module StudentDir = MakeDict(StudentDictArg) ;;

module DictArg = 
    struct
        type key = int
        type v = string
    end ;;
```

#### Problem 12

```ocaml
module MakeDict (DA : DictArg) : (Dict) =
    struct
        type key = DA.key
        type v = DA.v
        type dict = (key * v) list
        let empty = []
        let add k v d = (k, v) :: d
        let fold f init d = List.fold_left (fun acc (k, v) -> f k v acc) init d
    end ;;
```
