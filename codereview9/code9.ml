let rec lucas : int stream =
  lazy (Cons(2, lazy Cons(1, smap2 ( + ) lucas (tail lucas))))

class ultra_scoreboard (boards : scoreboard list) =
  object
    val mutable boards = boards

    method reset_board (id : int) : unit =
      List.iter (fun x -> if x#get_id = id then x#new_game else ()) boards
  end ;;
