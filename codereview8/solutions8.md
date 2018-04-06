#### Problem 1
```ocaml
class type person = 
    object
        method getName : unit -> string
        method getInfo : unit -> float
    end ;;
```

#### Problem 2
```ocaml
class student (n : string) (g : float) : person = 
    object(this)
        val mutable name = n
        val mutable gpa = g

        method getName () : string = name
        method getInfo () : float = gpa
    end ;;
```

#### Problem 3
```ocaml
let getAverage (lst : student list) : float =
    (List.fold_left (fun a x -> a +. x#getInfo ()) 0. lst) /. (float (List.length lst)) ;;
```

#### Problem 4
```ocaml
class type bro = 
    object
        inherit person

        method getSnakiness : unit -> int
    end ;;

class stemBro (n : string) (g : float) (snakeLevel : int) =
    object(this)
        inherit student n g as super

        val mutable snake = snakeLevel

        method getSnakiness () : int = snake
    end ;;
```

#### Problem 5
```ocaml
class stemBro (n : string) (g : float) (snakeLevel : int) : bro =
    object(this)
        inherit student n g as super

        val mutable snake = snakeLevel

        method getSnakiness () : int = snake

        method! getInfo () : float = super#getInfo () -. 0.5
    end ;;
```

#### Problem 6
```ocaml
let bros : stemBro list = [new stemBro "Bob" 2.0 100; new stemBro "Jill" 4.0 2; new stemBro "Jim" 3.5 50] ;;
```

#### Problem 7
```ocaml
(* This expression has type stemBro list but an expression was expected of type student list *)

let coolBros = List.map (fun x -> (x :> student)) bros ;;
```
