(import chicken scheme)
(declare (uses client command-grammar))

(print
  (http-get flag-url flag-accessid flag-key (symbolize-keys (parse-headers flag-headers)))
  ;(canonical-string
  ;  "GET" "application/vnd.api+json" "1B2M2Y8AsgTpgAmY7PhCfg==" flag-url "\"Sun, 13 Aug 2017 05:17:05 GMT\"")
  ;#\newline
  ;(auth-header flag-accessid flag-key "application/vnd.api+json" "" "GET" flag-url)
)
