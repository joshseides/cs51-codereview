# Code Review 6 Handout
## Josh Seides

### Topic Outline
We finally venture out of the functional paradise we have been so fortunate to have found ourselves in this first half of the semester!

* references
* mutable lists

### References
A **reference** is a built-in mutable structure in OCaml that allows for updating and accessing the contents of the reference. Unlike functional programming, references are part of the **imperative** paradigm that involves impure functions with side effects.

#### Problem 1
*What is the difference between pure and impure functions?*

#### Problem 2
*Why would the imperative paradigm be useful?*

#### Problem 3
*Implement an `updateRef` function that takes an `'a ref` and an `'a` value and sets the reference to the second input.*

#### Problem 4
*What is the type of `updateRef`?*

#### Problem 5
*What is the type of the following expression?*

```ocaml
let f x y z =
    match !y with
    | None -> !x = z
    | Some z -> z > 4 ;;
```

#### Problem 6
*Implement `remember` from lab.*

#### Problem 7
*What is the `unit` type used for and how is it related to `()`?*

#### Problem 8
*What is the single semicolon used for in OCaml?*

#### Problem 9
*Implement `gensym` from lab.*

### Mutable Lists
Recall from lecture the definition of mutable lists.

```ocaml
(type 'a mlist =
| Nil
| Cons of 'a * ('a mlist ref) ;;)
```

#### Problem 10
*Implement `m_convert` that converts a list into an `mlist`.*

#### Problem 11
*Implement `m_length` that returns the length of an `mlist`.*

#### Problem 12
*Implement `m_append` that appends one `mlist` to another.*
