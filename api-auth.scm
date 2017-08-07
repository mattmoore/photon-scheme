(declare (unit api-auth))
(use base64 hmac sha1)

(define hmac-digest
  (lambda (key message)
    (base64-encode
      ((hmac key (sha1-primitive)) message))))
