(declare (unit client))
(declare (uses api-auth))
(use http-client intarweb uri-common)

(define http-fetch
  (lambda (url)
    (with-input-from-request url #f read-string)))

(define http-get
  (lambda (url custom-headers)
    (let* (
      (uri (uri-reference url))
      (req (make-request
        method: 'GET
        uri: uri
        headers: (headers (append
          '((authorization auth-header)
            (content-type application/json))
          custom-headers)
        ))))
      (with-input-from-request req #f read-string))))

(define http-post
  (lambda (url custom-headers body)
    (let* (
      (uri (uri-reference url))
      (req (make-request
        method: 'POST
        uri: uri
        headers: (headers (append
          '((authorization auth-header)
            (content-type application/json))
          custom-headers)
        ))))
      (with-input-from-request req body read-string))))
