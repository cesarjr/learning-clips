(defrule startup
=>
  (bind ?lista (create$ ))
  
  (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) tomato))
  (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) lettuce))
  (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) green-salad corn bean))
  
  (progn$(?field ?lista)
     (printout t "field: " ?field " index: " ?field-index crlf)
  )
)

