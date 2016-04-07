#lang racket

(define singles 
  (hash 
   1 "one"
   2 "two"
   3 "three"
   4 "four"
   5 "five"
   6 "six"
   7 "seven"
   8 "eight"
   9 "nine"))

(define tens 
  (hash
   1 "ten"
   2 "twenty"
   3 "thirty"
   4 "forty"
   5 "fifty"
   6 "sixty"
   7 "seventy"
   8 "eighty"
   9 "ninety"))

(define thousands 
  '((1000000000 "billion")
    (1000000 "million")
    (1000 "thousand")
    (1 "")))

(define replacements 
  (hash
   "ten one" "eleven"
   "ten two" "twelve"
   "ten three" "thirteen"
   "ten four" "fourteen"
   "ten five" "fifteen"
   "ten six" "sixteen"
   "ten seven" "seventeen"
   "ten eight" "eighteen"
   "ten nine" "nineteen"))

; main functions

(define (number->words number)
  (replace-irregular-numbers 
   (string-trim 
    (iterate-thousands thousands number))
   (hash-keys replacements)))

(define (iterate-thousands thousands-list number)
  (cond
    ((null? thousands-list) '())
    (else
     (join-with-space
      (thousands->words number (first-scale thousands-list) (first-label thousands-list))
      (iterate-thousands (rest thousands-list) number)))))

(define (thousands->words number scale name)
  (cond
    ((> number (- scale 1)) (join-with-space (hundreds->words (divide-down number scale)) name))
     (else '())))

(define (hundreds->words number)
  (join-with-space
     (lookup singles (get-digit 100 number) "hundred") 
     (lookup tens (get-digit 10 number) '()) 
     (lookup singles (get-digit 1 number) '())))

(define (replace-irregular-numbers numberString replacement-keys)
  (cond
    ((null? replacement-keys) numberString)
    (else
     (replace-irregular-numbers
      (string-replace numberString (first replacement-keys) (hash-ref replacements (first replacement-keys)))
      (rest replacement-keys)))))

; helper functions

(define (lookup map number suffix)
  (let ((value (hash-ref map number '())))
    (cond
      ((null? value) '())
      (else (join-with-space value suffix)))))

(define (divide-down numerator denominator)
  (floor (/ numerator denominator)))

(define (get-digit digit number)
  (divide-down (modulo number (* 10 digit)) digit))

(define (first-scale thousands-list)
  (first (first thousands-list)))

(define (first-label thousands-list)
  (first (rest (first thousands-list))))

(define (join-with-space . strings)
  (string-join (filter (lambda (string) (not (null? string))) strings) " "))
  
(provide number->words)