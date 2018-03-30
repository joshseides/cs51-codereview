# Code Review 7 Handout
## Josh Seides

### Topic Outline
Now onto one of the coolest and most mind-boggling things you will learn in CS 51!

* lazy streams
* sieve
* `Lazy` module
* physical and structural equality

### Lazy Streams
**Infinite data structures** are an interesting concept that arises in functional programming which may seem counterintuitive at first. If memory is finite, why are these data structures important? They turn out to be relevant in a variety of areas

* flexibility of data structure size
* representation of infinite processess (video streams, etc.)
* performance (e.g. Fibonacci!)

#### Problem 1
*Define the `'a str` and `'a stream` types from lecture and lab.*

#### Problem 2
*Implement `head` and `first` from lab.*

#### Problem 3
*Implement `smap` from lab.*

#### Problem 4
*What is wrong with the following code?*

```ocaml
let rec ones () : int str =
    Cons(1, ones) ;;
```

#### Problem 5
*Define `nats` from lab.*

### Sieve
From lab: "Eratosthenes sieve is a method for generating the prime numbers. Given a list of natural numbers starting with 2, we filter out those in the tail of the list not divisible by the first element of the list and apply the sieve to that tail."

#### Problem 6
*How does the sieve work conceptually?*

#### Problem 7
*How can we implement this?*

### `Lazy` Module
It is pretty annoying to have to write out `fun () -> ...` every time we want to define some kind of stream. Luckily, OCaml has a built-in way to do this for us. It seems kind of complicated in the lab, but all you have to remember is

* `fun () -> BLAH` goes to `lazy BLAH`
* `BLAH_FUN ()` goes to `Lazy.force BLAH_FUN`

#### Problem 8
*How should our type definitions change to use the `Lazy` module?*

#### Problem 9
*Implement `head` and `smap` using the `Lazy` module.*

### Physical and Structural Equality
It is important to keep in mind the difference between **physical** (memory-based) and **structural** (value-based) equality. It will be important for pset6!

* `==` and `!=` for physical
* `=` and `<>` for structural

```ocaml
let a = ref 1 ;;
let b = ref 1 ;;
let c = ref a ;;
```

#### Problem 10
*Which of the following are true?*

```ocaml
a = b ;;
a == b ;;
!a = !b ;;
!a == !b ;;
!c = a ;;
!c == a ;;
!c == b ;;
!c = b ;;
```
