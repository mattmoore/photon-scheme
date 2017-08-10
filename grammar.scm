(declare (unit grammar))

(define grammar
  '((url (required #t) (value #t))
    (accessid (required #f) (value #f))
    (version (required #f) (single-char #\v) (value #f))
    (header (required #f) (single-char #\H) (value #t))
  )
)
