# Code Review 6 Handout
## Josh Seides

### Topic Outline
We finally venture out of the functional paradise we have been so fortunate to have found ourselves in this first half of the semester!

* midterm
* recurrence relations
* references
* mutable lists
* graph searching

### Midterm
Midterm grades should be on Gradescope now. A few notes

* Do not worry, it is only 10% of your grade
* I cannot say anything about grading (all regrade requests go directly to Professor Shieber)
* For the next midterm, try to do as much practice writing code out by hand ahead of time
* Also, **do** the labs (without solutions in front of you) to study


### Recurrence Relations
This is a super quick review since it shows up on the second midterm. Important terms to keep in mind are

* big-O notation
* recurrence relations

### References
A **reference** is a built-in mutable structure in OCaml that allows for updating and accessing the contents of the reference. Unlike functional programming, references are part of the **imperative** paradigm that involves impure functions with side effects.

In OCaml, references are defined with the `ref` value constructor. To access the values of a reference, the `!` ("bang") operator is used. To update the contents of a reference, the `:=` operator is used.

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

This is similar to the recursive notion of linked lists we saw before. However, this is a **mutable** linked list. This is a closer approximation to a linked list used in practice, as references allow for more efficient operations.

#### Problem 10
*Implement `m_convert` that converts a list into an `mlist`.*

#### Problem 11
*Implement `m_length` that returns the length of an `mlist`.*

#### Problem 12
*Implement `m_append` that appends one `mlist` to another.*

### Graph Searching
For pset5, you will implement a game solver for problems including mazes and sliding tile puzzles. To do this, these problems can be modeled in terms of **graph search problems**. There are a few standard algorithms that will be implemented to solve these problems. Two importants ones are **breadth-first search (BFS)** and **depth-first search (DFS)**. Each algorithm is given a start node *u* and an end node *v*, returning whether a path exists to move from *u* to *v*. In the context of this pset, nodes in graphs represent game states and edges represents valid transitions between game states.

### Breadth-First Search
BFS goes level by level, searching all nodes in level *i* before moving on to level *i + 1*. BFS accomplishes this by using a **queue** (FIFO data structure).

### Depth-First Search
DFS goes all the way down a tree of relations for a single child before moving on to another child. DFS accomplishes this by using a **stack** (LIFO data structure).

### General Approach (Ezra)
Here is a general approach to implementing these graph search algorithms

* Pick a start vertex and a goal vertex
* From the start vertex, add all of the neighboring vertices to your **frontier**
* Pick a vertex from your frontier
    - If it’s the goal, you’re done!
    - Otherwise, add all of the neighbors to the frontier
* If you run out of vertices to add to your frontier and don’t find the goal, it’s impossible to reach the goal
