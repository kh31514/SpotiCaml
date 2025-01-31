(** Representation of Spotify album data.

    This module represents the data stored in album files, including the album
    name, number of tracks, and artist(s). It handles loading of that data from
    JSON as well as querying the data. *)

exception UnknownAlbum of string
(** Raised when the Spotify API cannot identify a given artist. It carries the
    identifier of the unknown artist *)

type album
(** The abstract type of values representing Spotify albums. *)

type abbrev_track
(** The abbreviates abstract type of values representing Spotify tracks. Unlike
    Track.track, abbrev_track only contains information about the track name and
    track number within its album. *)

val album_of_json : Yojson.Basic.t -> album
(** [track_of_json j] is the Spotify artist that [j] represents. Raises
    UnknownArtist exception if [j] is an invalid JSON artist representation
    (null). *)

val get_album : unit -> album
(** [get_album ()] reads data/album.json and returns the corresponding album. *)

val get_album_name : album -> string
(** [get_album_name t] returns the name of album [t]. *)

val get_album_artists : album -> string
(** [get_album_artist t] returns the artist of album [t]. *)

val print_album_info : album -> unit
(** [print_album_info t] will print information about album t to the terminal.
    For example, if [t] represents the json of the album "Rumors",
    [print_track_info t] will print the following: "Here's what I found: Rumors
    was produced by Fleatwood Mac in 1977. Rumors has a total of 11 tracks, some
    of which include." *)

val track_num_to_name : int -> abbrev_track list -> string
(** [track_num_to_name i tracks] will return the name of the [i]th track in
    [tracks] *)

val get_album_track_len : abbrev_track list -> int
(** [get_album_track_len tracks] returns the length of [tracks] *)

val get_album_tracks : unit -> abbrev_track list
(** [get_album_tracks ()] reads data/album_tracks.json and returns the
    corresponding list of tracks *)

val abbrev_track_of_json : Yojson.Basic.t -> abbrev_track
(** [abbrev_track_of_json t] is the abbreviated Spotify track that [t]
    represents. Requires that [t] is a valid abbreviated artist JSON. *)
