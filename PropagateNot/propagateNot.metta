> (: propagateNot (-> $expr $expr))
(= (propagateNot $expr)
    (case (if (or (== (car-atom $expr) AND)
                  (== (car-atom $expr) OR))
              ( (car-atom $expr) (cdr-atom $expr))
              $expr
            )
        (
            ( (AND $args) (let $val (if (== $args ()) ()
                        (collapse(propagateNot(superpose $args)))) (cons-atom AND $val)))

            ( (OR $args) (let $val (if (== $args ()) ()
                        (collapse(propagateNot(superpose $args)))) (cons-atom OR $val)))

            ( (NOT $a)
                (case $a
                    (
                        ( (AND $args) (let $val (if (== $args ()) ()
                                    (collapse(propagateNot(superpose $args)))) (cons-atom OR $val)))
                        ( (OR $args) (let $val (if (== $args ()) ()
                                    (collapse(propagateNot(superpose $args)))) (cons-atom AND $val)))
                        ( (NOT $b) (propagateNot $b))
                        ($symbol (NOT $symbol))
                    )
                )
            )
            ($symbol (if (== (get-metatype $expr) Expression)
                        (if (== $expr ()) ()
                            (collapse(propagateNot(superpose $args))))
                            $expr
                        )
            )
        )
    )
)

! (propagateNot (AND a b (NOT (NOT b))))
! (propagateNot (NOT c))
! (propagateNot (NOT (NOT c)))
! (propagateNot (AND (NOT (NOT a)) b (OR a b (NOT 6))))
