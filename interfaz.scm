(require graphics/graphics)
;en las siguientes estamos definiendo la matriz
(define matriz (vector (make-vector 4) (make-vector 4) (make-vector 4) (make-vector 4)))
(vector-set! (vector-ref matriz 0) 0 0)
(vector-set! (vector-ref matriz 0) 1 0)
(vector-set! (vector-ref matriz 0) 2 0)
(vector-set! (vector-ref matriz 0) 3 0)

(vector-set! (vector-ref matriz 1) 0 0)
(vector-set! (vector-ref matriz 1) 1 0)
(vector-set! (vector-ref matriz 1) 2 0)
(vector-set! (vector-ref matriz 1) 3 0)

(vector-set! (vector-ref matriz 2) 0 0)
(vector-set! (vector-ref matriz 2) 1 0)
(vector-set! (vector-ref matriz 2) 2 0)
(vector-set! (vector-ref matriz 2) 3 0)

(vector-set! (vector-ref matriz 3) 0 0)
(vector-set! (vector-ref matriz 3) 1 0)
(vector-set! (vector-ref matriz 3) 2 0)
(vector-set! (vector-ref matriz 3) 3 0)

(define contadormov 0);contador de movimientos
(define contadorpuntos 0);contador de puntos
(define mayor 0); variable para saber el numero mayor
(define (opera-pares n n2)
  (cond ((= n n2)
         (values (* n 2) 0)
         )
        (else
         (values n n2)
         )
        )
  )


(define (getNewnumber)
 (define ranCol (random 3))
 (define ranRow (random 3))
  (define val (vector-ref (vector-ref matriz ranRow) ranCol))
  (cond
    [(= val 0)
     (define newVal ( * (+ (random 2) 1) base))
     (vector-set! (vector-ref matriz ranRow) ranCol newVal)
     ]
    [else
     (getNewnumber)
    ]
    
    )
)
(define base 2)
(define (movimientoarriba)
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
            [(and (= n2 val2) (= n1 val1) (= row_cont 0))
             (cond 
               [(= row_cont 0)
                (set! val1 (vector-ref (vector-ref matriz (+ row_cont 1)) col_cont))
                (set! val2 (vector-ref (vector-ref matriz (+ row_cont 2)) col_cont))
                (set!-values (n1 n2) (opera-pares val1 val2))
                (cond
                  [(= (vector-ref (vector-ref matriz row_cont) col_cont) 0)
                   (vector-set! (vector-ref matriz row_cont) col_cont val1)
                   (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont val2)
                   (vector-set! (vector-ref matriz (+ row_cont 2)) col_cont (vector-ref (vector-ref matriz (+ row_cont 3)) col_cont)) 
                   (vector-set! (vector-ref matriz (+ row_cont 3)) col_cont 0) 
                   (set! val1 (vector-ref (vector-ref matriz (+ row_cont 1)) col_cont))
                   (set! val2 (vector-ref (vector-ref matriz (+ row_cont 2)) col_cont))
                   (set!-values (n1 n2) (opera-pares val1 val2))
                   (cond 
                      [(and (= val1 0) (> n2 0))
                        
                        (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont n1)
                        (vector-set! (vector-ref matriz (+ row_cont 2)) col_cont n2)
                        (cond
                          [(= (vector-ref (vector-ref matriz row_cont) col_cont) 0)
                           (vector-set! (vector-ref matriz row_cont) col_cont n1)
                           (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont n2)
                           ]
                          )
                      ]
                      [(and (= val1 0) (> val2 0))
                        (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont val2)
                        (vector-set! (vector-ref matriz (+ row_cont 2)) col_cont 0)  
                      ]
                   )
                  ]
                )
                ; (cond 
                ;   [(and (> n1 val1) (= n2 0) )
                ;    (vector-set! (vector-ref matriz row_cont) col_cont n1)
                ;    (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont 0)
                ;    (vector-set! (vector-ref matriz (+ row_cont 2)) col_cont 0)
                ;    ]
                ;   [(and (> n1 val1) (= n2 0))
                ;    (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont n1)
                ;    (vector-set! (vector-ref matriz (+ row_cont 2)) col_cont 0)
                ;    ]
                ;   ) 
                (set! row_cont (+ row_cont 2))
                (ciclo1)
                ]


                            
               )
             (set! row_cont (+ row_cont 2))
             (ciclo1)
             ]
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
             (set! row_cont (+ row_cont 2))
             (ciclo1)
             ]
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

