(* Problem 1: The function below is a higher-order function.
   What is its type? *)

let not_actually_composition f g a b =
  (f (a +. 3.5)) ^ (g (a +. 2.5)) ^ (b ^ "Hello") ;;

(* Problem 2: Implement a `sum` function that sums all elements in a list. *)

(* Problem 3: Implement a `tuple_generator` function that changes an
   `int list` into an `int list` of the original number and its negative. *)

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

(* Problem 7: What is the type of the following function? *)
let patriots_suck_question_mark a b =
  if a > b then "Yes" else "YES" ;;

(* Problem 8: What is the type of the following function? *)
let actually_composition f g a b =
  f (g (a ^ b)) ;;

(* Problem 9: What is the type of `List.map`? *)

(* Problem 10: Implement `max_option` from lab. *)

(* Problem 11: Define an ADT for `patriot` denoting the different types a New
   England Patriot can assume. Players should have numbers and names, coaches
   should have names, and there quarterbacks should be separate and have no
   information associated (because, honestly, Nick Foles got you good). *)

(* Problem 12: Implement a function that, given a `patriot`, prints
   information about the Patriot. *)
