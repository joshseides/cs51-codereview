(* Define a `student` type of which is either a name, GPA, or enrolled boolean
   which can be used for identification (but not really). *)

(* Create a few students of type `student`. *)

(* Implement a function that extracts the GPA float to a `student` value if
   possible. *)

(* How can this implementation be improved in terms of design? *)

let valid_rgb color =
  let bad_color c = c < 0 || c > 255 in
  match color with
  | Simple color -> Simple color
  | RGB (r, g, b) ->
      if bad_color r then raise (Invalid_Color "red out of range")
      else if bad_color g then raise (Invalid_Color "green int out of range")
      else if bad_color b then raise (Invalid_Color "blue int out of range")
      else color ;;

(* How can this implementation be improved in terms of design? *)

let valid_date (d : date) : date =
  if d.year <= 0 then raise (Invalid_Date "only positive years")
  else if d.month = 1 || d.month = 3 || d.month = 5 || d.month = 7 ||
          d.month = 8 || d.month = 10 || d.month = 12 then
    (if d.day > 31 then raise (Invalid_Date "too many days")
    else if d.day < 1 then raise (Invalid_Date "days must be > 1")
    else d)
  else if d.month = 4 || d.month = 6 || d.month = 9 || d.month = 11 then
    (if d.day > 30 then raise (Invalid_Date "too many days")
    else if d.day < 1 then raise (Invalid_Date "days must be > 1") else d)
  else if d.month = 2 then
    (if d.year mod 4 = 0 && d.year mod 100 <> 0 || d.year mod 400 = 0 then
      if d.day > 29 then raise (Invalid_Date "too many days")
      else if d.day < 1 then raise (Invalid_Date "days must be > 1")
      else d
    else if d.day > 28 then raise (Invalid_Date "too many days")
    else if d.day < 1 then raise (Invalid_Date "days must be > 1") else d)
    else raise (Invalid_Date "bad month") ;;

(* Recall from lab the `family` type. Implement `marry` and `add_to_family`
   from lab. *)

type color_label =
  | Red
  | Crimson
  | Orange
  | Yellow
  | Green
  | Blue
  | Indigo
  | Violet ;;

type color =
  | Simple of color_label
  | RGB of int * int * int ;;

type date = { year : int; month : int; day : int; } ;;

type person = { name : string; favorite : color; birthdate : date; } ;;

type family =
  | Child of person
  | Family of person * person * family list ;;

(* Implement `count_people` from lab. *)

(* How would we define an `'a` binary tree as an ADT? *)

(* How would we count the size of our `'a` binary tree? The height? *)

let t = Br(2, Br (1, Lf, Lf), Br(3, Lf, Lf)) ;;

(* size t ;; *)

(* height t ;; *)

(* What are the differences and pros/cons of using each alternative for
   error handling? *)

(* What are the types of the following? *)

Some 42 ;;
[None] ;;
Failure "rip" ;;
raise (Failure "rip") ;;
raise ;;
fun _ -> raise Exit ;;
