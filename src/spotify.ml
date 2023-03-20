
TODO: figure out import issues (check dune file?)
open spotify-web-api

TODO: implement this
(** [handle_song song] will print information about [song] (ex. artist, album, duration, genre) *)
let handle_song song =
  let mode = `track in ()

TODO: implement this
(** [handle_artist artist] will print information about [artist] (ex. top 5 songs/albums, age, number of songs produced, popularity) *)
let handle_artist artist = 
  let mode = `artist in ()

  TODO: implement this
(** [handle_album album] will print information about [album] (ex. songs in album, artist, duration, genre) *)
let handle_album album = 
  let mode = `album in ()

(** [parse text] determines whether a user inputs a song, artist, or album and calls the approprate, associaetd function.
    The function will be re-called if given extraneous input *)
let rec parse text = 
  print_endline ("Is " ^ text ^ " a song, artist, or ablum?");
  match read_line () with
  | exception End_of_file -> ()
  | "song" -> handle_song text
  | "artist" -> handle_artist text
  | "album" -> handle_album text
  | weird_input -> print_endline ("Can't deciper " ^ weird_input ^ "."); parse text

(** [main ()] prompts the user for a command, then executes the given command or displays a helpful error message *)
let main () = 
  print_endline "Welcome to SpotiCaml. Start by entering a song, artist, or ablum.";
  match read_line () with
  | exception End_of_file -> ()
  | text -> parse text

(* Execute the game engine. Taken from A2 *)
let () = main ()