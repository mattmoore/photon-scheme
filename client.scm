(declare (unit client))
(declare (uses api-auth))
(use http-client intarweb uri-common)

(define http-fetch
  (lambda (url)
    (with-input-from-request url #f read-string)))

(define http-get
  (lambda (url header-args)
    (let* (
      (uri (uri-reference url))
      (req (make-request
        method: 'GET
        uri: uri
        headers: (headers cons
          '(
            (authorization auth-header)
            (content-type application/json)
            (x-customer-id 1)
          '(
            header-args)
        )))))
      (with-input-from-request req #f read-string))))

(define http-post
  (lambda (url args)
    (let* (
      (uri (uri-reference url))
      (req (make-request
        method: 'POST
        uri: uri
        headers: (headers '(
          (content-type application/json)
          (x-customer-id 1)
        )))))
      (with-input-from-request req "Contents of the document" read-string))))
