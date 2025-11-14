!(import! &self ../data-structures/map)

;; Testcase Map.insert
!(test (Map.insert (4 d) (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d) NilMap)))))
!(test (Map.insert (1 e) (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) (ConsMap (1 e) (ConsMap (2 b) (ConsMap (3 c) NilMap))))
!(test (Map.insert (2 b) (ConsMap (1 a) (ConsMap (3 c) (ConsMap (4 d) NilMap)))) (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d) NilMap)))))

;;Testcase for Map.insertCounter
!(test (Map.insertCounter 1 (ConsMap (1 1) (ConsMap (2 2) (ConsMap (3 3) NilMap)))) (ConsMap (1 2) (ConsMap (2 2) (ConsMap (3 3) NilMap))))
!(test (Map.insertCounter 1 NilMap) (ConsMap (1 1) NilMap))
!(test (Map.insertCounter 2 (ConsMap (2 2) (ConsMap (3 3) NilMap))) (ConsMap (2 3) (ConsMap (3 3) NilMap)))
!(test (Map.insertCounter 7 (ConsMap (1 1) (ConsMap (2 2) (ConsMap (3 3) NilMap)))) (ConsMap (1 1) (ConsMap (2 2) (ConsMap (3 3) (ConsMap (7 1) NilMap)))))

;; Testcase for Map.remove
!(test ((Map.remove 5 (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) (Error 5 "not found")))
!(test (Map.remove 1 (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d) NilMap))))) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d) NilMap))))
!(test (Map.remove 2 (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) (ConsMap (1 a) (ConsMap (3 c) NilMap)))


;; Testcase for Map.contains
!(test (Map.contains 5 (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) False)
!(test (Map.contains 1 (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d) NilMap))))) True)
!(test (Map.contains 2 (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) True)

;; Testcase for Map.checkValue
!(test (Map.checkValue a (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) True)
!(test (Map.checkValue d (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d) NilMap))))) True)
!(test (Map.checkValue f (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) False)

;; Testcase for Map.getByKey
!(test (Map.getByKey 1 (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) a)
!(test (Map.getByKey 3 (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) c)
!(test (Map.getByKey 10 (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d)(ConsMap (5 e) (ConsMap (6 f) (ConsMap (7 g) (ConsMap (8 h) (ConsMap (9 i) NilMap)))))))))) (Error 10 "not found"))

;; Testcase for Map.keys
!(test (Map.keys (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) (Cons 1 (Cons 2 (Cons 3 Nil))))
!(test (Map.keys (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d)(ConsMap (5 e) (ConsMap (6 f) (ConsMap (7 g) (ConsMap (8 h) (ConsMap (9 i) NilMap)))))))))) (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 (Cons 8 (Cons 9 Nil))))))))))
!(test (Map.keys NilMap) Nil)

;; Testcase for Map.values
!(test (Map.values (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) (Cons a (Cons b (Cons c Nil))))
!(test (Map.values (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d)(ConsMap (5 e) (ConsMap (6 f) (ConsMap (7 g) (ConsMap (8 h) (ConsMap (9 i) NilMap)))))))))) (Cons a (Cons b (Cons c (Cons d (Cons e (Cons f (Cons g (Cons h (Cons i Nil))))))))))
!(test (Map.values NilMap) Nil)

;; Testcase for Map.items
!(test (Map.items (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) (Cons (1 a) (Cons (2 b) (Cons (3 c) Nil))))
!(test (Map.items (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d)(ConsMap (5 e) (ConsMap (6 f) (ConsMap (7 g) (ConsMap (8 h) (ConsMap (9 i) NilMap)))))))))) (Cons (1 a) (Cons (2 b) (Cons (3 c) (Cons (4 d) (Cons (5 e) (Cons (6 f) (Cons (7 g) (Cons (8 h) (Cons (9 i) Nil))))))))))
!(test (Map.items NilMap) Nil)

;; Testcase for Map.length
!(test (Map.length (ConsMap (3 c) NilMap)) 1)
!(test (Map.length (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))) 3)
!(test (Map.length (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d)(ConsMap (5 e) (ConsMap (6 f) (ConsMap (7 g) (ConsMap (8 h) (ConsMap (9 i) NilMap)))))))))) 9)


;; a test where a given element of the map needs to be compared with a custom comparator function without mknods

; Helper: Check if a list is sorted with a comparator
(= (isSortedBy $cmp Nil) True)
(= (isSortedBy $cmp (Cons $x Nil)) True)
(= (isSortedBy $cmp (Cons $a (Cons $b $tail)))
   (and ($cmp $a $b) (isSortedBy $cmp (Cons $b $tail))))

; Main validation: Map keys respect custom comparator
; Helper: Check if a list is sorted with a comparator
(= (isSortedBy $cmp Nil) True)
(= (isSortedBy $cmp (Cons $x Nil)) True)
(= (isSortedBy $cmp (Cons $a (Cons $b $tail)))
   (and ($cmp $a $b) (isSortedBy $cmp (Cons $b $tail))))


!(test 
  (let* (
      ($result (collapse (isSortedBy <= (Map.keys (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap)))))))
      ($uni (unique-atom $result))) 
      $uni) 
  (True))

!(test 
  (let* (
      ($result (collapse (isSortedBy >= (Map.keys (ConsMap (3 c) (ConsMap (2 b) (ConsMap (1 a) NilMap)))))))
      ($uni (unique-atom $result))) 
      $uni) 
  (True))

!(test 
  (let* (
      ($result (collapse (isSortedBy <= (Map.keys (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) (ConsMap (4 d) (ConsMap (5 e) NilMap)))))))))
      ($uni (unique-atom $result))) 
      $uni) 
  (True))