#### Problem 1

```ocaml
(type 'a str = Cons of 'a * 'a stream
and 'a stream = unit -> 'a str) ;; 
```

#### Problem 2
```ocaml
let head (s : 'a stream) : 'a =
    match s() with
    | Cons(h, t) -> h ;;

let rec first (n : int) (s : 'a stream) : 'a list =
    if n = 0 then []
    else head s :: first (n - 1) (tail s) ;;
```

#### Problem 3
```ocaml
let rec smap (f : 'a -> 'b) (s : 'a stream) : 'b stream =
    fun () -> Cons(f (head s), smap f (tail s)) ;;
(**))
```

#### Problem 5
```ocaml
let rec nats () =
    Cons(0, smap ((+) 1) nats) ;;
```

#### Problem 6
```ocaml
let rec s_merge (s: 'a stream) (t: 'a stream) : 'a stream =
  let Cons (h, tail) = s() in
    fun () -> Cons (h, s_merge t tail) ;;
(**))
```

#### Problem 7
```ocaml
let rec s_split (s: 'a stream) : 'a stream * 'a stream =
  let t = tail (tail s) in
  ((fun () -> Cons (head s, fst (s_split t))),
         (fun () -> Cons (head (tail s), snd (s_split t)))) ;;
(**))
```

#### Problem 9
```ocaml
let not_div_by n m =
    not (m mod n = 0) ;;

let rec sieve s =
    fun () -> (Cons (head s, sieve (sfilter (not_div_by (head s)) (tail s))))  ;;

let primes = sieve (tail (tail nats)) ;;
(**))
```

#### Problem 11
```ocaml
(type 'a str = Cons of 'a * 'a stream
and 'a stream = 'a str Lazy.t) ;;
```

#### Problem 12
```ocaml
let head (s : 'a stream) : 'a =
    let Cons(h, _t) = Lazy.force s in h ;;

let rec smap (f : 'a -> 'b) (s : 'a stream) : 'b stream =
    lazy (Cons(f (head s), smap f (tail s)));;
```

#### Problem 13
```ocaml
true
false
true
true
true
true
false
true
```

