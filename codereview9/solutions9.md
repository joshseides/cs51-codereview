#### Problem 1
F, T, T, T, F, F

#### Problem 2
cn = O(n), `length`
c(log n) = O(log n), `search` in a binary tree

#### Problem 3
```ocaml
int ref ref ref
```

#### Problem 4
```ocaml
int ref
```

#### Problem 5
```ocaml
int
```

#### Problem 6
```ocaml
int ref ref ref mlist
```

#### Problem 7
```ocaml
let rec nth_lucas (n : int) : int =
    if n < 0 then failwith "cannot be negative"
    else if n = 0 then 2
    else if n = 1 then 1
    else nth_lucas (n - 1) + nth_lucas (n - 2) ;;
```

#### Problem 8
```ocaml
let rec lucas : int stream =
    lazy (Cons(2, lazy (Cons(1, smap2 ( + ) lucas (tail lucas))))) ;;
```

#### Problem 9
```ocaml
let fibs : int stream = 
    smap2 (fun x y -> (x + y) / 5) lucas (tail (tail lucas)) ;;
```

#### Problem 10
```ocaml
class scoreboard (id : int) : scoreboard_type =
    object
        val mutable id = id
        val mutable score = (0, 0)
        method get_id = id
        method new_game =
            score <- (0, 0)
        method update_score s =
            score <- s
        method give_summary =
            let a = fst score in
            let b = snd score in
            let c = if a > b then "Team A" else (if b > a then "Team B" else "Tie") in
            score, c
    end ;;
```

#### Problem 11
```ocaml
class ultra_scoreboard (boards : scoreboard list) =
    object
        val mutable boards = boards
        method new_game (id : int) : unit =
            List.iter (fun x -> if x#get_id = id then x#new_game else ()) boards
        method update_score (id : int) (s : int * int) : unit =
            List.iter (fun x -> if x#get_id = id then x#update_score s else ()) boards
        method give_summary (id : int) : (int * int) * string =
            List.fold_left (fun a e -> if e#get_id = id then e#give_summary else a) ((0, 0), "Board not found") boards
    end ;;
```

```ocaml
let board1 = new scoreboard 1 ;;
let board2 = new scoreboard 2 ;;
let board3 = new scoreboard 3 ;;

let ultra = new ultra_scoreboard [board1; board2; board3] ;;
```
