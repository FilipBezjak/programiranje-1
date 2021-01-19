
let odstej_trojici (x,y,z) (a,b,c)=
  (x-a,y-b,z-c)

let do_n sez n=
  let rec aux sez i acc=
    if i >= n then acc else
    match sez with
    |x::xs -> aux xs (i+1) (x::acc)
    |_-> sez
    in
  List.rev (aux sez 0 [])


let max_rezultat_do_n f n=
  let rec aux i najvecji f_najvecji=
    if i > n then najvecji else
      if f i > f_najvecji then aux (i+1) i (f i)
      else aux (i+1) najvecji f_najvecji
      in
  aux 0 0 (f 0)

let pocisti_seznam sez=
  let rec aux stari novi=
    match stari with
    |Some(x)::xs -> aux xs (x::novi)
    |None::xs -> aux xs novi
    |[]-> List.rev novi
    in
  aux sez []


(*let preveri_urejenost sez =
  let rec aux lih sod= function
    |x::xs->
      match lih, sod with
      |No
      if x mod 2 = 0 && sod != [] && x >= List.nth sod 0 then aux lih (x::sod) xs
      else if x mod 2 = 1 && lih !=  [] &&x <= List. nth lih 0 then aux (x::lih) sod xs
        else false
    |[] -> true
    in
    aux None None sez*)
(*
    let a = preveri_urejenost [5; 2; 4; 1; 6]
    let b = preveri_urejenost [3; 2; 4; 5; 6]    
    let d = preveri_urejenost [1; 1; 1; 1; 1]*)


(* 2--------------*)
type 'a gnezdenje =
  | Element of 'a
  | Podseznam of 'a gnezdenje list

  let test =
    [ Element 1;
      Element 2;
      Podseznam [
        Element 3;
        Podseznam [Element 4];
        Podseznam [];
      ] ;
      Element 5
    ]

    let test2 =
      [ Element 1;
        Podseznam([Element 2]);
        Element(7);
        Podseznam [
          Element 3;
          Podseznam [Element 4];
          Podseznam [];
        ] ;
        Element 5
      ]

let rec najvecja_globina = function
  | [] -> 1
  | Element _ :: xs -> najvecja_globina xs
  | Podseznam podsez :: xs ->
      max (najvecja_globina podsez + 1) (najvecja_globina xs)

let rec preslikaj f = function
  | [] -> []
  | Element x :: xs -> Element (f x) :: preslikaj f xs
  | Podseznam podsez :: xs -> Podseznam (preslikaj f podsez) :: preslikaj f xs

let rec splosci = function
  | [] -> []
  | Element x :: xs -> x :: splosci xs
  | Podseznam podsez :: xs -> splosci podsez @ splosci xs

let rec alternirajoci_konstruktorji sez=
  let rec alt_pod= function
    |Element(x)::xs -> false
    |Podseznam(x)::xs -> alt_el xs
    |[]-> true
  and
  alt_el= function
    |Element(x)::xs -> alt_pod xs
    |Podseznam(x)::xs -> false
    |[]-> true
  in
  match sez with
  |Element(x)::xs -> alt_pod xs 
  |Podseznam(x)::xs -> alt_el xs
  |[]-> true