! (import! &self random_utils)

(: gen-multiple-literal-expr (-> Number Number Expression))
(= (gen-multiple-literal-expr $depth $num)
    (if (== $num 0)
        ()
        (let* (($head (gen-literal-expr $depth))
                ($tail (gen-multiple-literal-expr $depth (- $num 1))))

         (cons-atom $head $tail))

    )
        
)
        
(: gen-literal-expr (-> Number Expression))
(= (gen-literal-expr $depth)
    (if (== $depth 0)
        (random-literal)
        (let* (($op (randint 0 2))
               ($sub-depth (- $depth 1))
               ($num-literals (+ 2 (randint 0 4))))
            (case $op (
                (0 (let $val (gen-multiple-literal-expr $sub-depth $num-literals) (cons-atom AND $val)))
                (1 (let $val (gen-multiple-literal-expr $sub-depth $num-literals) (cons-atom OR $val)))
                (2 (NOT (gen-literal-expr $sub-depth)))
            ))
        )
    )
)

! (gen-literal-expr 2)