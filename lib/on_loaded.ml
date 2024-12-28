open Js_of_ocaml

let promise, resolve = Lwt.wait ()

let handle h = Lwt.on_success promise h

let () =
  print_endline "Registering onload handler";
  Dom_html.window##.onload :=  Dom.handler (fun _ ->
    print_endline "onload handler called";
    Lwt.wakeup_later resolve ();
    Js._true
  )