type 'a heap = { a: 'a array; mutable n : int };
type 'a tree = E | N of 'a * 'a tree * 'a tree;
type 'a fp = {
  add : 'a -> unit;
  is_empty : unit -> bool;
  take_min : unit -> a;
}

(* Question 3: conversion d'un tas en arbre *)
let heap_to_tree h =
  let rec aux i = (* Renvoie l'arbre enracîné en h.a.(i) *)
    if i >= h.n then E
    else N(h.a.(i), aux 2*i+1, aux 2*i+2) in
  aux 0;;

let divide =
  | e::q -> e, q
  | [e] -> e, []

let kfusion ll = 
  let file = create () in
  let rec remplir ll = match ll with
    | [] -> ()
    | e::q -> file.add e in
  remplir ll;
  let rec extract () =
    if file.is_empty then []
    else let e, q = divide (file.take_min) in
            file.add q;
            e::extract in
  extract ();;
