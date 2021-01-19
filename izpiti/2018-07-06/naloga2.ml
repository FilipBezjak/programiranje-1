type 'a neprazen_sez=
  |Konec of 'a
  |Sestavljen of 'a * 'a neprazen_sez

  let prvi neprazen=
    match neprazen with
    |Sestavljen(x, xs) -> x
    |_ -> failwith "prazen"
  

    let rec zadnji neprazen=
      match neprazen with
      |Sestavljen(x, xs) -> zadnji xs
      |Konec x -> x
  
    
    let rec dolzina= function
      |Sestavljen(x, xs) -> 1 + (dolzina xs)
      |Konec x -> 1

    let rec pretvori_v_seznam= function
      |Sestavljen(x, xs) -> x::(pretvori_v_seznam xs)
      |Konec x -> [x]

    let rec zlozi f n neprazen=
      let sez = pretvori_v_seznam neprazen in
      List.fold_left f n sez

let testni =
  Sestavljen(1,Sestavljen(2,Sestavljen(3,Sestavljen(4,Sestavljen(5, Konec 6)))))

