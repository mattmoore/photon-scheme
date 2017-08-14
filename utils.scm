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

(define numstr->month
  (lambda (x)
    (cond
      ((equal? x "1") "Jan")
      ((equal? x "2") "Feb")
      ((equal? x "3") "Mar")
      ((equal? x "4") "Apr")
      ((equal? x "5") "May")
      ((equal? x "6") "Jun")
      ((equal? x "7") "Jul")
      ((equal? x "8") "Aug")
      ((equal? x "9") "Sep")
      ((equal? x "10") "Oct")
      ((equal? x "11") "Nov")
      ((equal? x "12") "Dec")
      (else "Unknown month"))))
