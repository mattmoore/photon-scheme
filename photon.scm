(import chicken scheme)
(declare (uses client grammar))
(use getopt-long)

(define version 1.0)

(print "Key: asdf, Message: I've got a message")
(print "Result: " (hmac-digest "asdf" "I've got a message"))

(print "argv: " (argv))
(print "command-line-arguments: " (command-line-arguments))

(define args (getopt-long (command-line-arguments) grammar))

(define header?
  (lambda (x)
    (equal? 'header (car x))))

(print
  "getopt-long: " args #\newline
  "url: " (alist-ref 'url args) #\newline
  "header: " (filter header? args) #\newline
)

;(print
;  (http-get (alist-ref 'url args)))
