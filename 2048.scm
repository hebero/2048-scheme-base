(require racket/tcp)

(define (connectServer)
    (newline)
    (display "Ingrese la ip del servidor:")
    (define ip (read-line))
    (display "Conectando...")
    (define-values (in out) (tcp-connect ip 5001))
    (write "P1" out)
    (read )
    (define serverMatriz (read in))
)

(define (menu)
    (newline)
    (display "Ingrese el número del indice para escoger el modo de juego.")
    (newline)
    (display "1.     Jugador vs Jugador")
    (newline)
    (display "2.     Jugador vs Maquina")
)

(define (mainGame)
    (display "Bienvenido a scheme-2048.")
    (newline)
    (display "Creadores: - Daniel Lopez - Tifany Galindo - Heber Orellana -")
    (display "-------------------------------------------------------------")
    (menu)
    (define select (read-line))
    (define (select_men number)
        (cond 
            [(= number 1)
                (connectServer)
            ]
            [(= number 2)
                (display "Muy pronto...")
                (menu)
                (select_men (read-line))
            ]
            [else
                (display "Opcion no reconocida.")
                (menu)
                (select_men (read-line))
            ]
        )
    )
    (select_men select)

)