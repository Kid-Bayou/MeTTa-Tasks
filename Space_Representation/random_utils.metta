! (bind! py-rnd (py-atom random))
! (bind! randint (py-dot py-rnd randint))

(: random-bool (-> Boolean))
(= (random-bool)
    (if (== (randint 0 1) 0)
        True
        False))


(: random-literal (-> Expression))
(= (random-literal)
    (case (randint 0 14) (
        (0 A)
        (1 B)
        (2 C)
        (3 D)
        (4 E)
        (5 1)
        (6 2)
        (7 3)
        (8 4)
        (9 5)
        (10 a)
        (11 b)
        (12 c)
        (13 d)
        (14 e)
    ))
)