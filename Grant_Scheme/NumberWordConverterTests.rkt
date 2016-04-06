#lang racket

(require rackunit
         "NumberWordConverter.rkt")

(check-equal? (number->words 1) 
              "one"
              "single number: one")

(check-equal? (number->words 2) 
              "two"
              "single number: two")

(check-equal? (number->words 20) 
              "twenty"
              "tens: twenty")

(check-equal? (number->words 21) 
              "twenty one"
              "complex tens: twenty one")

(check-equal? (number->words 11) 
              "eleven"
              "irregular numbers: eleven")

(check-equal? (number->words 12) 
              "twelve"
              "irregular numbers: twelve")

(check-equal? (number->words 100) 
              "one hundred"
              "hundreds: one hundred")

"**********************"
"*** Tests Complete ***"
"**********************"