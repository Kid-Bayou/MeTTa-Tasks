
(= (AND $args)
    (if (== $args ())
        True
        (let* ( ($head (car-atom $args))
                ($tail (cdr-atom $args)))
            (if (== $head False)
                False
                (AND $tail)
            )
    )
)
)

(= (OR $args)
    (if (== $args ())
        False
        (let* ( ($head (car-atom $args))
                ($tail (cdr-atom $args)))
            (if (== $head True)
                True
                (OR $tail))
        )
)
)

(= (NOT $x)
    (not (car-atom $x))
)

(= (eval $expr)
    (case (if (or (== (car-atom $expr) AND)
                (== (car-atom $expr) OR)      )
            ( (car-atom $expr) (cdr-atom $expr))
            (if (== (car-atom $expr) NOT)
                (NOT (cdr-atom $expr))
                $expr
            )
    )
(
    (AND $args)
    (OR $args)
    (NOT $args)
    ($args $args)
)))

! (eval (AND True False False))
! (eval (AND True True True))
! (*********)
! (eval (OR True False False))
! (eval (OR False False False))
! (*********)
! (eval (NOT True))
! (eval (NOT False))