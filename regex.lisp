(in-package :regex)
;; TODO: make better flow charts https://asciiflow.com/#/

;; match instructions
;; char literal 'a'
;; >-a-> 

;; concatenation of two sub expressions (implicit)
;; >-|e1|--|e2|-> 

;; one sub expression or another '|'
;;   |-|e1|->
;; >--
;;   |-|e1|->

;; zero or one of sub expression '?'
;;   |-|e1|->
;; >--
;;   |---->

;; zero or more of sub expression '*'
;;   |e1|-|
;; >-o<---|
;;   |------->

;; one or more of sub expression '+'
;;   <----|
;; >-|e1|-o

;; starting with instructions
;; build them up and come up with new ones when needed
