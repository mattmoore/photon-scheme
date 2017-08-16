(declare (unit api-auth))
(use base64 hmac md5 message-digest s sha1 srfi-19 uri-common)

(define content-md5
  (lambda (x)
    (cond
      ((string-null? x) "1B2M2Y8AsgTpgAmY7PhCfg==")
      (else (message-digest-string (md5-primitive) x)))))

(define sign
  (lambda (key message)
    (base64-encode ((hmac key (sha1-primitive)) message))))

(define canonical-string
  (lambda (method content-type content-md5 url timestamp)
    (s-join "," (list
      method
      content-type
      content-md5
      url
      (date->rfc-1123 timestamp)))))

(define url-path
  (lambda (x) (conc "/" (s-join "/" (cdr (uri-path (uri-reference x)))))))

(define date->rfc-1123
  (lambda (x) (format-date "~a, ~d ~b ~Y ~T GMT" x)))

(define auth-header
  (lambda (accessid key content-type body method url timestamp)
    (string->symbol
      (conc "APIAuth " accessid ":"
        (sign key
          (canonical-string
            method
            content-type
            (content-md5 body)
            (url-path url)
            timestamp))))))
