(define matriz (vector (make-vector 4) (make-vector 4) (make-vector 4) (make-vector 4)))
(vector-set! (vector-ref matriz 0) 0 0)
(vector-set! (vector-ref matriz 0) 1 2)
(vector-set! (vector-ref matriz 0) 2 2)
(vector-set! (vector-ref matriz 0) 3 0)

(vector-set! (vector-ref matriz 1) 0 0)
(vector-set! (vector-ref matriz 1) 1 8)
(vector-set! (vector-ref matriz 1) 2 2)
(vector-set! (vector-ref matriz 1) 3 0)

(vector-set! (vector-ref matriz 2) 0 0)
(vector-set! (vector-ref matriz 2) 1 2)
(vector-set! (vector-ref matriz 2) 2 2)
(vector-set! (vector-ref matriz 2) 3 0)

(vector-set! (vector-ref matriz 3) 0 2)
(vector-set! (vector-ref matriz 3) 1 4)
(vector-set! (vector-ref matriz 3) 2 4)
(vector-set! (vector-ref matriz 3) 3 0)
(define (getRandomPos)
    (values (random 4) (random 4))
)
(define (setNewNumber)
    (define-values (x y) (values 0 0))
    (set!-values (x y) (getRandomPos))
    (cond
        [()]
    )
)



