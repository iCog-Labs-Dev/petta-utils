!(import! &self ../data-structures/list-methods)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; Functions from general-helper.metta ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(= (isEven $x) (== (% $x 2) 0))

(= (isOdd $x) (not (isEven $x)))

(= (>>= ($ctor $x) ($ctor $y))(>= $x $y))
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test cases for List.foldr
!(test (List.foldr + 0 (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))) 10)
!(test (List.foldr * 1 (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))) 24)
!(test (List.foldr - 0 (Cons 10 (Cons 5 (Cons 2 Nil)))) 7)


;; Test cases for List.foldr
!(test (List.foldl + 0 (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))) 10)
!(test (List.foldl * 1 (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))) 24)
!(test (List.foldl - 0 (Cons 10 (Cons 5 (Cons 2 Nil)))) 7)

;; Test cases for List.sum
!(test (List.sum (Cons 1 (Cons 2 (Cons 3 (Cons 2 (Cons 3 Nil)))))) 11)
!(test (List.sum (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))) 10)
!(test (List.sum (Cons 3.0 (Cons 4.0 (Cons 5.0 (Cons 5.0 (Cons 5.0 (Cons 5.0 (Cons 4.0 (Cons 5.0 (Cons 4.0 (Cons 4.0 (Cons 4.0 (Cons 5.0 (Cons 5.0 (Cons 4.0 (Cons 5.0 (Cons 5.0 (Cons 5.0 (Cons 4.0 (Cons 5.0 (Cons 5.0 (Cons 5.0 (Cons 5.0 (Cons 5.0 (Cons 4.0 (Cons 5.0 (Cons 4.0 Nil))))))))))))))))))))))))))) 119)

;; Test cases for List.append
!(test (List.append 3 (Cons 1 (Cons 2 Nil))) (Cons 1 (Cons 2 (Cons 3 Nil))))
!(test (List.append 4 (Cons 2 (Cons 3 Nil))) (Cons 2 (Cons 3 (Cons 4 Nil))))
!(test (List.append 10 (Cons 5 (Cons 6 (Cons 7 Nil)))) (Cons 5 (Cons 6 (Cons 7 (Cons 10 Nil)))))

;; Test cases for List.getByIdx
!(test (List.getByIdx (Cons 1 (Cons 2 (Cons 3 Nil))) 0) 1)
!(test (List.getByIdx (Cons 10 (Cons 20 (Cons 30 Nil))) 1) 20)
!(test (List.getByIdx (Cons 100 (Cons 200 (Cons 300 Nil))) 0) 100)
!(test (List.getByIdx (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 (Cons 8 (Cons 9 (Cons 10 (Cons 11 (Cons 12 (Cons 13 (Cons 14 (Cons 15 (Cons 16 (Cons 17 (Cons 18 (Cons 19 (Cons 20 Nil)))))))))))))))))))) 0) 1)

;; Test cases for List.insert
!(test (List.insert 2 (Cons 1 (Cons 3 (Cons 4 Nil)))) (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))))
!(test (List.insert 5 (Cons 2 (Cons 3 (Cons 7 Nil)))) (Cons 2 (Cons 3 (Cons 5 (Cons 7 Nil)))))
!(test (List.insert 1 (Cons 2 (Cons 3 (Cons 4 Nil)))) (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))))

;; Test cases for List.sort
!(test (List.sort (Cons 3 (Cons 2 (Cons 3 Nil)))) (Cons 2 (Cons 3 (Cons 3 Nil))))
!(test (List.sort (Cons 5 (Cons 3 (Cons 1 (Cons 4 Nil))))) (Cons 1 (Cons 3 (Cons 4 (Cons 5 Nil)))))
!(test (List.sort (Cons 9 (Cons 7 (Cons 8 (Cons 6 Nil))))) (Cons 6 (Cons 7 (Cons 8 (Cons 9 Nil)))))


;; Test cases for List.length
!(test (List.length (Cons 1 (Cons 2 (Cons 3 Nil)))) 3)
!(test (List.length (Cons 10 (Cons 20 (Cons 30 (Cons 40 Nil))))) 4)
!(test (List.length (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 (Cons 8 (Cons 9 (Cons 10 (Cons 11 (Cons 12 (Cons 13 (Cons 14 (Cons 15 (Cons 16 (Cons 17 (Cons 18 (Cons 19 (Cons 20 Nil))))))))))))))))))))) 20)

;; Test cases for List.map
!(test (List.map isEven (Cons 1 (Cons 2 (Cons 3 Nil)))) (Cons False (Cons True (Cons False Nil))))
!(test (List.map isOdd Nil) Nil)


;; Test cases for List.filter
!(test (List.filter isEven (Cons 1 (Cons 2 (Cons 3 Nil)))) (Cons 2 Nil))
!(test (List.filter isOdd (Cons 2 (Cons 2 (Cons 4 Nil)))) Nil)
!(test (List.filter isOdd Nil) Nil)


;; Test cases for List.listToExpr
!(test (List.listToExpr Nil) ())
!(test (List.listToExpr (Cons 1 (Cons 3 (Cons 4 Nil)))) (1 3 4))

