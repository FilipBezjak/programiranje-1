(*a  ------------*)

let rec izpisi_vsa_stevila= function
  |x::xs -> print_int x;
  izpisi_vsa_stevila xs
  |_-> ()

(*b ----------------- *)

let rec map2_opt f sez1 sez2=
  if List.length sez1 != List.length sez2
    then None else
    let rec aux f sez1 sez2 acc=
      match sez1, sez2 with
      |x::xs,y::ys -> aux f xs ys ((f x y)::acc)
      |_-> Some(List.rev acc)
      in
      aux f sez1 sez2 []