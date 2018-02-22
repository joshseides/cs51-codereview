(* What are some example use cases for modules? *)

(* Why create modules in the first place? *)

(* Create a `TFJosh` module that includes a `demographic` type and value (which
   should be a record with age, gender, and hometown), a `name` value, a
   `favorite` `int -> int -> bool` function, and a `print_demographic`
   function of type `demographic -> string`. *)

(* How do you decide when to use top-level vs. local opens? *)

(* Why have module signatures? *)

(* How does this module vs. module signature distinction relate to something
   like the `List` module? *)

(* Make a type signature for our `TF` module. *)

(* Explicitly type the module implementation defined above as matching the
   module signature `TF`. *)

module IntListStack =
  struct
    exception EmptyStack
    type stack = int list

    (* Returns an empty stack *)
    let empty () : stack = []

    (* Add an element to the top of the stack *)
    let push (i : int) (s : stack) : stack = i :: s

    (* Return the value of the topmost element on the stack *)
    let top (s : stack) : int =
      match s with
      | [] -> raise EmptyStack
      | h :: _ -> h

    (* Return a modified stack with the topmost element removed *)
    let pop (s : stack) : stack =
      match s with
      | [] -> raise EmptyStack
      | _::t -> t
  end ;;

(* What is bad about the implementation of the `int stack` above? *)

(* How would we write a module signature for `int stack` to better abstract
   the implementation? *)

(* Create a record type `integer` and a module signature `Integer` each with
   one value of type `int` named `x`. *)

(* Create a record `one` and a module `One` to represent the number 1 in their
   respective formats. *)

(* Create a function for records that adds their `x` fields and a functor for
   modules that adds their `x` values. *)

(* (Next level stuff.) Create a higher-order function and functor that takes in
   a function/functor `a -> a -> a` and one value `i` of type `a` (where `a` is
   either `integer` or `Integer` for functions and functors, respectively) and
   returns the function/functor applied on `i` twice. *)

(* How can we use partial application on the function/functor we just
   created? *)
