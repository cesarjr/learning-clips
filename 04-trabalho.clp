(defglobal ?*MO-quantity* = 0)
(defglobal ?*hh-tarefa* = 0)
(defglobal ?*work-load-per-day* = 0)
(defglobal ?*stop-duration* = 0)



(defrule startup
=>
  (assert(show results))
  (assert(ask user-identification))  
)



(defrule ask-user-identification
  (ask user-identification)
=>
  (printout t "Qual eh o seu nome?" crlf)
  (assert(user-name-is (read)))
  
  (printout t crlf)
  
  (assert(ask stop-type))
)



(defrule ask-stop-type
  (ask stop-type)
=>
  (printout t "Selecione a caracteristica da parada:" crlf)
  (printout t crlf)
  (printout t "Parada de [O]portunidade (falta de produto, vetor energetico, setup)" crlf)
  (printout t "Parada exclusiva para [M]anutencao" crlf)
  (printout t crlf)
  (printout t "Qual a sua opcao [O, M]?" crlf)
  (bind ?stop-type (read))
  (bind ?stop-type (upcase ?stop-type))
  
  (printout t crlf)
  
  (
    if (eq ?stop-type O)
	then 
	  (assert(stop-type-is of-oportunity))
	  (assert(ask MO-quantity))
  )
  
  (
    if (eq ?stop-type M)
	then 
	  (assert(stop-type-is exclusive-for-maintenance))
	  (assert(ask LOB-per-hour-value))
  )
  
  ; falta criar uma validacao para aceitar somente 1 ou 2
)



(defrule ask-LOB-per-hour-value
  (ask LOB-per-hour-value)
=>
  (printout t "Qual o valor do LOB/h?" crlf)
  (bind ?LOB-value (read))
  
  (printout t crlf)
  
  (assert(LOB-per-hour-value-is ?LOB-value))
  (assert(ask MO-quantity))
)



(defrule ask-MO-quantity
  (ask MO-quantity)
=>
  (printout t "Qual a quantidade de MO (equipe propria)?" crlf)
  (bind ?*MO-quantity* (read))
  
  (printout t crlf)
  
  (assert(ask work-load-per-day))
)



(defrule ask-work-load-per-day
  (ask work-load-per-day)
=>
  (printout t "Qual a carga horaria de trabalho/dia (equipe propria)?" crlf)
  (bind ?*work-load-per-day* (read))
  
  (printout t crlf)
  
  (assert(ask stop-duration))
)


xxx
(defrule ask-stop-duration
  (ask work-load-per-day)
=>
  (printout t "Qual o tempo estimado da parada (em horas)?" crlf)
  (bind ?*stop-duration* (read))
  
  (printout t crlf)
  
  (assert(ask if-painting-is-required))
)



(defrule ask-if-painting-is-required
  (ask if-painting-is-required)
=>
  (printout t "Os equipamentos necessitam de pintura [S, N]?" crlf)
  (bind ?require-painting (read))
  (bind ?require-painting (upcase ?require-painting))
  
  (printout t crlf)
  
  ; falta criar uma validacao para aceitar somente S ou N
  
  (
    if (eq ?require-painting S)
	then (assert(equipments-require-painting yes))
  )
  
  (assert(ask which-equipments-are-envolved))
)



(defrule ask-which-equipments-are-envolved
  (ask which-equipments-are-envolved)
=>
  (bind ?continue-asking true)
  (while (eq ?continue-asking true)

    (printout t "Selecione os equipamentos para a Parada:" crlf)
	
    (printout t "A - Ventosa" crlf)
    (printout t "B - Desbastador" crlf)
    (printout t "C - Polidora" crlf)
    (printout t "D - Esquadrejador" crlf)
    (printout t crlf)
    (printout t "X - Proxima etapa" crlf)

	(bind ?option (read))
	(bind ?option (upcase ?option))

	(
	  if (eq ?option X)
	  then (bind ?continue-asking false)
	)
	
	(
	  if (eq ?option A)
	  then (assert(equipment-is ventosa))
	)
	(
	  if (eq ?option B)
	  then (assert(equipment-is desbastador))
	)
	(
	  if (eq ?option C)
	  then (assert(equipment-is polidora))
	)
	(
	  if (eq ?option D)
	  then (assert(equipment-is esquadrejador))
	)
  )
)



