(require graphics/graphics)
;en las siguientes estamos definiendo la matriz
(define matriz (vector (make-vector 4) (make-vector 4) (make-vector 4) (make-vector 4)))
(vector-set! (vector-ref matriz 0) 0 0)
(vector-set! (vector-ref matriz 0) 1 2)
(vector-set! (vector-ref matriz 0) 2 2)
(vector-set! (vector-ref matriz 0) 3 0)

(vector-set! (vector-ref matriz 1) 0 0)
(vector-set! (vector-ref matriz 1) 1 2)
(vector-set! (vector-ref matriz 1) 2 2)
(vector-set! (vector-ref matriz 1) 3 0)

(vector-set! (vector-ref matriz 2) 0 0)
(vector-set! (vector-ref matriz 2) 1 2)
(vector-set! (vector-ref matriz 2) 2 2)
(vector-set! (vector-ref matriz 2) 3 0)

(vector-set! (vector-ref matriz 3) 0 0)
(vector-set! (vector-ref matriz 3) 1 4)
(vector-set! (vector-ref matriz 3) 2 4)
(vector-set! (vector-ref matriz 3) 3 0)

;esta es la funcion de la interfaz para tomar los valores de las casillas de la matriz . 

(define (interfaz)
(define btn1_state (getVal (vector-ref (vector-ref matriz 0) 0)))
    (define btn2_state (getVal (vector-ref (vector-ref matriz 0) 1)))
    (define btn3_state (getVal (vector-ref (vector-ref matriz 0) 2)))
    (define btn4_state (getVal (vector-ref (vector-ref matriz 0) 3)))
    (define btn5_state (getVal (vector-ref (vector-ref matriz 1) 0)))
    (define btn6_state (getVal (vector-ref (vector-ref matriz 1) 1)))
    (define btn7_state (getVal (vector-ref (vector-ref matriz 1) 2)))
    (define btn8_state (getVal (vector-ref (vector-ref matriz 1) 3)))
    (define btn9_state (getVal (vector-ref (vector-ref matriz 2) 0)))
    (define btn10_state(getVal (vector-ref (vector-ref matriz 2) 1)))
    (define btn11_state(getVal (vector-ref (vector-ref matriz 2) 2)))
    (define btn12_state(getVal (vector-ref (vector-ref matriz 2) 3)))
    (define btn13_state(getVal (vector-ref (vector-ref matriz 3) 0)))
    (define btn14_state(getVal (vector-ref (vector-ref matriz 3) 1)))
    (define btn15_state(getVal (vector-ref (vector-ref matriz 3) 2)))
    (define btn16_state(getVal (vector-ref (vector-ref matriz 3) 3)))


;dibuja la matriz con los nuevos valores
    (open-graphics)
    (define vp (open-viewport "Ejercicio 1" 800 00 ))
    ((draw-viewport vp) "black")
;primera fila
    ((draw-solid-rectangle vp) (make-posn 50 100) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 50 100) 100 100 "black")
    ((draw-string vp) (make-posn 75 125) btn1_state "white")
    ((draw-solid-rectangle vp) (make-posn 150 100) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 150 100) 100 100 "black")
    ((draw-string vp) (make-posn 175 125) btn2_state "white")
    ((draw-solid-rectangle vp) (make-posn 250 100) 100 100 "blue" )
    ((draw-rectangle vp) (make-posn 250 100) 100 100 "black")
    ((draw-string vp) (make-posn 275 125) btn3_state "white")
    ((draw-solid-rectangle vp) (make-posn 350 100) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 350 100) 100 100 "black")
    ((draw-string vp) (make-posn 375 125) btn4_state "white")
;segunda fila
    ((draw-solid-rectangle vp) (make-posn 50 200) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 50 200) 100 100 "black")
    ((draw-string vp) (make-posn 75 225) btn5_state "white")
    ((draw-solid-rectangle vp) (make-posn 150 200) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 150 200) 100 100 "black")
    ((draw-string vp) (make-posn 175 225) btn6_state "white")
    ((draw-solid-rectangle vp) (make-posn 250 200) 100 100 "blue" )
    ((draw-rectangle vp) (make-posn 250 200) 100 100 "black")
    ((draw-string vp) (make-posn 275 225) btn7_state "white")
    ((draw-solid-rectangle vp) (make-posn 350 200) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 350 200) 100 100 "black")
    ((draw-string vp) (make-posn 375 225) btn8_state "white")
;tercera fila
    ((draw-solid-rectangle vp) (make-posn 50 300) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 50 300) 100 100 "black")
    ((draw-string vp) (make-posn 75 325) btn9_state "white")
    ((draw-solid-rectangle vp) (make-posn 150 300) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 150 300) 100 100 "black")
    ((draw-string vp) (make-posn 175 325) btn10_state "white")
    ((draw-solid-rectangle vp) (make-posn 250 300) 100 100 "blue" )
    ((draw-rectangle vp) (make-posn 250 300) 100 100 "black")
    ((draw-string vp) (make-posn 275 325) btn11_state "white")
    ((draw-solid-rectangle vp) (make-posn 350 300) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 350 300) 100 100 "black")
    ((draw-string vp) (make-posn 375 325) btn12_state "white")
