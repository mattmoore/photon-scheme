(import chicken scheme)
(declare (uses client config))
(use args)

(print (http-get flags-url))