(defrule ask-services-for-ventosa
  (equipment-is ventosa)
=>
  (bind ?continue-asking true)
  (while (eq ?continue-asking true)

    (printout t crlf)
    (printout t "Selecione os servicos para a Ventosa:" crlf)
	
    (printout t "A - Movimento horizontal" crlf)
    (printout t "B - Movimento vertical" crlf)
    (printout t "C - Bancal de carga" crlf)
    (printout t "D - Linha de descarga" crlf)
    (printout t crlf)
    (printout t "X - Proxima etapa" crlf)

	(bind ?option (read))
	(bind ?option (upcase ?option))

	(
	  if (eq ?option X)
	  then (bind ?continue-asking false)
	)
	
	(
	  if (eq ?option A)
	  then (assert(ventosa-service-is movimento-horizontal))
	)
	(
	  if (eq ?option B)
	  then (assert(ventosa-service-is movimento-vertical))
	)
	(
	  if (eq ?option C)
	  then (assert(ventosa-service-is bancal-de-carga))
	)
	(
	  if (eq ?option D)
	  then (assert(ventosa-service-is bancal-de-descarga))
	)
  )
)



(defrule ask-services-for-desbastador
  (equipment-is desbastador)
=>
  (bind ?continue-asking true)
  (while (eq ?continue-asking true)

    (printout t crlf)
    (printout t "Selecione os servicos para o Desbastador:" crlf)
	
    (printout t "A - Chapa/Tapete/Guias" crlf)
    (printout t "B - Bloco dos rolos" crlf)
    (printout t "C - Sistema de lubrificacao" crlf)
    (printout t "D - Sistema bandejo" crlf)
    (printout t crlf)
    (printout t "X - Proxima etapa" crlf)

	(bind ?option (read))
	(bind ?option (upcase ?option))

	(
	  if (eq ?option X)
	  then (bind ?continue-asking false)
	)
	
	(
	  if (eq ?option A)
	  then (assert(desbastador-service-is chapa-tapete-guias))
	)
	(
	  if (eq ?option B)
	  then (assert(desbastador-service-is bloco-dos-rolos))
	)
	(
	  if (eq ?option C)
	  then (assert(desbastador-service-is sistema-de-lubrificacao))
	)
	(
	  if (eq ?option D)
	  then (assert(desbastador-service-is sistema-bandejo))
	)
  )
)



(defrule ask-services-for-polidora
  (equipment-is polidora)
=>
  (bind ?continue-asking true)
  (while (eq ?continue-asking true)

    (printout t crlf)
    (printout t "Selecione os servicos para a Polidora:" crlf)
	
    (printout t "A - Chapa/Tapete/Guias" crlf)
    (printout t "B - Bloco/Acionamento testas" crlf)
    (printout t "C - Sistema de lubrificacao" crlf)
    (printout t "D - Sistema bandejo" crlf)
    (printout t crlf)
    (printout t "X - Proxima etapa" crlf)

	(bind ?option (read))
	(bind ?option (upcase ?option))

	(
	  if (eq ?option X)
	  then (bind ?continue-asking false)
	)
	
	(
	  if (eq ?option A)
	  then (assert(polidora-service-is chapa-tapete-guias))
	)
	(
	  if (eq ?option B)
	  then (assert(polidora-service-is bloco-acionamento-testas))
	)
	(
	  if (eq ?option C)
	  then (assert(polidora-service-is sistema-de-lubrificacao))
	)
	(
	  if (eq ?option D)
	  then (assert(polidora-service-is sistema-bandejo))
	)
  )
)



(defrule ask-services-for-esquadrejador
  (equipment-is esquadrejador)
=>
  (bind ?continue-asking true)
  (while (eq ?continue-asking true)

    (printout t crlf)
    (printout t "Selecione os servicos para o Esquadrejador:" crlf)
	
    (printout t "A - Chapa/Tapete/Guias" crlf)
    (printout t "B - Troca Mancais" crlf)
    (printout t "C - Empurrador" crlf)
    (printout t "D - Acionamento e polias motriz" crlf)
	(printout t "E - Sistema de abertura" crlf)
    (printout t crlf)
    (printout t "X - Proxima etapa" crlf)

	(bind ?option (read))
	(bind ?option (upcase ?option))

	(
	  if (eq ?option X)
	  then (bind ?continue-asking false)
	)
	
	(
	  if (eq ?option A)
	  then (assert(esquadrejador-service-is chapa-tapete-guias))
	)
	(
	  if (eq ?option B)
	  then (assert(esquadrejador-service-is troca-mancais))
	)
	(
	  if (eq ?option C)
	  then (assert(esquadrejador-service-is empurrador))
	)
	(
	  if (eq ?option D)
	  then (assert(esquadrejador-service-is acionamento-e-polias-motriz))
	)
	(
	  if (eq ?option E)
	  then (assert(esquadrejador-service-is sistema-de-abertura))
	)
  )
)

