! (import! &self random_utils)

(: gen-bool-expr (-> Number Expression))
(= (gen-bool-expr $depth)
    (if (== $depth 0)
        (random-bool)
        (let* (($op (randint 0 2))
               ($sub-depth (- $depth 1))
               ($left (gen-bool-expr $sub-depth))
               ($right (gen-bool-expr $sub-depth)))
            (case $op (
                (0 (AND $left $right))
                (1 (OR $left $right))
                (2 (NOT $left))
            ))
        )
    )
)


! (gen-bool-expr 1)
