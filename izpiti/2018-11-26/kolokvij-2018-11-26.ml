let sestevek list=
  let rec aux acc= function
  |x::xs -> aux (x+acc) xs
  |_-> acc
  in
  aux 0 list


(*2.----------------------------*)
let rec urejen list=
  match list with
  |x::y::xs -> if x <= y then
    urejen (y::xs) else
    false
  |_-> true

(*3-----------*)

let rec vstavi n list=
  match list with
  |x::xs ->
    if n <= x then (n::x::xs)
    else x::(vstavi n xs)
  |_-> [n]


  let uredi list=
    let rec aux acc= function
      |x::xs-> aux (vstavi x acc) xs
      |[]-> acc
    in
    aux [] list

    (*4----------*)

    let rec vstavi_splosno f n list=
      match list with
      |x::xs ->
        if f n x then (n::x::xs)
        else x::(vstavi_splosno f n xs)
      |_-> [n]


    let uredi_splosna f list=
      let rec aux f acc= function
        |x::xs-> aux f (vstavi_splosno f x acc) xs
        |[]-> acc
      in
      aux f [] list


(* -------- 5 -------- *)
type priority =
  |Top
  |Group of int

type status = 
  |Staff
  |Passenger of priority


type flyer = { status : status ; name : string }

let flyers = [ {status = Staff; name = "Quinn"}
             ; {status = Passenger (Group 0); name = "Xiao"}
             ; {status = Passenger Top; name = "Jaina"}
             ; {status = Passenger (Group 1000); name = "Aleks"}
             ; {status = Passenger (Group 1000); name = "Robin"}
             ; {status = Staff; name = "Alan"}
             ]


(* -------- 6 -------- *)

let compare x y =
  match x.status, y.status with
  | Staff, _ -> true
  | _, Staff -> false
  | Passenger Top, _ -> true
  | Passenger _, Passenger Top -> false
  | Passenger (Group j), Passenger (Group k) -> j > k




let vkrcavanje potniki=
  uredi_splosna (compare) potniki
(*
let a = vkrcavanje flyers*)

(* -------- 7 -------- *)

let rec v_sez potniki=
  
