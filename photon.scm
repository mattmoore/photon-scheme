(import chicken scheme)
(declare (uses client command-grammar))
(use srfi-19)

(print
  (http-get flag-url flag-accessid flag-key (symbolize-keys (parse-headers flag-headers)))
  ;(canonical-string "GET" "application/vnd.api+json" "1B2M2Y8AsgTpgAmY7PhCfg==" flag-url (current-date -5))
  ;#\newline
  ;(auth-header flag-accessid flag-key "application/vnd.api+json" "" "GET" flag-url (current-date -5))
)
