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
  )
)

(define flags (args:parse(command-line-arguments) args-grammar))
