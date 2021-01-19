type 'a veriga=
  | Filter of ('a -> bool) * 'a list * 'a veriga
  | Ostalo of 'a list


let test =
  Filter((fun x  -> x < 0), [],
  Filter( (fun x -> x < 10), [],
  Filter( (fun x -> x > 1000), [],Ostalo []) 
  ))


let rec vstavi n veriga=
  match veriga with
  |Filter(f, sez, verigas) 
    -> if f n then 
      Filter(f, n::sez, verigas) else 
      Filter(f, sez, vstavi n verigas)
  |Ostalo s -> Ostalo (n::s)

let rec poisci n veriga=
  match veriga with
  |Filter(f, sez, verigas) 
    -> if f n then
      List.mem n sez else
      poisci n verigas
  | Ostalo sez -> List.mem n sez

(*verigo filtrov z praznimi seznami * sez vseh elementov v verigi*)  
let izprazni_filtre veriga'=
  let rec auxf veriga= (* vrne filtre*)
    match veriga with
    |Ostalo s -> Ostalo []
    |Filter(f, sez, verigas)->
      Filter(f, [], auxf verigas)
    in 
  let rec auxs veriga acc= (* vrne seznam*)
    match veriga with
    |Ostalo s -> s @ acc
    |Filter(f, sez, verigas)->
      auxs verigas (sez @ acc)
    in
   (auxs veriga' [], auxf veriga')
    

(*d------------------*)

let rec dodaj_pomozna f veriga= (*doda filter*)
  match veriga with
  |Filter(f', sez, verigas) ->
    Filter(f, [], Filter(f', sez, verigas))
  |_-> failwith "napaka pomozna"

let rec dodaj_pomozna2 (veriga: int veriga)= function (*da elemente v verigo*)
  |x::xs -> (vstavi x (dodaj_pomozna2 veriga xs))
  |_-> veriga

let rec dodaj f veriga=
  let (sez, filteri) = izprazni_filtre veriga in
  let nova = dodaj_pomozna f filteri in
  dodaj_pomozna2 nova sez
  





let c veriga=
  vstavi (-5) veriga
  |> vstavi (7)
  |> vstavi (100)
  |> vstavi (-7)
  |> vstavi (2)

let v = c test

let f = (fun x -> x mod 2 = 0 ) 