;cuarta fila
    ((draw-solid-rectangle vp) (make-posn 50 400) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 50 400) 100 100 "black")
    ((draw-string vp) (make-posn 75 425) btn13_state "white")
    ((draw-solid-rectangle vp) (make-posn 150 400) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 150 400) 100 100 "black")
    ((draw-string vp) (make-posn 175 425) btn14_state "white")
    ((draw-solid-rectangle vp) (make-posn 250 400) 100 100 "blue" )
    ((draw-rectangle vp) (make-posn 250 400) 100 100 "black")
    ((draw-string vp) (make-posn 275 425) btn15_state "white")
    ((draw-solid-rectangle vp) (make-posn 350 400) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 350 400) 100 100 "black")
    ((draw-string vp) (make-posn 375 425) btn16_state "white")

)



;(define contadormov 0);contador de movimientos
(define contadorpuntos 0);contador de puntos

;esta funcion va a barrer la matriz, obtener los valores y agregar los puntos del juego
(define (getVal number)
  (set! contadorpuntos ( + contadorpuntos number))
  (cond
    [(= number 0)
     ""]
    [else
     (number->string number)
     (number->string contadorpuntos)
     ]
   )
)
;aca mostramos la pantalla inicial haciendo el procedimiento de buscar en los vectores y desplegando la matriz
(define (main)
  (define contadormov 0)
  (define contadorpuntos 0)
    (define btn1_state (getVal (vector-ref (vector-ref matriz 0) 0)))
    (define btn2_state (getVal (vector-ref (vector-ref matriz 0) 1)))
    (define btn3_state (getVal (vector-ref (vector-ref matriz 0) 2)))
    (define btn4_state (getVal (vector-ref (vector-ref matriz 0) 3)))
    (define btn5_state (getVal (vector-ref (vector-ref matriz 1) 0)))
    (define btn6_state (getVal (vector-ref (vector-ref matriz 1) 1)))
    (define btn7_state (getVal (vector-ref (vector-ref matriz 1) 2)))
    (define btn8_state (getVal (vector-ref (vector-ref matriz 1) 3)))
    (define btn9_state (getVal (vector-ref (vector-ref matriz 2) 0)))
    (define btn10_state(getVal (vector-ref (vector-ref matriz 2) 1)))
    (define btn11_state(getVal (vector-ref (vector-ref matriz 2) 2)))
    (define btn12_state(getVal (vector-ref (vector-ref matriz 2) 3)))
    (define btn13_state(getVal (vector-ref (vector-ref matriz 3) 0)))
    (define btn14_state(getVal (vector-ref (vector-ref matriz 3) 1)))
    (define btn15_state(getVal (vector-ref (vector-ref matriz 3) 2)))
    (define btn16_state(getVal (vector-ref (vector-ref matriz 3) 3)))



    (open-graphics)
    (define vp (open-viewport "Ejercicio 1" 800 800 ))
    ((draw-viewport vp) "black")
;primera fila
    ((draw-solid-rectangle vp) (make-posn 50 100) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 50 100) 100 100 "black")
    ((draw-string vp) (make-posn 75 125) btn1_state "white")
    ((draw-solid-rectangle vp) (make-posn 150 100) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 150 100) 100 100 "black")
    ((draw-string vp) (make-posn 175 125) btn2_state "white")
    ((draw-solid-rectangle vp) (make-posn 250 100) 100 100 "blue" )
    ((draw-rectangle vp) (make-posn 250 100) 100 100 "black")
    ((draw-string vp) (make-posn 275 125) btn3_state "white")
    ((draw-solid-rectangle vp) (make-posn 350 100) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 350 100) 100 100 "black")
    ((draw-string vp) (make-posn 375 125) btn4_state "white")
;segunda fila
    ((draw-solid-rectangle vp) (make-posn 50 200) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 50 200) 100 100 "black")
    ((draw-string vp) (make-posn 75 225) btn5_state "white")
    ((draw-solid-rectangle vp) (make-posn 150 200) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 150 200) 100 100 "black")
    ((draw-string vp) (make-posn 175 225) btn6_state "white")
    ((draw-solid-rectangle vp) (make-posn 250 200) 100 100 "blue" )
    ((draw-rectangle vp) (make-posn 250 200) 100 100 "black")
    ((draw-string vp) (make-posn 275 225) btn7_state "white")
    ((draw-solid-rectangle vp) (make-posn 350 200) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 350 200) 100 100 "black")
    ((draw-string vp) (make-posn 375 225) btn8_state "white")
;tercera fila
    ((draw-solid-rectangle vp) (make-posn 50 300) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 50 300) 100 100 "black")
    ((draw-string vp) (make-posn 75 325) btn9_state "white")
    ((draw-solid-rectangle vp) (make-posn 150 300) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 150 300) 100 100 "black")
    ((draw-string vp) (make-posn 175 325) btn10_state "white")
    ((draw-solid-rectangle vp) (make-posn 250 300) 100 100 "blue" )
    ((draw-rectangle vp) (make-posn 250 300) 100 100 "black")
    ((draw-string vp) (make-posn 275 325) btn11_state "white")
    ((draw-solid-rectangle vp) (make-posn 350 300) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 350 300) 100 100 "black")
    ((draw-string vp) (make-posn 375 325) btn12_state "white")
