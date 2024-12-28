module Html = Js_of_ocaml.Dom_html
module Dom = Js_of_ocaml.Dom
module Js = Js_of_ocaml.Js

type t = {
  node: Html.paragraphElement Js.t;
  mutable txt: string;
}

let doc = Html.document

let para txt =
  let el = Html.createP doc in
  Dom.appendChild el (doc##createTextNode (Js.string txt));
  el

let create initial_msg = 
  let node = para initial_msg in
  On_loaded.handle (fun () -> Dom.appendChild doc##.body node);
  {txt=initial_msg; node}

let update box new_text =
  box.txt <- new_text;
  let node = box.node in
  let childMaybe = node##.firstChild in
  Js.Opt.iter childMaybe (Dom.removeChild node);
  Dom.appendChild node (doc##createTextNode (Js.string new_text))

let read box = box.txt

let on_click box handler = 
  let wrapped_handler = Dom.handler (fun _ -> 
    Js.bool (handler ())
  ) in
  Dom.addEventListener box.node Html.Event.click wrapped_handler Js._false |> ignore