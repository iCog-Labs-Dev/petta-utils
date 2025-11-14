!(import! &self ../data-structures/ordered-set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;; From general-helper.metta ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(= (compareNum $num1 $num2)
    (case ((> $num1 $num2) (== $num1 $num2))
        (((True $t) G)
         ((False True) E)
         ((False False) L))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Length of an ordered set
!(test (OS.length NilOS) 0)
!(test (OS.length (ConsOS 1 NilOS)) 1)
!(test (OS.length (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 NilOS))))) 4)

;; Get element by index
!(test (OS.getByIdx 0 NilOS) (Error 0 "empty set/index out of range"))
!(test (OS.getByIdx 3 (ConsOS 3 (ConsOS 2 (ConsOS 1 NilOS)))) (Error 0 "empty set/index out of range"))
!(test (OS.getByIdx 0 (ConsOS 3 (ConsOS 2 (ConsOS 1 NilOS)))) )
!(test (OS.getByIdx 1 (ConsOS 3 (ConsOS 2 (ConsOS 1 NilOS)))) 2)
!(test (OS.getByIdx 2 (ConsOS 3 (ConsOS 2 (ConsOS 1 NilOS)))) 1)

;; Insert numerals into an ordered set 
!(test (OS.insert compareNum 3 (ConsOS 2 (ConsOS 1 NilOS))) (ConsOS 3 (ConsOS 2 (ConsOS 1 NilOS))))
!(test (OS.insert compareNum 3 (ConsOS 5 (ConsOS 1 NilOS))) (ConsOS 5 (ConsOS 3 (ConsOS 1 NilOS))))
!(test (OS.insert compareNum -1 (ConsOS 5 (ConsOS 1 NilOS))) (ConsOS 5 (ConsOS 1 (ConsOS -1 NilOS))))



;; Take N elements from a set
!(test (OS.takeN 0 (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 (ConsOS 0 NilOS)))))) NilOS)
!(test (OS.takeN 1 (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 (ConsOS 0 NilOS)))))) (ConsOS 4 NilOS))
!(test (OS.takeN 2 (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 (ConsOS 0 NilOS)))))) (ConsOS 4 (ConsOS 3 NilOS)))
!(test (OS.takeN 3 (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 (ConsOS 0 NilOS)))))) (ConsOS 4 (ConsOS 3 (ConsOS 2 NilOS))))
!(test (OS.takeN 4 (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 (ConsOS 0 NilOS)))))) (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 NilOS)))))
!(test (OS.takeN 5 (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 (ConsOS 0 NilOS)))))) (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 (ConsOS 0 NilOS))))))
!(test (OS.takeN 6 (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 (ConsOS 0 NilOS)))))) (ConsOS 4 (ConsOS 3 (ConsOS 2 (ConsOS 1 (ConsOS 0 NilOS))))))