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
        else x::(vstavi n xs)
      |_-> [n]


    let uredi_splosna f list=
      let rec aux f acc= function
        |x::xs-> aux f (vstavi_splosno f x acc) xs
        |[]-> acc
      in
      aux f [] list
