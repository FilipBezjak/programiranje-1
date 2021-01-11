(*a *)

let rec odstej_trojici prva druga=
  match (prva, druga) with
  |((p1,d1,t1)),((p2,d2,t2)) ->
   (p1-p2,d1-d2,t1-t2)
  | _ -> failwith "napaka"


(*b *)

let rec funkcija f n=
  if n = 0 then f 0
    else
  max (f n) (funkcija f (n-1))

(*c *)

let rec preveri_urejenost seznam=
  let rec auxsod seznam acc=
  match seznam with
  |n::ns ->
    if (n mod 2) = 0
     then
      if n>acc then
        true
      else auxsod ns n 
    else auxsod ns acc
  |[] -> true in
  let rec auxlih seznam acc=
    match seznam with
    |n::ns ->
      if (n mod 2) = 1
       then
        if n<acc then
          true
        else auxlih ns n 
      else auxlih ns acc
    |[] -> true
    in
    auxlih seznam (List.fold_left min 100 seznam)
    auxsod seznam (List.fold_left max -100 seznam)


(*d *)




