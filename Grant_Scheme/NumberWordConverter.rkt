#lang racket

; maps
(define singles 
  (hash 
   1 "one"
   2 "two"
   ))

(define tens 
  (hash
   10 "ten"
   20 "twenty"
   ))

(define replacements 
  (hash
   "ten one" "eleven"
   "ten two" "twelve"
   ))

; functions
(define (lookup map number suffix)
  (let ((value (hash-ref map number "")))
    (cond
      ((eq? value "") "")
      (else (string-append value suffix)))))

(define (get-single number) (modulo number 10))
(define (get-ten number) (- (modulo number 100) (get-single number)))
(define (get-hundred number) (/ (- number (get-ten number) (get-single number)) 100))

(define (replace-irregular-numbers numberString keys)
  (cond
    ((null? keys) numberString)
    (else
     (replace-irregular-numbers
      (string-replace numberString (first keys) (hash-ref replacements (first keys)))
      (rest keys)))))

(define (number->words number)
  (replace-irregular-numbers 
   (string-trim 
    (string-append
     (lookup singles (get-hundred number) " hundred ") 
     (lookup tens (get-ten number) " ") 
     (lookup singles (get-single number) "")))
   (hash-keys replacements)))

  
(provide number->words)