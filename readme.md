========================
Geral
========================

A linguagem é sensível ao caso.

KB - knowledge base = Programa

Um programa é um conjunto de rules, facts e objects. Quando você salva um programa é isso que você salva.



========================
Facts
========================

(assert)
coloca valores na lista de fatos.
não é possível colocar o mesmo fato mais de uma vez na lista.

(facts)
Lista os fatos

field = é um campo no qual permite guardar um valor. Exemplo: prato para colocar comida. O prato é o field e a comida o valor.
multifield = é uma sequência de fields.

(duck nil) -> o field duck não tem valor
(duck Brian) -> o field duck armazena o valor Brian
(duck-shot Brian Gary Rey) -> os valores são separados por espaço
(duck (shot Brian Gary Rey)) -> field duck contendo field shot com os valores Brian Gary Rey

Tipos de um field: float, integer, symbol, string, external-address, fact-address, instance-name and instance-address 

Adicionando um field a memória:
(assert(duck Brian))

(retract 3) -> Remove o fact 3 da base de conhecimento. # é o fact-index. É aquele número que aparece na esquerda da lista de fatos.
(retract 1 3) -> Remove o fact 1 e o 3
(retract *) -> Remove todos os facts

(clear)
Limpa todos os fatos da memória



========================
Rules
========================

São comparadas a um IF THEN de uma linguagem convencional.

CLIPS> (clear)
CLIPS> (assert (animal-is duck))
<Fact-1>

CLIPS> (defrule duck
 (animal-is duck)
=>
 (assert (sound-is quack)))

 OU
 
(defrule duck (animal-is duck) => (assert (sound-is quack)))

CLIPS>(reset)
CLIPS>(run)
CLIPS>(facts)

(rules) -> lista todas as rules

O nome de uma rule deve ser único.


(defrule duck "Here comes the quack" ; Rule header
 (animal-is duck)                    ; Pattern
=>                                   ; THEN arrow
 (assert (sound-is quack)))          ; Action
 
 Você pode ter vários Patterns e várias Actions.
 
 
 (ppdefrule duck) -> consulta o "código-fonte" de um rule.
 
 Imprimindo coisas:
 (printout t "quack" crlf) -> Imprime "quack" e quebra a linha. Usado em uma action de uma rule.
 
 
 
 
 


========================
Debug
========================

(watch facts) e (unwatch facts)
Lista sempre que um fact for adicionado ou removido da lista.



========================
Links
========================

Download Windows IDE and command line:
http://sourceforge.net/projects/clipsrules/files/CLIPS/6.24/windows_executables_624.zip/download

Download IDE, documments and others:
http://sourceforge.net/projects/clipsrules/files/CLIPS/6.24/


