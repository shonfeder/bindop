open Base

module type S = sig
  include Monad.Infix

  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t

  val ( let+ ) : 'a t -> ('a -> 'b) -> 'b t
end

module type S2 = sig
  include Monad.Infix2

  val ( let* ) : ('a, 'e) t -> ('a -> ('b, 'e) t) -> ('b, 'e) t

  val ( let+ ) : ('a, 'e) t -> ('a -> 'b) -> ('b, 'e) t
end

module Make (M : Base.Monad.Infix) = struct
  include M

  let ( let* ) = ( >>= )

  let ( let+ ) = ( >>| )
end

module Lwt : S with type 'a t = 'a Lwt.t = Make (struct
  include Lwt

  let ( >>| ) = ( >|= )
end)

module Option : S with type 'a t = 'a Option.t = Make (struct
  include Option
  include Option.Monad_infix
end)

module Make2 (M : Base.Monad.Infix2) = struct
  include M

  let ( let* ) = ( >>= )

  let ( let+ ) = ( >>| )
end

module Result : S2 = Make2 (Result)
