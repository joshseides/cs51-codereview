# Code Review 9 Handout
## Josh Seides

### Midterm Information
* Do the **labs** first, then code review materials, then past midterms.
* Design and style matter on the exam.
* Practice writing code out by hand.
* Recurrences will be on the exam.

### Practice Questions

#### Problem 1
*Are the following statements true or false?*
* n^(1.1) = O(n)
* 10n^2 = O(n^2)
* 10n^2 = O(n^4)
* (1/2)n^3 + 5n^2 - 50n = O(n^3)
* 2^n = O(1.5)^n
* n = O((log n)^50)

#### Problem 2 (Daniel)
*Solve the following recurrences. For each recurrence, what is an example of a function with that recurrence?*
* T(n) = T(n - 1) + c
* T(n) = T(n / 2) + c

#### Problem 3
*What is the type of the following expression?*

```ocaml
let a = ref 10 in
let b = ref a in
let a = ref b in
a ;;
```

#### Problem 4
*What is the type of the following expression?*

```ocaml
let a = ref (ref 10) in
let b = ref a in
let a = ref b in
!(!(!a)) ;;
```

#### Problem 5
*What is the type of the following expression?*

```ocaml
let d = 5 in
let f = (fun d -> d * 4) in
let g = (fun c -> d * (f c)) in
g (g d) ;;
```

*Define the following.*

```ocaml
type 'a mlist =
| Nil
| Cons of 'a * ('a mlist ref) ;;

let mhead (Cons(hd, _tl)) = hd ;;
let mtail (Cons(_hd, tl)) = !tl ;;
```

#### Problem 6
*What is the type of the following expression?*
```ocaml
let a = ref (ref 5) in
let b = ref a in
Cons(ref a, ref (Cons (b, ref Nil))) ;;
```

*Let the following definitions be defined for streams.*

```ocaml
type 'a str = Cons of 'a * 'a stream
and 'a stream = 'a str Lazy.t ;;

let head (s : 'a stream) : 'a =
    let Cons(h, _t) = Lazy.force s in h ;;

let tail (s : 'a stream) : 'a stream =
    let Cons(_h, t) = Lazy.force s in t ;;

let rec first (n : int) (s : 'a stream) : 'a list =
    if n = 0 then []
    else head s :: first (n - 1) (tail s) ;;

let rec smap (f : 'a -> 'b) (s : 'a stream) : 'b stream =
    lazy (Cons(f (head s), smap f (tail s))) ;;

let rec smap2 (f : 'a -> 'b -> 'c)
              (s1 : 'a stream)
              (s2 : 'b stream)
              : 'c stream =
    lazy (Cons(f (head s1) (head s2), smap2 f (tail s1) (tail s2))) ;;
(**)))
```

*(Credit to Daniel for these Lucas questions!) The `n`th Lucas number `L(n)` is defined as follows:*
* `2`, if `n = 0`
* `1`, if `n = 1`
* `L(n - 1) + L(n - 2)`, otherwise

#### Problem 7
*Use naive recursion to implement function that on input `n` returns `L(n)`.*

#### Problem 8
*Implement an expression `lucas :  int stream` to represent an infinite stream of Lucas numbers.*

#### Problem 9
*There is a relationship between the Fibonacci and Lucas numbers. If `F(n)` represents the `n`th Fibonacci number, then `F(n) = (L(n - 1) + L(n + 1)) / 5`. Implement an expression `fib :  int stream` to represent an infinite stream of Fibnoacci numbers in terms of the expression `lucas` already created. (NOTE: Assume this stream starts at `F(1) = 1`.)*

#### Problem 10
*Create a class `scoreboard` of type `scoreboard_type`.*
```ocaml
class type scoreboard_type =
    object
        method get_id : int
        method new_game : unit
        method update_score : (int * int) -> unit
        method give_summary : (int * int) * string
    end ;;
```

#### Problem 11
*Create a class `ultra_scoreboard` that takes in a list of `scoreboard` objects and can reset, update, or give the summary of any of them.*
