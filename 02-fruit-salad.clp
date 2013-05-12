(defrule startup
=>
  (assert(menu-of fruits))
)

(defrule menu-of-fruits
  (menu-of fruits)
=>
  (printout t crlf crlf)
  (printout t "Fruits Menu" crlf)
  (printout t "===========" crlf)
  (printout t crlf)
  (printout t "Choose the fruits you want in you salad." crlf)
  (printout t "Inform one each time using the number of the fruit." crlf)
  (printout t crlf)
  (printout t "[A]pple" crlf)
  (printout t "[B]anana" crlf)
  (printout t "[P]ineapple" crlf)
  (printout t "[S]tar fruit" crlf)
  (printout t crlf)
  (printout t "[E] Exit" crlf)
  (printout t crlf)  
  (printout t "What is your choice?" crlf)

  (bind ?continue-asking true)
  (while (eq ?continue-asking true)
    (bind ?option (read))
	(bind ?option (upcase ?option))

	(
	 if (eq ?option E)
	 then (bind ?continue-asking false)
	 else (assert(chosen-fruit-is ?option))
	)
	
  )
)