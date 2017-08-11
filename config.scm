(declare (unit config))
(use args)

(define version 1.0)

(define args-grammar
  (list
    (args:make-option (i accessid)  #:required "accessid")
    (args:make-option (k key)       #:required "key")
    (args:make-option (url)         #:required "url")
    (args:make-option (H header)    #:required "header")
    (args:make-option (v V version) #:none     "Display version"
      (print version)
      (exit))
  ))

(define flags (args:parse(command-line-arguments) args-grammar))

(define header? (lambda (x) (equal? 'header (car x))))

(define flags-url      (alist-ref 'url      flags))
(define flags-accessid (alist-ref 'accessid flags))
(define flags-key      (alist-ref 'key      flags))
(define flags-headers  (filter     header?  flags))
