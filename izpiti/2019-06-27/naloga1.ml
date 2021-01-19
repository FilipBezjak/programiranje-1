let rec list_apply_either pred f g sez=
  match sez with
  |x::xs->
    if pred x then (f x)::(list_apply_either pred f g xs)
    else (g x)::(list_apply_either pred f g xs)
  |[]->[]

let eval_poly koef t=
  let rec aux koef t i acc=
    if i > -1 then
      match koef with
      |x::xs ->
        aux xs t (i-1) 
        (acc + int_of_float 
          ((float_of_int x) *. ((float_of_int t) ** (float_of_int i))))
      |[]-> acc
    else acc
    in
    aux (List.rev koef) t ((List.length koef)-1) 0

  (*2---------*)

type najemnik= string

type vrt = 
  |Obdelovan of najemnik
  | Oddan of najemnik * (vrt * vrt list)
  | Prost

let vrt_primer =
  Oddan("Kovalevskaya",(
    Obdelovan("Galois"),
    [Obdelovan("Lagrange");Prost]
    )
  )

let primer = Oddan("d",
  (Oddan("a",(Prost,[Prost;Prost])),[Prost]))

  let obdelovalec_vrta = function Obdelovan x -> Some x | _ -> None

let rec globina_oddajanja (vrt: vrt): int=
  match vrt with
  |Oddan(lastnik,(vrt1,vrt2)) -> 
  1 + max (globina_oddajanja vrt1) (List.fold_left max 0 (List.map globina_oddajanja vrt2))
  |_->0


let rec v_uporabi vrt=
  match vrt with
  |Obdelovan(_) -> true
  |Prost -> false
  |Oddan(_,(vrt1,vrts)) ->
    let sez = List.mem true (List.map v_uporabi vrts) in
    v_uporabi vrt1 || sez


let rec vsi_najemniki= function
  |Oddan(x,(vrt1,vrt2)) -> [x]@(vsi_najemniki vrt1)@(List.fold_left (@) [] (List.map vsi_najemniki vrt2))
  |Obdelovan(y) -> [y]
  |Prost-> []


let rec vsi_obdelovalci= function
  |Prost -> []
  |Oddan(_,(vrt1,vrts))-> 
  (vsi_obdelovalci vrt1)@(List.fold_left (@) [] (List.map vsi_obdelovalci vrts))
  |Obdelovan(kmet) -> [kmet]