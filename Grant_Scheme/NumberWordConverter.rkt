#lang racket

; maps
(define singles 
  (hash 
   1 "one"
   2 "two"
   3 "three"
   4 "four"
   5 "five"
   6 "six"
   7 "seven"
   ))

(define tens 
  (hash
   1 "ten"
   2 "twenty"
   3 "thirty"
   4 "forty"
   5 "fifty"
   6 "sixty"
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

(define (divide-down numerator denominator) (floor (/ numerator denominator)))

(define (get-digit digit number)
  (divide-down (modulo number (* 10 digit)) digit))

(define (replace-irregular-numbers numberString keys)
  (cond
    ((null? keys) numberString)
    (else
     (replace-irregular-numbers
      (string-replace numberString (first keys) (hash-ref replacements (first keys)))
      (rest keys)))))

(define (hundreds->words number)
  (string-append
     (lookup singles (get-digit 100 number) " hundred ") 
     (lookup tens (get-digit 10 number) " ") 
     (lookup singles (get-digit 1 number) " ")))

(define (thousands->words number scale name)
  (if (> number (- scale 1))
      (string-append (hundreds->words (divide-down number scale)) name)
      ""))

(define (number->words number)
  (replace-irregular-numbers 
   (string-trim 
    (string-append
     (thousands->words number 1000000 "million ")
     (thousands->words number 1000 "thousand ")
     (hundreds->words (modulo number 1000))))
   (hash-keys replacements)))
  
(provide number->words)