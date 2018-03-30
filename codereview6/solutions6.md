#### Problem 3

```ocaml
let updateRef (r : 'a ref) (x : 'a) =
    r := x ;;
```

#### Problem 4

```ocaml
val updateRef : 'a ref -> 'a -> unit = <fun>
```

#### Problem 5

```ocaml
val f : 'a ref -> int option ref -> 'a -> bool = <fun>
```

#### Problem 6

```ocaml
let remember =
    let mem = ref "" in
    fun (s : string) -> let v = !mem in
                        mem := s;
                        v ;;
(**))
```

#### Problem 9

```ocaml
let gensym =
    let ctr = ref 0 in
    fun (s : string) ->
        let v = s ^ string_of_int (!ctr) in
        ctr := !ctr + 1;
        v ;;
(**))
```

#### Problem 10

```ocaml
let rec m_convert (lst : 'a list) : 'a mlist =
    match lst with
    | [] -> Nil
    | h :: t -> Cons(h, ref (m_convert t)) ;;
```

#### Problem 11

```ocaml
let rec m_length (m : 'a mlist) : int =
    match m with
    | Nil -> 0
    | Cons(_h, t) -> 1 + length (!t) ;;
```

#### Problem 12

```ocaml
let rec mappend (xs : 'a mlist) (ys : 'a mlist) : unit =
    match xs with
    | Nil -> ()
    | Cons(_h,t) -> match !t with
                    | Nil -> t := ys
                    | Cons(_,_) as m -> mappend m ys ;;
```