(define (movimientoabajo)
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

                (vector-set! (vector-ref matriz (+ row_cont 2)) col_cont n1)
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
            [(and (= n2 val2) (= n1 val1)(= row_cont 3))
             (cond 
               [(= row_cont 3) 
                (set! val1 (vector-ref (vector-ref matriz (- row_cont 1)) col_cont))
                (set! val2 (vector-ref (vector-ref matriz (- row_cont 2)) col_cont))
                (set!-values (n1 n2) (opera-pares val1 val2))
                (cond 
                  [(and (> n1 val1) (= n2 0) (= (vector-ref (vector-ref matriz row_cont) col_cont) 0) )
                   (vector-set! (vector-ref matriz row_cont) col_cont n1)
                   (vector-set! (vector-ref matriz (- row_cont 1)) col_cont 0)
                   (vector-set! (vector-ref matriz (- row_cont 2)) col_cont 0)
                   ]
                  [(and (> n1 val1) (= n2 0))
                   (vector-set! (vector-ref matriz (- row_cont 1)) col_cont n1)
                   (vector-set! (vector-ref matriz (- row_cont 2)) col_cont 0)
                   ]
                                    
                  )   
                (set! row_cont (- row_cont 2))                             
                (ciclo1)
                ]
                            
                            
               )
             (set! row_cont (- row_cont 2))
             (ciclo1)
             ]
            [(and (= row_cont 1) (= (vector-ref (vector-ref matriz (+ row_cont 1)) col_cont) 0))
             (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont n1)
             (vector-set! (vector-ref matriz row_cont ) col_cont n2)
             (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont 0)
             (cond
               [(= (vector-ref (vector-ref matriz (+ row_cont 2)) col_cont) 0)
                (vector-set! (vector-ref matriz (+ row_cont 2)) col_cont n1)
                (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont n2)
                (vector-set! (vector-ref matriz (- row_cont 1)) col_cont 0)
                (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont 0)
                ]
               )
             (set! row_cont (- row_cont 2))
             (ciclo1)
             ]
            [(and (= n1 0) (> n2 0))
             (vector-set! (vector-ref matriz row_cont) col_cont n2)
             (vector-set! (vector-ref matriz (- row_cont 1)) col_cont 0)
             (cond 
               [(and (= row_cont 1) (= (vector-ref (vector-ref matriz (+ row_cont 1)) col_cont) 0))
                (vector-set! (vector-ref matriz (+ row_cont 1) ) col_cont n2)
                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                (vector-set! (vector-ref matriz (- row_cont 1) ) col_cont 0)     
                (cond
                  [(= (vector-ref (vector-ref matriz (+ row_cont 2)) col_cont) 0)

                   (vector-set! (vector-ref matriz (+ row_cont 2)) col_cont n2)
                   (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                   (vector-set! (vector-ref matriz (- row_cont 1)) col_cont 0)
                   (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont 0)
                   ]
                  )
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
                (cond
                  [(= (vector-ref (vector-ref matriz (+ row_cont 2)) col_cont) 0)

                   (vector-set! (vector-ref matriz (+ row_cont 2)) col_cont n1)
                   (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                   (vector-set! (vector-ref matriz (- row_cont 1)) col_cont 0)
                   (vector-set! (vector-ref matriz (+ row_cont 1)) col_cont 0)
                   ]
                  )
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


(define (movimientoizquierda)
  (define col_cont 0)
  (define row_cont 0)
  (define val1 0)
  (define val2 0)
  (define-values (n1 n2) (values 0 0))
  (define (ciclo1)
    (cond
      [(< col_cont 3)
       (set! val1 (vector-ref (vector-ref matriz row_cont) col_cont))
       (set! val2 (vector-ref (vector-ref matriz  row_cont) (+ col_cont 1)))
       (set!-values (n1 n2) (opera-pares val1 val2))
       (cond 
         [(and (> n1 val1) (= n2 0))
          (vector-set! (vector-ref matriz row_cont ) col_cont n1)
          (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) n2)
          (cond 
            [(and (= col_cont 2) (= (vector-ref (vector-ref matriz row_cont ) (- col_cont 1)) 0))
             (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) n1)
             (vector-set! (vector-ref matriz row_cont ) col_cont 0)
             (vector-set! (vector-ref matriz  row_cont ) (+ col_cont 1) 0)
             (cond
               [(= (vector-ref (vector-ref matriz row_cont) (- col_cont 2)) 0)
                (vector-set! (vector-ref matriz row_cont ) (- col_cont 2) n1)
                (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) 0)
                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) 0)
                ])
             ]
            )
          (set! col_cont (+ col_cont 2))
          (ciclo1)
          ]
         [(and (= n1 val1) (= n2 val2))
          (cond
            ((and (= n2 val2) (= n1 val1) (= col_cont 0))
             (cond
               [(= col_cont 0)
                (set! val1 (vector-ref (vector-ref matriz row_cont) (+ col_cont 1)))
                (set! val2 (vector-ref (vector-ref matriz row_cont) (+ col_cont 2)))
                (set!-values (n1 n2) (opera-pares val1 val2))
                (cond 
                  [(and (> n1 val1) (= n2 0) (= (vector-ref (vector-ref matriz row_cont) col_cont) 0) )
                   (vector-set! (vector-ref matriz row_cont) col_cont n1)
                   (vector-set! (vector-ref matriz row_cont) (+ col_cont 1) 0)
                   (vector-set! (vector-ref matriz row_cont) (+ col_cont 2) 0)
                   ]
                  [(and (> n1 val1) (= n2 0))
                   (vector-set! (vector-ref matriz row_cont) (+ col_cont 1) n1)
                   (vector-set! (vector-ref matriz row_cont) (+ col_cont 2) 0)
                   ]
                  ) 
                (set! col_cont (+ col_cont 2))
                (ciclo1)
                ]
                        

               [(and (= col_cont 2) (= (vector-ref (vector-ref matriz row_cont) (- col_cont 1)) 0))
                (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) n1)
                (vector-set! (vector-ref matriz row_cont ) col_cont n2)
                (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) 0)
                (cond
                  [(= (vector-ref (vector-ref matriz row_cont) (- col_cont 2)) 0)
                   (vector-set! (vector-ref matriz row_cont ) (- col_cont 2) n1)
                   (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) n2)
                   (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                   (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) 0)
                   ]
                  )
                ]
                            
               )
             (set! col_cont (+ col_cont 2))
             (ciclo1)
                    
             )
                    
                    
            [(and (= n1 0) (> n2 0))
             (vector-set! (vector-ref matriz row_cont) col_cont n2)
             (vector-set! (vector-ref matriz row_cont) (+ col_cont 1) 0)
             (cond 
               [(and (= col_cont 2) (= (vector-ref (vector-ref matriz row_cont) (- col_cont 1)) 0))
                (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) n2)
                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) 0)
                (cond 
                  [(= (vector-ref (vector-ref matriz row_cont) (- col_cont 2)) 0)
                   (vector-set! (vector-ref matriz row_cont ) (- col_cont 2) n2)
                   (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) 0)
                   (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                   (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) 0)
                   ]
                  )
                ]
               )
             (set! col_cont (+ col_cont 2))
             (ciclo1)
             ]
            [(and (= n2 0) (> n1 0))
             (cond 
               [(and (= col_cont 2) (= (vector-ref (vector-ref matriz row_cont) (- col_cont 1)) 0))
                (vector-set! (vector-ref matriz  row_cont ) (- col_cont 1) n1)
                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) 0)
                (cond 
                  [(= (vector-ref (vector-ref matriz row_cont) (- col_cont 2)) 0)
                   (vector-set! (vector-ref matriz row_cont ) (- col_cont 2) n1)
                   (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) 0)
                   (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                   (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) 0)
                   ]
                  )
                ]
               )
             (set! col_cont (+ col_cont 2))
             (ciclo1)
             ]
            )
                      
                        
          ]
         )
       ]
           
      )
    )
    
        
    
  (define (ciclo2)
    (cond [(< row_cont 4)
           (ciclo1)
           (set! col_cont 0)
           (set! row_cont (+ row_cont 1))  
           matriz
           (ciclo2)
           ])        
    )
  (ciclo2)
  )