;; Test cases for List.max
!(test (List.max >= (Cons 2 (Cons 5 (Cons 1 Nil)))) 5)
!(test (List.max >= (Cons 42 Nil)) 42)
!(test (List.max >>= (Cons (mkSize 1) (Cons (mkSize 3) (Cons (mkSize 2) Nil)))) (mkSize 3))

;; Test cases for List.contains
!(test (List.contains 2 (Cons 1 (Cons 2 (Cons 3 Nil)))) True)
!(test (List.contains 4 (Cons 1 (Cons 2 (Cons 3 Nil)))) False)
!(test (List.contains 1 Nil) False)

;; Test cases for List.replaceAt
!(test (List.replaceAt (Cons 1 (Cons 2 (Cons 3 Nil))) 0 9) (Cons 9 (Cons 2 (Cons 3 Nil))))
!(test (List.replaceAt (Cons 1 (Cons 2 (Cons 3 Nil))) 1 9) (Cons 1 (Cons 9 (Cons 3 Nil))))
!(test (List.replaceAt Nil 0 5) Nil)

;; Test case for List.prepend
!(test (List.prepend 0 Nil) (Cons 0 Nil))
!(test (List.prepend 0 (Cons 1 Nil)) (Cons 0 (Cons 1 Nil)))
!(test (List.prepend 0 (Cons 1 (Cons 2 Nil))) (Cons 0 (Cons 1 (Cons 2 Nil))))

;; Test case of List.index
!(test (List.index Nil A) -1)
!(test (List.index (Cons A (Cons B (Cons C Nil))) A) 0)
!(test (List.index (Cons B (Cons C Nil)) A) -1)
!(test (List.index (Cons D (Cons B (Cons C (Cons A Nil)))) A) 3)
!(test (List.index (Cons D (Cons A (Cons C Nil))) A) 1)
!(test (List.index (Cons D (Cons A (Cons A Nil))) A) 1)

;; Test case for List.head
!(test (List.head Nil) (Error Nil EmptyList))
!(test (List.head (Cons 1 (Cons 2 Nil))) 1)

;; Test case for List.tail
!(test (List.tail Nil) Nil)
!(test (List.tail (Cons 1 (Cons 2 Nil))) (Cons 2 Nil))

;; Test case for List.sub
!(test (List.sub (Cons 1 (Cons 3 Nil)) (Cons 0 (Cons 3 Nil))) (Cons 1 (Cons 0 Nil)))
!(test (List.sub (Cons 1 (Cons 3 Nil)) (Cons 0 (Cons 3 (Cons 2 Nil)))) (Error (Cons 2 Nil) LenghtOfListNotEqual))

;; Test case for List.zip
!(test (List.zip (Cons 1 (Cons 2 Nil)) (Cons A (Cons B Nil))) (Cons (1 A) (Cons (2 B) Nil)))
!(test (List.zip (Cons False (Cons True Nil)) (Cons A (Cons B Nil))) (Cons (False A) (Cons (True B) Nil)))
!(test (List.zip (Cons False (Cons True Nil)) (Cons A Nil)) (Cons (False A) Nil))
!(test (List.zip (Cons False Nil) (Cons A (Cons A (Cons B Nil)))) (Cons (False A) Nil))

;; Test case for List.zipWith
!(test (List.zipWith == (Cons 1 (Cons 2 Nil)) (Cons A (Cons B Nil))) (Cons False (Cons False Nil)))
!(test (List.zipWith == (Cons False (Cons True Nil)) (Cons A (Cons B Nil))) (Cons False (Cons False Nil)))
!(test (List.zipWith == (Cons False (Cons True Nil)) (Cons A Nil)) (Cons False Nil))
!(test (List.zipWith == (Cons False Nil) (Cons A (Cons A (Cons B Nil)))) (Cons False Nil))

;; Test case for List.drop
!(test (List.drop 5 (Cons A (Cons B Nil))) Nil)
!(test (List.drop 1 (Cons A (Cons B Nil))) (Cons B Nil))
!(test (List.drop 2 (Cons A (Cons B (Cons C Nil)))) (Cons C Nil))

;; Test case for List.flatten
!(test (List.flatten (Cons (Cons 1 Nil) (Cons (Cons 2 Nil) Nil))) (Cons 1 (Cons 2 Nil)))
!(test (List.flatten (Cons (Cons 1 Nil) (Cons (Cons 2 (Cons 3 Nil)) Nil))) (Cons 1 (Error (Cons 2 (Cons 3 Nil)) "Can't be flattened")))

;; Test case for List.repeat
!(test (List.repeat 0 0) Nil)
!(test (List.repeat 3 0) (Cons 0 (Cons 0 (Cons 0 Nil))))

;; Test cases for List.concat
!(test (List.concat (Cons 1 (Cons 2 Nil)) (Cons 3 (Cons 4 Nil))) (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))))
!(test (List.concat (Cons 5 (Cons 6 (Cons 7 Nil))) (Cons 8 Nil)) (Cons 5 (Cons 6 (Cons 7 (Cons 8 Nil)))))
!(test (List.concat Nil (Cons 10 (Cons 11 (Cons 12 Nil)))) (Cons 10 (Cons 11 (Cons 12 Nil))))