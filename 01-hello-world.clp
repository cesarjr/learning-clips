; 
; Exemplo clássico de hello world
;



; Você precisa definir um fato que acione a regra
; que irá dizer "Hello world". Em nosso exemplo o
; fato chama-se "say" e o valor "hello-world".
;
; Esta definição acontece através de uma regra sem
; a condição definida. Assim, sempre que o programa for
; executado, a regra obrigatoriamente irá disparar.
(defrule startup
=>
  (assert(say hello-world))
)



; 
(defrule say-hello-world
  (say hello-world)
=>
  (printout t crlf crlf crlf)
  (printout t "Hello World" crlf)
  (printout t crlf crlf crlf)
)