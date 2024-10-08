! (bind! py-rnd (py-atom random))
! (bind! randint (py-dot py-rnd randint))

(: random-bool (-> Boolean))
(= (random-bool)
    (if (== (randint 0 1) 0)
        True
        False))

(: gen-bool-expr (-> Number Expression))
(= (gen-bool-expr $depth)
    (if (== $depth 0)
        (random-bool)
        (let* (($op (randint 0 2))
               ($sub-depth (- $depth 1)))
            (case $op (
                (0 (AND (gen-bool-expr $sub-depth) (gen-bool-expr $sub-depth)))
                (1 (OR (gen-bool-expr $sub-depth) (gen-bool-expr $sub-depth)))
                (2 (NOT (gen-bool-expr $sub-depth)))
            ))
        )
    )
)

! (gen-bool-expr 2)
