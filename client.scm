(declare (unit client))
(declare (uses api-auth))
(use http-client intarweb uri-common)

(define http-get
  (lambda (url)
    (with-input-from-request url #f read-string)))

(define http-post
  (lambda (url)
    (let* ((uri (uri-reference url))
           (req (make-request method: 'POST
                              uri: uri
                              headers: (headers '((content-type application/json))))))
      (with-input-from-request req "Contents of the document" read-string))))
