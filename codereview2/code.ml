(* Problem 1: The function below is a higher-order function.
   What is its type? Its type is (float -> string) -> (float -> string) -> float -> string -> string *)
Open List ;;
let not_actually_composition (f: float -> string)
                             (g: float -> string)
                             (a: float)
                             (b: string)
                              : string =
  (f (a +. 3.5)) ^ (g (a +. 2.5)) ^ (b ^ "Hello") ;;

(* Problem 2: Implement a `sum` function that sums all elements in a list. *)
(* Use fold right because you take list, condense into one value.
   Recurse all the way to right, perform operation back *)
let sum list =
  fold_right (+) lst 0 ;;

(* Problem 3: Implement a `tuple_generator` function that changes an
   `int list` into an `int * int list` of the original number and its negative. *)
(* Use map when you want to modify every element of the list and return a list back*)
let tuple_generator lst =
  map (fun x -> (x, -x)) lst ;;
  
(* what if you partially apply map? You can just not have to input list...*)
(* anytime you see last arg of function is also applied to the end of whatever function you're doing, just erase it.. partial application*)

(* Problem 4: Implement the `gcd_finder` function that when given two
   integers and a list returns a list of all integers that are equal to the
   greatest common divisor of the two integers. *)
let rec gcd_euclid a b =
  if b = 0
  then a
  else gcd_euclid b (a mod b) ;;

(* Problem 5: How can you take advantage of partial application in
   Problems 3 and 4? *)
   

(* Problem 6: Implement `curry` and `uncurry` from lab. What are their
   types? *)
(* curry : takes function with tuple and returns function that takes multiple args
   uncurry: takes function taking multiple args and returns function with tuple *)
(* use curry when one of your function takes 2 args but the one u want to use takes tuple *)
(* you have the arguments that you want but need them in the correct format. If you pass in all the arguments into curry/uncurry, it just
 gives you the correct output. But if you partially apply it, it gives you a function that takes in the args you need.*)
let curry f (a, b) =
  f a b ;;
let uncurry f' a b =
  f' (a, b) ;;

(* Problem 7: What is the type of the following function? 'a -> 'a -> string, because > works for more than just ints*)
let patriots_suck_question_mark a b =
  if a > b then "Yes" else "YES" ;;

(* Problem 8: What is the type of the following function? ('a -> 'b) -> (string -> 'a) -> string -> string -> 'b *)
let actually_composition f g a b =
  f (g (a ^ b)) ;;

(* Problem 9: What is the type of `List.map`? *)
(* ('a -> 'b) -> 'a list -> 'b list *)

(* Problem 10: Implement `max_option` from lab. *)
(* Options allow you to account for if a value can be an "error" or just not definable. They are compound types. *)
let max_option (x : int option) (y : int option) : int option =
  match x, y with
  | None, None-> None
  | None, Some v | Some v, None -> Some v
  | Some v, Some v' -> Some max v v' ;; (*??*)

(* Problem 11: Define an ADT for `patriot` denoting the different types a New
   England Patriot can assume. Players should have numbers and names, coaches
   should have names, and their quarterbacks should be separate and have no
   information associated (because, honestly, Nick Foles got you good). *)
   (* If none of the normal types satisfy what you want to model, create your own type! *)

(* Problem 12: Implement a function that, given a `patriot`, prints
   information about the Patriot. *)
