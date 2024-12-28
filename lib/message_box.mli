(**
  The [Message_box] module provides the implementation of a re-usable message box widget
 which displays a simple text message in a webpage.*)

(** The type of a message_box instance. A value of this type holds all the necesssary
  state to be able to interact with the messagebox (i.e. change the message it displays 
  on the page*)
type t

(** [create "initial text"] creates a message box adds it to the web-page. The message
    box will display the ["initial text"] until it is updated. *)
val create : string -> t

(** [update box "new text"] changes the text displayed in the [box]*)
val update : t -> string -> unit

(** [read box] retrieves the currently displayed message*) 
val read : t -> string