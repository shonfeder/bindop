(lang dune 2.0)
(name bindop)
(implicit_transitive_deps false)

(generate_opam_files true)
(source (github shonfeder/bindop))
(maintainers "Shon Feder <shon.feder@gmail.com>")
(authors "Shon Feder <shon.feder@gmail.com>")

(package
 (name bindop)
 (synopsis "Binding operators")
 (description "\
Binding operators
")
 (documentation https://shonfeder.github.io/bindop/)
 (depends alcotest base lwt))
