! (import! &self random_utils)

(: gen-literal-expr (-> Number Expression))
(= (gen-literal-expr $depth)
    (if (== $depth 0)
        (random-literal)
        (let* (($op (randint 0 2))
               ($sub-depth (- $depth 1)))
            (case $op (
                (0 (AND (gen-literal-expr $sub-depth) (gen-literal-expr $sub-depth)))
                (1 (OR (gen-literal-expr $sub-depth) (gen-literal-expr $sub-depth)))
                (2 (NOT (gen-literal-expr $sub-depth)))
            ))
        )
    )
)

! (gen-literal-expr 2)
