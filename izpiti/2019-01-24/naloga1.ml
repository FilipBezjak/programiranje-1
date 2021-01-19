(*f--------*)

let rec eksponent x n=
  if n = 0 then 1 else
  x * eksponent x (n-1)

let tlrc x n=
  let rec aux x n acc=
    if n > 0 then
    aux x (n-1) x*acc
    else acc
    in
    aux x n 1

type 'a mm_drevo=
  |Prazno
  |Vozlisce of 'a * int * 'a mm_drevo * 'a mm_drevo


let test = Vozlisce(
  3,1,Vozlisce(
    2,2,Prazno,Prazno)
    ,Vozlisce(4,2
      ,Prazno,Vozlisce(5,1,Prazno,Prazno))
)

let rec vstavi drevo n=
  match drevo with
  |Vozlisce(m, i, ldrevo, ddrevo)->
    if n = m then Vozlisce(m, i+1, ldrevo, ddrevo)
    else if n < m then Vozlisce(m, i, vstavi ldrevo n, ddrevo)
    else Vozlisce(m, i, ldrevo, vstavi ddrevo n)
  |Prazno -> Vozlisce(n, 1, Prazno, Prazno)


  let rec multimnozica_iz_seznama= function
    |x::xs -> 
      let drevo = Vozlisce(x,1,Prazno,Prazno) in
      let rec aux tree = function
        |y::ys -> aux (vstavi tree y) ys
        |[]-> tree
        in
        aux drevo xs
    |[]-> Prazno

let a = multimnozica_iz_seznama [5;3;6;2;9;9;6;1;6;7]

let rec velikost_multimnozice drevo=
  match drevo with
  |Vozlisce(x, i, ldrevo,ddrevo)->
    i + (velikost_multimnozice ldrevo) + (velikost_multimnozice ddrevo)
  |Prazno -> 0

let rec seznam_iz_multimnozice drevo =
  let aux drevo sez=
    match drevo with
    |Vozlisce(x,i,Prazno,ddrevo)
      -> aux ddrevo (dodaj x i sez)
    |Vozlisce(x,i,Vozlisce(y,j,ldrevo1,ddrevo1),ddrevo2)->
      aux (dodaj x i) @ Vozlisce(y,j,ldrevo1,ddrevo1)
