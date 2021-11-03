(in-package :regex)
;; TODO: make better flow charts https://asciiflow.com/#/

#|
MATCH FLOW/OPERATORS

char literal 'a'
>-a-> 

concatenation of two sub expressions (implicit)
>-|e1|--|e2|-> 

one sub expression or another '|'
  |-|e1|->
>--
  |-|e1|->

zero or one of sub expression '?'
  |-|e1|->
>--
  |---->

zero or more of sub expression '*'
  |e1|-|
>-o<---|
  |------->

one or more of sub expression '+'
  <----|
>-|e1|-o
|#

#|
INSTRUCTIONS:
MATCH: made it to the end of a nfa
LITERAL a: match to character a
JUMP n: jump to instruction n
SPLIT a b: execute both a and b
|#

#|
OPERATORS->INSTRUCTIONS
next is the next instruction, this is the current instruction
char -> (lit #\a)
e1e2 -> (e1 e2)
e1|e2 -> (split (e1 (jump next) e2))
e? -> (split e next)
e* -> (split (e (jump this) next))
e+ -> (e (split this next))

EX: r"a+b+"
(a (split
     this       instruction 0
     (b (split
         this   instruction 2
         +match+))))
|#
