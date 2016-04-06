#lang racket

; maps
(define singles 
  (hash 
   1 "one"
   2 "two"
   ))

(define tens 
  (hash 
   20 "twenty"
   ))

; functions
(define (lookup map number) (hash-ref map number ""))
(define (get-single number) (modulo number 10))
(define (get-ten number) (- (modulo number 100) (get-single number)))

(define (number->words number)
  (string-trim 
   (string-append 
    (lookup tens (get-ten number)) 
    " " 
    (lookup singles (get-single number)))))
  
(provide number->words)