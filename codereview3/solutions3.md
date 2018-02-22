#### Problem 1
```ocaml
(type student =
| Name of string
| GPA of float
| Enrolled of bool) ;;
```

(NOTE: Parentheses around `type` expression are not needed but mess up markdown text highlighting if not included.)

#### Problem 2
```ocaml
let josh = Name ("Josh") ;;
let bob = GPA (2.5) ;;
let mary = Enrolled (false) ;;
```

#### Problem 3
```ocaml
let extract (s : student) : float option =
    match s with
    | GPA (f) -> Some f
    | _ -> None ;;
```

#### Problem 4
```ocaml
let valid_rgb color =
    let bad_color c = c < 0 || c > 255 in
    match color with
    | Simple _ -> color
    | RGB (r, g, b) ->
        if bad_color r || bad_color g || bad_color b then 
            raise (Invalid_Color "color out of range")
        else color ;;
```

#### Problem 5
```ocaml
let valid_date ({ year; month; day } as d) : date =
    if year <= 0 then raise (Invalid_Date "only positive years") else
    let leap = year mod 4 = 0 && year mod 100 <> 0 || year mod 400 = 0 in
    let max_days =
        match month with
        | 1 | 3 | 5 | 7 | 8 | 10 | 12 -> 31
        | 4 | 6 | 9 | 11 -> 30
        | 2 -> if leap then 29 else 28
        | _ -> raise (Invalid_Date "bad month") in
    if day > max_days then raise (Invalid_Date "too many days")
    else if day < 1 then raise (Invalid_Date "days must be >1")
    else d ;;
```

#### Problem 6
```ocaml
exception Family_Trouble of string ;;

let marry (fam: family) (p: person) : family =
    match fam with
    | Child c -> Family (c, p, [])
    | _ -> raise (Family_Trouble ("Cannot add " ^ p.name ^ " to a couple!")) ;;

let add_to_family (fam: family) (c: family) : family =
    match fam with
    | Child _ -> raise (Family_Trouble "A child must marry first!")
    | Family (p1, p2, children) -> Family (p1, p2, c :: children) ;
```

#### Problem 7
```ocaml
let rec count_people (fam: family) : int =
    match fam
    | Child _ -> 1
    | Family (_, _, c) -> 2 + List.fold_left ( + ) 0 (List.map count_people c) 
```

#### Problem 8
```ocaml
type 'a tree = 
    | Lf
    | Br of 'a * 'a tree * 'a tree ;;
```

#### Problem 9
```ocaml
let rec size (t : 'a tree) : int =
    match t with
    | Lf -> 0
    | Br (_, l, r) -> 1 + size l + size r ;;

let rec height (t : 'a tree) : int =
    match t with
    | Lf -> 0
    | Br (_, l, r) -> 1 + max (height l) (height r) ;;
```

#### Problem 10
* options: return data values that can be computed on, cumbersome, does not stop execution
* exceptions: stops program execution, can have unexpected operations

#### Problem 11
```ocaml
int option
'a option list
exn
'a
exn -> 'a
'a -> 'b
```
