;; original output
;;
;; sum 0  New-value = 0
;; carry 0  New-value = 0
;; sum 8  New-value = 1
;; carry 11  New-value = 1
;; sum 16  New-value = 0

(load "lib/digital-circuits.scm")

(define (make-wire)
  (let ((signal-value 0) (action-procedures '()))
    (define (set-my-signal! new-value)
      (if (not (= signal-value new-value))
        (begin
          (set! signal-value new-value)
          (call-each action-procedures))
        'done))

    (define (accept-action-procedure! proc)
      (set! action-procedures (cons proc action-procedures))
      ;; NOTE: this is the modified version without a (proc) call.
      )

    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
            ((eq? m 'set-signal!) set-my-signal!)
            ((eq? m 'add-action!) accept-action-procedure!)
            (else (error "Unknown operation -- WIRE" m))))
    dispatch))

(define input-1 (make-wire))
(define input-2 (make-wire))
(define sum (make-wire))
(define carry (make-wire))

(probe 'sum sum)
(probe 'carry carry)

(half-adder input-1 input-2 sum carry)
(set-signal! input-1 1)
(propagate)
(set-signal! input-2 1)
(propagate)

;; modified output
;;
;; carry 11  New-value = 1

;; In this example, with the new implementation no change would be detected.
