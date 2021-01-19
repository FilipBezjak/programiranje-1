let razlika_kvadratov m n=
  2*m*n

let razdeli list'=
  let rec aux list accm accp =
    match list with
    |x::xs ->
      if x < 0 then 
        aux xs (x::accm) accp
      else aux xs accm (x::accp)
    |_-> accm,accp
    in
    aux list' [] []

let monotona_pot drevo=
  
