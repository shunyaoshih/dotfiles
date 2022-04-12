;; #include "foo.h"
(preproc_include path: (string_literal) @TSInclude)

;; #include <iostream>
(preproc_include path: (system_lib_string) @TSInclude)

;; Preproc
"#define" @TSPreproc
[
  "#if"
  "#ifdef"
  "#ifndef"
  "#else"
  "#elif"
  "#endif"
  (preproc_directive)
] @TSPreproc

;; #if[n]def FOO
;; #endif
(preproc_ifdef name: (identifier) @TSPreproc)

;; #define FOO
(preproc_def name: (identifier) @TSPreproc)
