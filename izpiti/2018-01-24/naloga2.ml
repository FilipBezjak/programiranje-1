type 'a filter_tree=
  |List of 'a list
  |Vozlisce of 'a filter_tree * 'a * 'a filter_tree

let rec vstavi int drevo=
  match drevo with
  |Vozlisce(ldrevo, n, ddrevo) ->
    if int > n then 
    Vozlisce(ldrevo, n, vstavi int ddrevo)
    else 
      Vozlisce(vstavi int ldrevo, n, ddrevo)
  |List(sez) -> List(int::sez)

let primer = Vozlisce(
  Vozlisce(
    List [1], 5, List []
  ), 10,
  Vozlisce(
    List [], 15, List [19;20]
  )
)

let rec vstavi_seznam drevo= function
  |x::xs -> 
    (vstavi_seznam (vstavi x drevo) xs)
  |_-> drevo

let rec primerja f sez n=
  match sez with
  | x::xs -> 
    if f x n then primerja f xs n
    else false
  | _ -> true


let rec preveri= function
  |Vozlisce(List sezl, n, List sezh) ->
    if (not (primerja (<=) sezl n)) or (not (primerja (>) sezh n))
      then false
    else true
  |Vozlisce(ldrevo, n, ddrevo) -> 
    (preveri ldrevo) && (preveri ddrevo)
