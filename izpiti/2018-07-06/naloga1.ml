let uporabi f x = 
  f x

let ibaropu x f=
  f x

let zacetnih (n:int) sez=
  if List.length sez < n then
    None
  else
    let rec aux (m:int) sez acc=
      if m > 0 then
      match sez with 
      |x::xs -> aux (m-1) xs (x::acc)
      |_-> []
      else acc
      in
    Some(List.rev (aux n sez []))