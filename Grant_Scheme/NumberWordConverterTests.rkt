#lang racket

(require rackunit
         "NumberWordConverter.rkt")

(check-equal? (number->words 123) 
              "hi mum"
              "numbers just come out as 'hi mum' for some reason")


"**********************"
"*** Tests Complete ***"
"**********************"