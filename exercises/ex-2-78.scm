(define (attach-tag type-tag contents)
  (if (number? contents)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (if (number? datum)
      '()
      (if (pair? datum)
	  (car datum)
	  (error "Bad tagged datum: TYPE-TAG" datum))))

(define (contents datum)
  (if (number? datum)
      datum
      (if (pair? datum)
	  (cdr datum)
	  (error "Bad tagged datum: CONTENTS" datum))))

;; (type-tag (attach-tag 'whatever 3))
;; ()
;; (contents (attach-tag 'whatever 3))
;; 3