(define (movimientoderecha)
  (define col_cont 3)
  (define row_cont 0)
  (define val1 0)
  (define val2 0)
  (define-values (n1 n2) (values 0 0))
  (define (ciclo1)
    (cond
      [(> col_cont 0)
       (set! val1 (vector-ref (vector-ref matriz row_cont) col_cont))
       (set! val2 (vector-ref (vector-ref matriz row_cont) (- col_cont 1)))
       (set!-values (n1 n2) (opera-pares val1 val2))
       (cond 
         [(and (> n1 val1) (= n2 0))
          (vector-set! (vector-ref matriz row_cont ) col_cont n1)
          (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) n2)
          (cond 
            [(and (= col_cont 1) (= (vector-ref (vector-ref matriz row_cont) (+ col_cont 1)) 0))
             (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) n1)
             (vector-set! (vector-ref matriz row_cont ) col_cont 0)
             (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) 0)
             (cond
               [(= (vector-ref (vector-ref matriz row_cont) (+ col_cont 2)) 0)

                (vector-set! (vector-ref matriz row_cont) (+ col_cont 2) n1)
                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                (vector-set! (vector-ref matriz row_cont) (- col_cont 1) 0)
                ]
               )
             ]
            )
          (set! col_cont (- col_cont 2))
          (ciclo1)
          ]
         [(and (= n1 val1) (= n2 val2))
          (cond 
            [(and (= n2 val2) (= n1 val1)(= col_cont 3))
             (cond 
               [(= col_cont 3) 
                (set! val1 (vector-ref (vector-ref matriz row_cont) (- col_cont 1)))
                (set! val2 (vector-ref (vector-ref matriz row_cont)(- col_cont 2)))
                (set!-values (n1 n2) (opera-pares val1 val2))
                (cond 
                  [(and (> n1 val1) (= n2 0) (= (vector-ref (vector-ref matriz row_cont) col_cont) 0) )
                   (vector-set! (vector-ref matriz row_cont) col_cont n1)
                   (vector-set! (vector-ref matriz row_cont) (- col_cont 1) 0)
                   (vector-set! (vector-ref matriz row_cont) (- col_cont 2) 0)
                   ]
                  [(and (> n1 val1) (= n2 0))
                   (vector-set! (vector-ref matriz row_cont) (- col_cont 1) n1)
                   (vector-set! (vector-ref matriz row_cont) (- col_cont 2) 0)
                   ]
                  )   
                (set! col_cont (- col_cont 2))                             
                (ciclo1)
                ]
               [(and (= col_cont 1) (= (vector-ref (vector-ref matriz row_cont) (+ col_cont 1)) 0))
                (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) n1)
                (vector-set! (vector-ref matriz row_cont ) col_cont n2)
                (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) 0)
                (cond
                  [(= (vector-ref (vector-ref matriz  row_cont) (+ col_cont 2)) 0)
                   (vector-set! (vector-ref matriz  row_cont) (+ col_cont 2) n1)
                   (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) n2)
                   (vector-set! (vector-ref matriz row_cont) (- col_cont 1) 0)
                   (vector-set! (vector-ref matriz row_cont) (+ col_cont 1) 0)
                   ]
                  )
                ]
                            
               )
             (set! col_cont (- col_cont 2))
             (ciclo1)
             ]
            [(and (= n1 0) (> n2 0))
             (vector-set! (vector-ref matriz row_cont) col_cont n2)
             (vector-set! (vector-ref matriz row_cont) (- col_cont 1) 0)
             (cond 
               [(and (= col_cont 1) (= (vector-ref (vector-ref matriz row_cont ) (+ col_cont 1)) 0))
                (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) n2)
                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) 0)
                (cond
                  [(= (vector-ref (vector-ref matriz row_cont ) (+ col_cont 2)) 0)
                                 
                   (vector-set! (vector-ref matriz row_cont) (+ col_cont 2) n2)
                   (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                   (vector-set! (vector-ref matriz row_cont) (- col_cont 1) 0)
                   (vector-set! (vector-ref matriz row_cont)(+ col_cont 1) 0)
                   ]
                  )
                ]
               )
             (set! col_cont (- col_cont 2))
             (ciclo1)
             ]
            [(and (= n2 0) (> n1 0))
        
             (cond 
               [(and (= col_cont 1) (= (vector-ref (vector-ref matriz row_cont) (+ col_cont 1)) 0))
                (vector-set! (vector-ref matriz row_cont ) (+ col_cont 1) n1)
                (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                (vector-set! (vector-ref matriz row_cont ) (- col_cont 1) 0)
                (cond
                  [(= (vector-ref (vector-ref matriz row_cont) (+ col_cont 2)) 0)

                   (vector-set! (vector-ref matriz row_cont) (+ col_cont 2) n1)
                   (vector-set! (vector-ref matriz row_cont ) col_cont 0)
                   (vector-set! (vector-ref matriz row_cont) (- col_cont 1) 0)
                   (vector-set! (vector-ref matriz row_cont)(+ col_cont 1) 0)
                   ]
                  )
                ]
               )
             (set! col_cont (- col_cont 2))
             (ciclo1)
             ]
                                      
                        
            )
          ]
         )
            
       ]
      )
        
    )
  (define (ciclo2)
    (cond [(< row_cont 4)
           (ciclo1)
           (set! col_cont 3)
           (set! row_cont (+ row_cont 1))  
           matriz
           (ciclo2)
           ])        
    )
  (ciclo2)
  )

