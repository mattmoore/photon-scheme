(declare (unit utils))
(use s)

(define parse-header
  (lambda (x) (map s-trim (s-split ":" (cdr x)))))

(define parse-headers
  (lambda (x) (map parse-header x)))

(define symbolize-key
  (lambda (x) (cons (string->symbol (car x)) (cdr x))))

(define symbolize-keys
  (lambda (x) (map symbolize-key x)))