;matriz
(define (opera-pares n n2)
    (cond ((= n n2)
        (values (* n base) 0)
    )
    (else
        (values n n2)
    )
    )
)
(define base 2)
(define (movimientoArriba)
    (define col_cont 0)
    (define row_cont 0)
    (define val1 0)
    (define val2 0)
    (define-values (n1 n2) (values 0 0))
    (define (ciclo1)
    (cond
        [(< row_cont 3)
            (set! val1 (vector-ref (vector-ref matriz row_cont) col_cont))
            (set! val2 (vector-ref (vector-ref matriz (+ row_cont 1)) col_cont))
            (set!-values (n1 n2) (opera-pares val1 val2))
            (cond 
                [(and (> n1 val1) (= n2 0))
                    (vector-set! (vector-ref matriz row_cont ) col_cont n1)
                    (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont n2)
                    (cond 
                        [(and (= row_cont 2) (= (vector-ref (vector-ref matriz (- row_cont 1)) col_cont) 0))
                            (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont n1)
                            (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                            (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont 0)
                            ;mover el resultado a la primer posicion si es cero
                            (cond
                                [(= (vector-ref (vector-ref matriz (- row_cont 2)) col_cont) 0)
                                    (vector-set! (vector-ref matriz (- row_cont 2) ) col_cont n1)
                                    (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont 0)
                                    (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                                    (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont 0)
                                ]
                            )
                        ]
                    )
                    (set! row_cont (+ row_cont 2))
                    (ciclo1)
                ]
                [(and (= n1 val1) (= n2 val2))
                    (cond 
                    
                    [(and (= n1 0) (> n2 0))
                        (vector-set! (vector-ref matriz row_cont) col_cont n2)
                        (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont 0)
                        (cond 
                            [(and (= row_cont 2) (= (vector-ref (vector-ref matriz (- row_cont 1)) col_cont) 0))
                                (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont n2)
                                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                                (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont 0)
                                (cond 
                                    [(= (vector-ref (vector-ref matriz (- row_cont 2)) col_cont) 0)
                                        (vector-set! (vector-ref matriz (- row_cont 2) ) col_cont n2)
                                        (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont 0)
                                        (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                                        (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont 0)
                                    ]
                                )

                            ]
                        )
                        (set! row_cont (+ row_cont 2))
                        (ciclo1)
                    ]
                    [(and (= n2 0) (> n1 0))
                        (cond 
                            [(and (= row_cont 2) (= (vector-ref (vector-ref matriz (- row_cont 1)) col_cont) 0))
                                (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont n1)
                                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                                (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont 0)
                                (cond 
                                    [(= (vector-ref (vector-ref matriz (- row_cont 2)) col_cont) 0)
                                        (vector-set! (vector-ref matriz (- row_cont 2) ) col_cont n1)
                                        (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont 0)
                                        (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                                        (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont 0)
                                    ]
                                )
                            ]
                        )
                        (set! row_cont (+ row_cont 2))
                        (ciclo1)
                    ]
                    [(and (= n2 val2) (= n1 val1))
                        (cond 
                            [(and (= row_cont 2) (= (vector-ref (vector-ref matriz (- row_cont 1)) col_cont) 0))
                                (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont n1)
                                (vector-set! (vector-ref matriz row_cont ) col_cont n2)
                                (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont 0)
                                (cond
                                    [(= (vector-ref (vector-ref matriz (- row_cont 2)) col_cont) 0)
                                        (vector-set! (vector-ref matriz (- row_cont 2) ) col_cont n1)
                                        (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont n2)
                                        (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                                        (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont 0)
                                    ]
                                )
                            ]
                        )
                        (set! row_cont (+ row_cont 2))
                        (ciclo1)
                    ]
                        
                    )
                ]
            )
            ;(set! row_cont (+ row_cont 1))
            ;(ciclo1)
        ]
    )
        
    )
    (define (ciclo2)
        (cond [(< col_cont 4)
            (ciclo1)
            (set! row_cont 0)
            (set! col_cont (+ col_cont 1))  
            matriz
            (ciclo2)
        ])        
    )
    (ciclo2)
)

(define (movimientoAbajo)
    (define col_cont 0)
    (define row_cont 3)
    (define val1 0)
    (define val2 0)
    (define-values (n1 n2) (values 0 0))
    (define (ciclo1)
    (cond
        [(> row_cont 0)
            (set! val1 (vector-ref (vector-ref matriz row_cont) col_cont))
            (set! val2 (vector-ref (vector-ref matriz (- row_cont 1)) col_cont))
            (set!-values (n1 n2) (opera-pares val1 val2))
            (cond 
                [(and (> n1 val1) (= n2 0))
                    (vector-set! (vector-ref matriz row_cont ) col_cont n1)
                    (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont n2)
                    (cond 
                        [(and (= row_cont 1) (= (vector-ref (vector-ref matriz (+ row_cont 1)) col_cont) 0))
                            (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont n1)
                            (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                            (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont 0)

                            (cond
                                [(= (vector-ref (vector-ref matriz (+ row_cont 2)) col_cont) 0)
                                    (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont n1)
                                    (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                                    (vector-set! (vector-ref matriz (- row_cont 1)) col_cont 0)
                                ]
                            )
                        ]
                    )
                    (set! row_cont (- row_cont 2))
                    (ciclo1)
                ]
                [(and (= n1 val1) (= n2 val2))
                    (cond 
                    
                    [(and (= n1 0) (> n2 0))
                        (vector-set! (vector-ref matriz row_cont) col_cont n2)
                        (vector-set! (vector-ref matriz (- row_cont 1)) col_cont 0)
                        (cond 
                            [(and (= row_cont 1) (= (vector-ref (vector-ref matriz (+ row_cont 1)) col_cont) 0))
                                (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont n2)
                                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                                (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont 0)                                
                            ]
                            
                        )
                        (set! row_cont (- row_cont 2))
                        (ciclo1)
                    ]
                    [(and (= n2 0) (> n1 0))
                        (cond 
                            [(and (= row_cont 1) (= (vector-ref (vector-ref matriz (+ row_cont 1)) col_cont) 0))
                                (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont n1)
                                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                                (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont 0)
                            ]
                        )
                        (set! row_cont (- row_cont 2))
                        (ciclo1)
                    ]
                    [(and (= n2 val2) (= n1 val1))
                        (cond 
                            [(and (= row_cont 1) (= (vector-ref (vector-ref matriz (+ row_cont 1)) col_cont) 0))
                                (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont n1)
                                (vector-set! (vector-ref matriz row_cont ) col_cont n2)
                                (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont 0)
                            ]
                        )
                        (set! row_cont (- row_cont 2))
                        (ciclo1)
                    ]
                        
                    )
                ]
            )
            ;(set! row_cont (+ row_cont 1))
            ;(ciclo1)
        ]
    )
        
    )
    (define (ciclo2)
        (cond [(< col_cont 4)
            (ciclo1)
            (set! row_cont 3)
            (set! col_cont (+ col_cont 1))  
            matriz
            (ciclo2)
        ])        
    )
    (ciclo2)
)

(movimientoArriba)
matriz
(movimientoAbajo)
matriz
(movimientoAbajo)
matriz
(movimientoAbajo)
matriz
(movimientoArriba)
matriz
