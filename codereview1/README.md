# Code Review 1 Questions
## Josh Seides, 2/2/18

### Question 1
Draw an abstract syntax tree for `7 * (3 - 2)`.

<br/>

### Question 2
Draw an abstract syntax tree for `8 - (- 3)`.

<br/>

### Question 3
What is the difference between abstract syntax trees and semantics?

<br/>

### Question 4
What is the type of the below expression?
```ocaml
let patriots_win_probability : ??? = 0. ;;
```

<br/>


### Question 5
What is the type of the below expression?
```ocaml
let exercise5b : ??? =
    let greet y = "Hello " ^ y
    in greet "World!" ;;
```

<br/>

### Question 6
What is the type of the below expression?
```ocaml
let best_house z : ??? =
    if float_of_int z > 5. then "Mather" else "Mather" ;;
```

<br/>

### Question 7
What is the type of the below expression?
```ocaml
let mystery x y z : ??? =
    if y then ( + ) x else z ;;
```

<br/>

### Question 8
What is the type of the below expression?
```ocaml
let rec mystery2 x : ??? =
    match x with
    | [] -> [x]
    | h :: t -> if h +. 1. > 2. then mystery t else failwith "lame" ;;
```

<br/>

### Question 9
Implement a function that returns every odd element squared.

<br/>

### Question 10
Implement `max_list` from lab.