(defrule ventosa-service-is-movimento-horizontal
  (ventosa-service-is movimento-horizontal)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule ventosa-service-is-movimento-vertical
  (ventosa-service-is movimento-vertical)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule ventosa-service-is-bancal-de-carga
  (ventosa-service-is bancal-de-carga)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule ventosa-service-is-bancal-de-descarga
  (ventosa-service-is bancal-de-descarga)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule desbastador-service-is-chapa-tapete-guias
  (desbastador-service-is chapa-tapete-guias)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule desbastador-service-is-bloco-dos-rolos
  (desbastador-service-is bloco-dos-rolos)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule desbastador-service-is-sistema-de-lubrificacao
  (desbastador-service-is sistema-de-lubrificacao)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule desbastador-service-is-sistema-bandejo
  (desbastador-service-is sistema-bandejo)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule polidora-service-is-chapa-tapete-guias
  (polidora-service-is chapa-tapete-guias)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule polidora-service-is-bloco-acionamento-testas
  (polidora-service-is bloco-acionamento-testas)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule polidora-service-is-sistema-de-lubrificacao
  (polidora-service-is sistema-de-lubrificacao)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule polidora-service-is-sistema-bandejo
  (polidora-service-is sistema-bandejo)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule esquadrejador-service-is-chapa-tapete-guias
  (esquadrejador-service-is chapa-tapete-guias)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule esquadrejador-service-is-troca-mancais
  (esquadrejador-service-is troca-mancais)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule esquadrejador-service-is-empurrador
  (esquadrejador-service-is empurrador)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule esquadrejador-service-is-acionamento-e-polias-motriz
  (esquadrejador-service-is acionamento-e-polias-motriz)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule esquadrejador-service-is-sistema-de-abertura
  (esquadrejador-service-is sistema-de-abertura)
=>
  (bind ?*hh-tarefa* (+ ?*hh-tarefa* 1))
)

(defrule show-results
  (show results)
=>
  (printout t crlf)
  (printout t "Resultado da simulacao:" crlf crlf)

  (printout t "Lista dos equipamentos e servicos selecionados sao:" crlf)
  (progn$ (?fact-address (get-fact-list)) 
    (bind ?fact-name (fact-relation ?fact-address))
    (if (eq equipment-is ?fact-name)
      then
        (progn$ (?fact-slot-name (fact-slot-names ?fact-address))
          (bind ?equipment-name (implode$ (fact-slot-value ?fact-address ?fact-slot-name)))
          (printout t ?equipment-name crlf)
          
          (progn$ (?fact-address2 (get-fact-list)) 
            (bind ?fact-name2 (fact-relation ?fact-address2))
            (bind ?match-name (str-cat ?equipment-name "-service-is"))
            (bind ?match (str-compare ?match-name ?fact-name2))
            (if (eq ?match 0)
              then
                (progn$ (?fact-slot-name2 (fact-slot-names ?fact-address2))
                  (bind ?service-name (implode$ (fact-slot-value ?fact-address2 ?fact-slot-name2)))
                  (printout t "-> " ?service-name crlf)
                )
            )
          )
      )
    )
  )	
  (printout t crlf)

  (bind ?team-per-day (/ 24 ?*work-load-per-day*))
  (bind ?workers-total-per-period (/ ?*hh-tarefa* ?*stop-duration*))
  (bind ?workers-total-per-period (* ?workers-total-per-period ?team-per-day))
  (bind ?external-workers (- ?workers-total-per-period ?*MO-quantity*))
      
  (printout t "A quantidade de MO propria eh: " ?*MO-quantity* crlf)
  (printout t "A quantidade de MO a ser contratada eh: " ?external-workers crlf)
  (printout t "A quantidade total de MO para a Parada eh: " ?*hh-tarefa* crlf)
  (printout t "A carga horaria de trabalho por dia eh: " ?*work-load-per-day* crlf)  
  (printout t "O tempo estimado da parada (em horas) eh: " ?*stop-duration* crlf)  
  (printout t "O regime de trabalho recomendado para as atividades eh:" crlf)
  (printout t "A equipe de pintura deve trabalhar no turno:" crlf)
  (printout t "O tempo estimado da Parada eh de:" crlf)
  (printout t "O custo estimado da Parada eh:" crlf)
)