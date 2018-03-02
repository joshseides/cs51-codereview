#### Problem 3
```ocaml
module TFJosh =
    struct
        type demographic = {
            age : int;
            gender : string;
            hometown : string;
        }
        let name : string = "Josh"
        let favorite = ( > )
        let print_demographic (d : demographic) : string =
            (string_of_int d.age) ^ " / " ^ d.gender ^ " / " ^ d.hometown
    end ;;
```

#### Problem 7
```ocaml
module type TF =
    sig
        type demographic
        val name : string
        val favorite : int -> int -> bool
        val print_demographic : demographic -> string
    end ;;
```

#### Problem 8
```ocaml
let restrictedTF = (TFJosh : TF) ;;
```

#### Problem 9
```ocaml
let invert_stack (s : SafeStack.stack) : SafeStack.stack =
    List.rev s ;;
```

#### Problem 10
```ocaml
module type INT_STACK =
    sig
        type stack
        exception EmptyStack
        val empty : unit -> stack
        val push : int -> stack -> stack
        val top : stack -> int
        val pop : stack -> stack
    end ;;
```

#### Problem 11
```ocaml
type integer = { x : int } ;;

module type Integer =
    sig
        val x : int
    end ;;
```

#### Problem 12
```ocaml
let one : integer = { x = 1 } ;;

module Integer =
    struct
        let x = 1
    end ;;
```

#### Problem 13
```ocaml
let add (a : integer) (b : integer) : integer =
    { x = a.x + b.x } ;;

module Change (A : Integer) (B : Integer) : Integer =
    struct
        let x = A.x + B.x ;;
    end ;;
```

#### Problem 14
```ocaml
let use_twice (f : integer -> integer -> integer) (i : integer) : integer =
    f i i ;;

module Use_Twice (F : Integer -> Integer -> Integer) (I : Integer) : Integer =
    F(I)(I) ;;
```

#### Problem 15
```ocaml
let double = use_twice add ;;

module Double = Use_Twice(Add) ;;
```
