(= (AND True True) True)
(= (AND True False) False)
(= (AND False True) False)
(= (AND False False) False)

(= (OR True True) True)
(= (OR True False) True)
(= (OR False True) True)
(= (OR False False) False)

(= (NOT True) False)
(= (NOT False) True)

(= (eval $expr)
    (case $expr (
            ( (AND $x $y) (match &self (AND $x $y) $result))
            ( (OR $x $y) (match &self (OR $x $y) $result))
            ( (NOT $x) (match &self (NOT $x) $result))
            ($x $x)
        ))
)

! (eval (AND True False))
! (eval (OR True False))
! (eval (NOT True))