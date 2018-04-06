class type person =
  object
    method getName : unit -> string
    method getInfo : unit -> float
  end ;;

class student (n : string) (g : float) : person =
  object(this)
    val mutable n = n
    val mutable g = g

    method getName () : string = n
    method getInfo () : float = g
  end ;;

let getAverage (lst : student list) : float =
  (List.fold_left (fun a e -> a +. e#getInfo ()) 0. lst) /. (float (List.length lst)) ;;

class stemBro (n : string) (g : float) (s : int) =
  object(this)
    inherit student n g as super

    method! getInfo () : float = super#getInfo () -. 0.5

    val mutable snakiness = s

    method getSnakiness () : int = snakiness
  end ;;

class type bro =
  object
    inherit person
    method getSnakiness : unit -> int
  end ;;

let bros = [new stemBro "Josh" 4.0 10; new stemBro "bob" 3.5 4; new stemBro "fd" 2.2 4] ;;

let student_bros = (bros :> student list)
