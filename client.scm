(declare (unit client))
(declare (uses api-auth))
(use http-client intarweb srfi-19 uri-common)

(define header-date
  (lambda (x)
    (vector
      (date-second x)
      (date-minute x)
      (date-hour x)
      (date-day x)
      (- (date-month x) 1)
      (- (date-year x) 1900)
      (date-week-day x))))

(define gen-headers
  (lambda (accessid key content-type body method url custom-headers)
    (let*
      ((timestamp (current-date -5)))
      (headers
       (append
         (list
           (list 'date (vector (header-date timestamp) #()))
           (list 'authorization (auth-header
             accessid key content-type body method url timestamp))
           (list 'content-md5 (content-md5 body)))
         custom-headers))
      )))

(define gen-request
  (lambda (method url accessid key custom-headers body)
    (make-request
      method: 'GET
      uri: (uri-reference url)
      headers: (gen-headers
        accessid key "application/vnd.api+json" body method url custom-headers))))

(define http-get
  (lambda (url accessid key custom-headers)
    (with-input-from-request
      (gen-request "GET" url accessid key custom-headers "")
      #f read-string)))

(define http-post
  (lambda (url accessid key custom-headers body)
    (let* (
      (uri (uri-reference url))
      (req (make-request
        method: 'POST
        uri: uri
        headers: (headers (append
          (list
            (list 'authorization (auth-header url accessid key "POST" "application/json" ""))
            '(content-type application/json))
          custom-headers)
        ))))
      (with-input-from-request req body read-string))))
