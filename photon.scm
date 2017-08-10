(import chicken scheme)
(declare (uses client config filters))
(use args)

(print "Key: asdf, Message: I've got a message")
(print "Result: " (hmac-digest "asdf" "I've got a message"))

(print "argv: " (argv))
(print "command-line-arguments: " (command-line-arguments))

(print
  "accessid: " (alist-ref 'accessid flags) #\newline
  "key: "      (alist-ref 'key      flags) #\newline
  "url: "      (alist-ref 'url      flags) #\newline
  "header: "   (filter header?      flags) #\newline
  "version: "  (alist-ref 'version  flags) #\newline
  (http-get    (alist-ref 'url      flags))
)
