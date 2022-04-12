;; import "fmt"
(import_declaration
  (import_spec
     path: (interpreted_string_literal) @TSInclude))

;; import (
;;   "fmt"
;; )
(import_declaration
  (import_spec_list
    (import_spec
      path: (interpreted_string_literal) @TSInclude)))

;; Overwrite the default @constant query in some cases.
(literal_value
  (keyed_element
    (literal_element
      (identifier) @TSVariable)))
