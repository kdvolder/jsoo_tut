module Html = Js_of_ocaml.Dom_html
module Js = Js_of_ocaml.Js
module Dom = Js_of_ocaml.Dom

let doc = Html.document

let para txt =
  let el = Html.createP doc in
  Dom.appendChild el (doc##createTextNode (Js.string txt));
  el

let on_load () =
  print_endline "on_load ...";
  Dom.appendChild doc##.body (para "Hello Dom World!")

let () = 
  print_endline "Script is starting";
  Html.window##.onload := Dom.handler (fun (_) -> on_load (); Js._true)
  
