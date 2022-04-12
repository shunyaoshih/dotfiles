;; #include "foo.h"
(preproc_include path: (string_literal) @TSInclude)

;; #include <iostream>
(preproc_include path: (system_lib_string) @TSInclude)
