;Creación de la matriz
(define matriz (vector (make-vector 4) (make-vector 4) (make-vector 4) (make-vector 4)))
;Darle valor a uno de los miembros de la matriz
(vector-set! (vector-ref matriz 0) 0 2)
(vector-set! (vector-ref matriz 0) 1 3)
;Extraer el valor de la matriz
(vector-ref (vector-ref matriz 0) 0)
;ver la matriz completa 
matriz