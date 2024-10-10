! (import! &self random_utils)

(: gen-multiple-bool-expr (-> Number Number Expression))
(= (gen-multiple-bool-expr $depth $num)
    (if (== $num 0)
        ()
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
               ($num-bools (+ 2 (randint 0 4))))
            (case $op (
                (0 (let $val (gen-multiple-bool-expr $sub-depth $num-bools) (cons-atom AND $val)))
                (1 (let $val (gen-multiple-bool-expr $sub-depth $num-bools) (cons-atom OR $val)))
                (2 (NOT (gen-bool-expr $sub-depth)))
            ))
        )
    )
)

! (gen-bool-expr 2)