(import chicken scheme)
(declare (uses client command-grammar))

(print
  (http-get flag-url (symbolize-keys (parse-headers flag-headers))))
