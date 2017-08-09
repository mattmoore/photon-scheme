(import chicken scheme)
(use args)
(declare (uses client))

(define version 1.0)

(define opts
  (list
    (args:make-option (i accessid)  #:required "accessid")
    (args:make-option (k key)       #:required "key")
    (args:make-option (url)         #:required "url")
    (args:make-option (H header)    #:required "header")
    (args:make-option (v V version) #:none     "Display version"
      (print version)
      (exit))
  )
)

(print "Key: asdf, Message: I've got a message")
(print "Result: " (hmac-digest "asdf" "I've got a message"))

(print "argv: " (argv))
(print "command-line-arguments: " (command-line-arguments))

(receive
  (options operands)
  (args:parse (command-line-arguments) opts)
  (print
    "accessid: " (alist-ref 'accessid options) #\newline
    "key: "      (alist-ref 'key      options) #\newline
    "url: "      (alist-ref 'url      options) #\newline
    "header: "   (alist-ref 'header   options) #\newline
    "version: "  (alist-ref 'version  options) #\newline
    (http-get (alist-ref 'url options))
  )
)
