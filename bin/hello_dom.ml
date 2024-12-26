module Html = Js_of_ocaml.Dom_html
module Js = Js_of_ocaml.Js
module Dom = Js_of_ocaml.Dom

let doc = Html.document

let para txt =
  let el = Html.createP doc in
  Dom.appendChild el (doc##createTextNode (Js.string txt));
  el

let () = 
  print_endline "Script is starting";
  Dom.appendChild doc##.body (para "Hello Dom World!")
