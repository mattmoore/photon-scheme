(declare (unit api-auth))
(use base64 hmac md5 message-digest s sha1)

(define content-md5
  (lambda (content) (message-digest-string (md5-primitive) content)))

(define hmac-digest
  (lambda (key message)
    (base64-encode ((hmac key (sha1-primitive)) message))))

(define canonical-string
  (lambda (method content-type content-md5 uri timestamp)
    (s-join "," (list method content-type content-md5 uri timestamp))))

(define auth-header
  (lambda (body)
    (conc "ApiAuth "
      (canonical-string "GET" "application/json" "blah" "http://localhost" "2017"))))
