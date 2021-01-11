type 'a gnezdenje =
  | Element of 'a
  | Podseznam of 'a gnezdenje list

let gnezdenje_primer=
  [
    Element 1;
    Element 2;
      Podseznam [
        Element 3;
        Podseznam [ Element 4];
        Podseznam []
      ];
      Podseznam [Element 5]
  ]

let rec najvecja_globina = function
  | []-> 0
  |Element x :: gnezdenja ->
    max 1 (najvecja_globina gnezdenja)
  | Podseznam sez_gnezdenj :: gnezdenja ->
    max (1 + najvecja_globina sez_gnezdenj)
      (najvecja_globina gnezdenja)


let rec preslikaj (f: 'a -> 'b) = function
  |[] -> []
  |Element x :: gnezdenja -> Element (f x) :: (preslikaj f gnezdenja)
  |Podseznam sez :: gnezdenje ->
    Podseznam (preslikaj f sez) :: (preslikaj f gnezdenje)


let rec alternirajoci_konstruktorji = function
  |[] | _ :: []-> true
  | Element _ :: Podseznam sez :: gnezdenje ->
    alternirajoci_konstruktorji (Podseznam sez :: gnezdenje)
  | Podseznam _ :: (Element x :: _ as rest)->
    alternirajoci_konstruktorji rest
  | Podseznam _ :: Podseznam _ :: _ 
  | Element _ :: Element _ :: _ -> true


(* f *)