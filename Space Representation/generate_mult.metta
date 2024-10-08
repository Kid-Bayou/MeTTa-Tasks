! (bind! py-rnd (py-atom random))
! (bind! randint (py-dot py-rnd randint))

(: random-bool (-> Boolean))
(= (random-bool)
    (if (== (randint 0 1) 0)
        True
        False))

(: gen-multiple-bool-expr (-> Number Number Expression))
(= (gen-multiple-bool-expr $depth $num)
    (if (or (== $num 0)
        (== $depth 0))
        (gen-bool-expr 2)
        (let* (($head (gen-bool-expr $depth))
                ($tail (gen-multiple-bool-expr $depth (- $num 1))))

         (cons-atom $head $tail))

    )
        
)
        
(: gen-bool-expr (-> Number Expression))
(= (gen-bool-expr $depth)
    (if (== $depth 0)
        (random-bool)
        (let* (($op (randint 0 2))
               ($sub-depth (- $depth 1))
               ($num-bools (+ 2 (randint 0 3))))
            (case $op (
                (0 (AND (gen-bool-expr $sub-depth) (gen-multiple-bool-expr $sub-depth $num-bools)))
                (1 (OR (gen-bool-expr $sub-depth) (gen-multiple-bool-expr $sub-depth $num-bools)))
                (2 (NOT (gen-bool-expr $sub-depth)))
            ))
        )
    )
)

! (gen-bool-expr 2)