;esta funcion va a barrer la matriz, obtener los valores, agregar los puntos del juego y guardar el numero mayor
(define (getVal number)
  (set! contadorpuntos ( + contadorpuntos number))
  (cond
    [(= number 0)
     ""]
    [else
     (number->string number)
     ;(number->string contadorpuntos)
     ]
    ))
;(cond
;(< getVal mayor ( set! mayor (getVal)))
;(number->string mayor)
;)
  


;esta es la funcion de la interfaz para tomar los valores de las casillas de la matriz . 
;dibuja la matriz con los nuevos valores
(open-graphics)
(define vp (open-viewport "Ejercicio 1" 800 800 ))
((draw-viewport vp) "black")
(define (interfaz)
  
  ;mostrar cantidad movimientos
  ((draw-solid-rectangle vp) (make-posn 600 200) 100 100 "white")
  ((draw-rectangle vp) (make-posn 600 200) 100 100 "green")
  ((draw-string vp) (make-posn 650 200) "movimientos"  "black" )
  ;((draw-string vp) (make-posn 675 200) contadormov  "black")
  
  ;valor de numero mayor
  ((draw-solid-rectangle vp ) (make-posn 600 300) 100 100 "white")
  ((draw-rectangle vp) (make-posn 600 300) 100 100 "green")
  ((draw-string vp) (make-posn 650 300) "mayor"  "black" )
  ;((draw-string vp) (make-posn 675 300) mayor  "black")

  ;boton rendirse
  ((draw-solid-rectangle vp) (make-posn 600 400) 100 100 "white")
  ((draw-rectangle vp) (make-posn 600 400) 100 100 "red")
  ((draw-string vp) (make-posn 650 400) "rendirme" "black")

  ;mostrar dibujo marcador
  ((draw-solid-rectangle vp) (make-posn 600 500) 100 100 "yellow")
  ((draw-rectangle vp) (make-posn 600 500) 100 100 "white")
  ((draw-string vp) (make-posn 600 525) "marcador" "black")
  ;(draw-string vp) (make-posn 600 550) contadorpuntos "black")
  
  ;mostrar boton salir
  ;((draw-solid-rectangle vp) (make-posn 600 600) 100 100 "red")
  ;((draw-rectangle vp) (make-posn 600 600) 100 100 "white")
  ;((draw-string vp) (make-posn 625 625) "salir" "black")

  
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


  ;mostrar cantidad movimientos
  ((draw-solid-rectangle vp) (make-posn 600 200) 100 100 "white")
  ((draw-rectangle vp) (make-posn 600 200) 100 100 "green")
  ((draw-string vp) (make-posn 650 200) "movimientos"  "black" )
  ;((draw-string vp) (make-posn 675 200) contadormov  "black")
  
  ;valor de numero mayor
  ((draw-solid-rectangle vp ) (make-posn 600 300) 100 100 "white")
  ((draw-rectangle vp) (make-posn 600 300) 100 100 "green")
  ((draw-string vp) (make-posn 650 300) "mayor"  "black" )
  ;((draw-string vp) (make-posn 675 300) mayor  "black")

  ;boton rendirse
  ((draw-solid-rectangle vp) (make-posn 600 400) 100 100 "white")
  ((draw-rectangle vp) (make-posn 600 400) 100 100 "red")
  ((draw-string vp) (make-posn 650 400) "rendirme" "black")

  ;mostrar dibujo marcador
  ((draw-solid-rectangle vp) (make-posn 600 500) 100 100 "yellow")
  ((draw-rectangle vp) (make-posn 600 500) 100 100 "white")
  ((draw-string vp) (make-posn 600 525) "marcador" "black")
  ;((draw-string vp) (make-posn 600 550) contadorpuntos "black")
  
  ;mostrar boton salir
  ((draw-solid-rectangle vp) (make-posn 600 600) 100 100 "red")
  ((draw-rectangle vp) (make-posn 600 600) 100 100 "white")
  ((draw-string vp) (make-posn 625 625) "salir" "black")
  )
