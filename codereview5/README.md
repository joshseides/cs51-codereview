# Code Review 5 Handout
## Josh Seides

### Midterm Information
* Do the **labs** first, then code review materials, then past midterms.
* Come to midterm office hours. Mine are **10am to 12pm on Saturday in Mather DHall**.
* Design and style matter on the exam.
* Practice writing code out by hand.
* No recurrences on the exam.

### Practice Questions (creds to Daniel, Ezra, and Leo for some problems)

#### Problem 1

*What are the types of the following expressions?*

```ocaml
let x = (5, None) ;;

let f x y z = z y x ;;

let g a b c d =
    match a with
    | b :: c :: d -> None
    | [b] -> Some c
    | _ -> raise (Exit) ;;
```

#### Problem 2

*For each of the following functions, identify the error and then provide a fix such that the function will type check. Give the appropriate type of the function after your fix.*

```ocaml
let f1 x y = f1 3 4. ;;

let f2 lst = 
    match lst with
    | [] -> ""
    | h :: t -> Some t ;;

let rec f3 x =
    let f3 = fun z -> z + 1 in
    match x with
    | None -> f3 x
    | Some y -> f3 y
in f3 (Some 42) ;;

let rec f4 x y =
    (match y with
    | [] -> x
    | (a, b) :: tl -> (b, a) :: y)
in f4 [] [(1, "CS51")] ;;

(* Needed for weird highlighting --> *))
```

#### Problem 3

*For each of the following types, write a function that will satisfy the type.*

```ocaml
string -> float -> float -> int

('a option * bool) -> int list

'a -> 'b -> int -> ('a -> 'b)
```

#### Problem 4

*Implement a function `map_drop` that takes in three inputs: a list, a function, and an element. This function will behave as a standard map with one caveat – if the element is in the list, it will drop that element from the list.*

#### Problem 5

*Define a linked list abstract data type that is either `Empty` or is the `Cons` of an element of type `'a` and another linked list.*

#### Problem 6

*Implement a function to create an empty linked list.*

#### Problem 7

*Implement a function that converts a list into a linked list using basic recursion.*

#### Problem 8

*Implement `map`, `filter`, and `fold` on linked lists.*

#### Problem 9

*The goal here is to create a dictionary data structure. The signature is provided.*

```ocaml
module type Dict =
    sig
        type dict
        type key
        type v
        val empty : dict
        val add : key -> v -> dict -> dict
        val fold : (key -> v -> 'a -> 'a) -> 'a -> dict -> 'a
    end ;;

module type DictArg =
    sig
        type key
        type v
    end ;;
```

*A functor for creating dictionaries is also given.*

```ocaml
module MakeDict (DA : DictArg) : (Dict with type key = DA.key and type v = DA.v) =
    struct
        (* implementation goes here... *)
    end
```

*Define a module `StudentDictArg` with signature `DictArg` that would be suitable to pass to the `MakeDict` functor to create a dictionary that maps student names (as strings) to students.*

#### Problem 10

*Why are sharing constraints necessary in the previous problem?*

#### Problem 11

*Use the `MakeDict` functor to construct a module `StudentDir`.*

#### Problem 12

*Write an implementation of the `MakeDict` functor. The implementation need not be especially efficient (consider using a straightforward implementation using a list).*
