module Html = Js_of_ocaml.Dom_html
module Js = Js_of_ocaml.Js
module Dom = Js_of_ocaml.Dom
module MessageBox = Jsoo_tut.Message_box

let () = 
  print_endline "Script is starting";
  let _hello = MessageBox.create "Hello Dom World!" in
  let ctr = MessageBox.create "Counter will be here" in
  let counter_value = ref 0 in
  let every_second () = 
    MessageBox.update ctr ("Counter: "^ (string_of_int !counter_value));
    counter_value := !counter_value + 1
  in
  Html.window##setInterval (Js.wrap_callback every_second) 1000.0 |> ignore;
  MessageBox.on_click ctr (fun () -> 
    print_endline "Clicked the counter";
    counter_value := 0;
    true
  )