;cuarta fila
    ((draw-solid-rectangle vp) (make-posn 50 400) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 50 400) 100 100 "black")
    ((draw-string vp) (make-posn 75 425) btn13_state "white")
    ((draw-solid-rectangle vp) (make-posn 150 400) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 150 400) 100 100 "black")
    ((draw-string vp) (make-posn 175 425) btn14_state "white")
    ((draw-solid-rectangle vp) (make-posn 250 400) 100 100 "blue" )
    ((draw-rectangle vp) (make-posn 250 400) 100 100 "black")
    ((draw-string vp) (make-posn 275 425) btn15_state "white")
    ((draw-solid-rectangle vp) (make-posn 350 400) 100 100 "blue")
    ((draw-rectangle vp) (make-posn 350 400) 100 100 "black")
    ((draw-string vp) (make-posn 375 425) btn16_state "white")

;mostrar boton salir
    ((draw-solid-rectangle vp) (make-posn 600 600) 100 100 "red")
    ((draw-rectangle vp) (make-posn 600 600) 100 100 "white")
    ((draw-string vp) (make-posn 625 625) "salir" "white")

;mostrar dibujo marcador
    ((draw-solid-rectangle vp) (make-posn 600 500) 100 100 "yellow")
    ((draw-rectangle vp) (make-posn 600 500) 100 100 "white")
    ((draw-string vp) (make-posn 600 525) "marcador" "black"(draw-string vp) (make-posn 600 550) contadorpuntos "black")

;boton rendirse
  ((draw-solid-rectangle vp) (make-posn 600 400) 100 100 "white")
  ((draw-rectangle vp) (make-posn 600 400) 100 100 "black")
  ((draw-string vp) (make-posn 650 400) "rendirme" "black")

  ;Eventos para reconocer las teclas arriba, abajo, derecha e izquierda, llama las funciones}
  ;que realizan los movimientos de la matriz.

    (let ciclo
      ((kp (get-key-press vp)))
      (define key (key-value kp))
      (display key)(newline)
      (define tecla1 key)
      (define tecla2 key)

      (cond
        [(or (equal? 'right) (?equal 'left) (?equal 'up) (?equal 'down))
         (set! tecla1 key)
         (ciclo (get-key-press vp))
         ]
        [(and  (not (null? tecla1)) (equal? key 'enter))
          (cond
                [(equal? tecla1 'right)
                 (movimientoderecha)
                 (interfaz)
                 (set! contadormov (+ contadormov 1))
                 (set! tecla1 'menu)
                 (set! tecla2 'menu)
                 (ciclo (get-key-press vp))
                 ]
                [(equal? tecla1 'left)
                 (movimientoizquierda)
                 (interfaz)
                 (set! contadormov (+ contadormov 1))
                 (set! tecla1 'menu)
                 (set! tecla2 'menu)
                 (ciclo (get-key-press vp))
                 ]
                [(equal? tecla1 'up)
                 (movimientoarriba)
                 (interfaz)
                 (set! contadormov (+ contadormov 1))
                 (set! tecla1 'menu)
                 (set! tecla2 'menu)
                 (ciclo (get-key-press vp))
                 ]
                [(equal? tecla1 'down)
                 (movimientoabajo)
                 (interfaz)
                 (set! contadormov (+ contadormov 1))
                 (set! tecla1 'menu)
                 (set! tecla2 'menu)
                 (ciclo (get-key-press vp))
                 ]
                )
        ]
        )
      
      ;-----------------------------------------------------------------------
     
;mostrar cantidad movimientos 
  ((draw-solid-rectangle vp) (make-posn 600 400) 100 100 "green")
  ((draw-rectangle vp) (make-posn 600 400) 100 100 "white")
  ((draw-string vp) (make-posn 650 400) (contadormov  (number->string contadormov)  "black"))
   ((draw-solid-rectangle vp) (make-posn 600 400) 100 100 "black")

 ;opciones para terminar el juego
        (let ciclo
          ((mc (get-mouse-click vp)))
      [(cond
         (< (posn-y (mouse-click-posn mc)) 600) (> (posn-y (mouse-click-posn mc)) 500);click en boton salir
         (< (posn-x (mouse-click-posn mc)) 600) (> (posn-x (mouse-click-posn mc)) 500);click en boton salir
       (display "boton salir");click en boton salir
       (< (posn-y (mouse-click-posn mc)) 600) (> (posn-y (mouse-click-posn mc)) 400);click en boton rendirse
       (< (posn-x (mouse-click-posn mc)) 600) (> (posn-x (mouse-click-posn mc)) 400));click en boton rendirse
(display "boton rendirse");click en boton rendirse
(close-graphics)]
          )
      
(ciclo (get-mouse-click vp)) 
(ciclo (get-key-press vp))
)   
)
(main)