;aca mostramos la pantalla inicial haciendo el procedimiento de buscar en los vectores y desplegando la matriz
(define (main)
  (interfaz)
  (define tecla1 'menu)
  (define tecla2 'menu)

  ;Eventos para reconocer las teclas arriba, abajo, derecha e izquierda, llama las funciones}
  ;que realizan los movimientos de la matriz.

  (let cicloM
    ((kp (get-key-press vp)))
    (define key (key-value kp))
    (display key)(newline)
    (set! tecla2 key)

    (cond
      [(or (equal? 'right key) (equal? 'left key) (equal? 'up key) (equal? 'down key))
       (set! tecla1 key)
       (cicloM (get-key-press vp))
       ]
      [(and  (not (equal? tecla1 'menu)) (equal? tecla2 #\return ))
       (cond
         [(equal? tecla1 'right)
          (movimientoderecha)
          (getNewnumber)
          (interfaz)
          (set! contadormov (+ contadormov 1))
          (set! tecla1 'menu)
          (set! tecla2 'menu)
          (cicloM (get-key-press vp))
          ]
         [(equal? tecla1 'left)
          (movimientoizquierda)
          (getNewnumber)
          (interfaz)
          (set! contadormov (+ contadormov 1))
          (set! tecla1 'menu)
          (set! tecla2 'menu)
          (cicloM (get-key-press vp))
          ]
         [(equal? tecla1 'up)
          (movimientoarriba)
          (getNewnumber)
          (interfaz)
          (set! contadormov (+ contadormov 1))
          (set! tecla1 'menu)
          (set! tecla2 'menu)
          (cicloM (get-key-press vp))
          ]
         [(equal? tecla1 'down)
          (movimientoabajo)
          (getNewnumber)
          (interfaz)
          (set! contadormov (+ contadormov 1))
          (set! tecla1 'menu)
          (set! tecla2 'menu)
          (cicloM (get-key-press vp))
          ]
         )
       ;(number->string contadormov)
       ]
      [else
       (cicloM (get-key-press vp))
       ]
      )
      
    ;-----------------------------------------------------------------------
     
    (cicloM (get-key-press vp))
    )

  ;opciones para terminar el juego
  ;(let ciclo
  ; ((mc (get-mouse-click vp)))
  ; (cond
  ;   (< (posn-y (mouse-click-posn mc)) 600) (> (posn-y (mouse-click-posn mc)) 600);click en boton salir
  ;   (< (posn-x (mouse-click-posn mc)) 600) (> (posn-x (mouse-click-posn mc)) 600);click en boton salir
  ;   (display "boton salir");click en boton salir
  ;  (< (posn-y (mouse-click-posn mc)) 600) (> (posn-y (mouse-click-posn mc)) 400);click en boton rendirse
  ;  (< (posn-x (mouse-click-posn mc)) 600) (> (posn-x (mouse-click-posn mc)) 400));click en boton rendirse
  ;(display "boton rendirse");click en boton rendirse
  ;(close-graphics)
  ;)
      

  ;(cicloM (get-key-press vp))
  ;(ciclo (get-mouse-click vp)) 

  )
(getNewnumber)
(getNewnumber)
(main)



;matriz

;-----------------------------------------
;estos son pruebas
;matriz
;(movimientoabajo)
;matriz
;(movimientoabajo)
;matriz
;(movimientoarriba)
;matriz