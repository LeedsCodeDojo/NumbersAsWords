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

(check-equal? (number->words 123) 
              "one hundred twenty three"
              "hundreds: 123")

(check-equal? (number->words 1000) 
              "one thousand"
              "thousands: 1000")

(check-equal? (number->words 1234) 
              "one thousand two hundred thirty four"
              "thousands: 1234")

(check-equal? (number->words 20000) 
              "twenty thousand"
              "ten-thousands: 20000")

(check-equal? (number->words 123456) 
              "one hundred twenty three thousand four hundred fifty six"
              "hundred-thousands: 123456")

(check-equal? (number->words 1234567) 
              "one million two hundred thirty four thousand five hundred sixty seven"
              "millions: 1234567")

"**********************"
"*** Tests Complete ***"
"**********************"