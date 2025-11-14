!(import! &self ../data-structures/ordered-multimap)

;; Testcase MultiMap.insert
!(test (MultiMap.insert (4 d) (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d) NilMMap)))))
!(test (MultiMap.insert (2 b) NilMMap) (ConsMMap (2 b)  NilMMap))
!(test (MultiMap.insert (1 e) (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap))) ==) (ConsMMap (1 e) (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))))
!(test (MultiMap.insert (2 e) (ConsMMap (1 a) NilMMap) >) (ConsMMap (2 e) (ConsMMap (1 a) NilMMap)))
!(test (MultiMap.insert (1 b) (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap))) <) (ConsMMap (1 a) (ConsMMap (1 b) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))))

;; Testcase for MultiMap.findOne
!(test (MultiMap.findOne 1 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) a)
!(test (MultiMap.findOne 2 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (2 c) NilMMap)))) b)
!(test (MultiMap.findOne 6 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) (Error 6 "not found"))

;; Testcase for MultiMap.findAll
!(test (MultiMap.findAll 1 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) (Cons a Nil))
!(test (MultiMap.findAll 2 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (2 c)(ConsMMap (2 b) (ConsMMap (2 d) NilMMap)))))) (Cons b (Cons c (Cons b (Cons d Nil)))))
!(test (MultiMap.findAll 6 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) Nil)

;; Testcase for MultiMap.removeOne
!(test (MultiMap.removeOne 5 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) (Error 5 "not found"))
!(test (MultiMap.removeOne 1 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d) NilMMap))))) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d) NilMMap))))
!(test (MultiMap.removeOne 2 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (2 c) NilMMap)))) (ConsMMap (1 a) (ConsMMap (2 c) NilMMap)))

;; Testcase for MultiMap.removeAll
!(test (MultiMap.removeAll 5 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap))))
!(test (MultiMap.removeAll 1 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d) NilMMap))))) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d) NilMMap))))
!(test (MultiMap.removeAll 2 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (2 c) NilMMap)))) (ConsMMap (1 a) NilMMap))


;; Testcase for MultiMap.contains
!(test (MultiMap.contains 5 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) False)
!(test (MultiMap.contains 1 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d) NilMMap))))) True)
!(test (MultiMap.contains 2 (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) True)

;; Testcase for MultiMap.checkValue
!(test (MultiMap.checkValue a (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) True)
!(test (MultiMap.checkValue d (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d) NilMMap))))) True)
!(test (MultiMap.checkValue f (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) False)

;; Testcase for Map.values
!(test (MultiMap.values (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) (Cons a (Cons b (Cons c Nil))))
!(test (MultiMap.values (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d)(ConsMMap (5 e) (ConsMMap (6 f) (ConsMMap (7 g) (ConsMMap (8 h) (ConsMMap (9 i) NilMMap)))))))))) (Cons a (Cons b (Cons c (Cons d (Cons e (Cons f (Cons g (Cons h (Cons i Nil))))))))))
!(test (MultiMap.values NilMMap) Nil)

;; Testcase for MultiMap.keys
!(test (MultiMap.keys (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) (Cons 1 (Cons 2 (Cons 3 Nil))))
!(test (MultiMap.keys (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d)(ConsMMap (5 e) (ConsMMap (6 f) (ConsMMap (7 g) (ConsMMap (8 h) (ConsMMap (9 i) NilMMap)))))))))) (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 (Cons 6 (Cons 7 (Cons 8 (Cons 9 Nil))))))))))
!(test (MultiMap.keys NilMMap) Nil)

;; Testcase for MultiMap.items
!(test (MultiMap.items (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) (Cons (1 a) (Cons (2 b) (Cons (3 c) Nil))))
!(test (MultiMap.items (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d)(ConsMMap (5 e) (ConsMMap (6 f) (ConsMMap (7 g) (ConsMMap (8 h) (ConsMMap (9 i) NilMMap)))))))))) (Cons (1 a) (Cons (2 b) (Cons (3 c) (Cons (4 d) (Cons (5 e) (Cons (6 f) (Cons (7 g) (Cons (8 h) (Cons (9 i) Nil))))))))))
!(test (MultiMap.items NilMMap) Nil)


;; Testcase for MultiMap.length
!(test (MultiMap.length (ConsMMap (3 c) NilMMap)) 1)
!(test (MultiMap.length (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) 3)
!(test (MultiMap.length (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) (ConsMMap (4 d)(ConsMMap (5 e) (ConsMMap (6 f) (ConsMMap (7 g) (ConsMMap (8 h) (ConsMMap (9 i) NilMMap)))))))))) 9)

;; Testcase for MultiMap.checkElement
!(test (MultiMap.checkElement (1 a) (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) True)
!(test (MultiMap.checkElement (3 a) (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))) False)

;; Testcase for MultiMap.equals
!(test (MultiMap.equals (ConsMMap (1 a) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))
(ConsMMap (2 b) (ConsMMap (1 a) (ConsMMap (3 c) NilMMap)))) True)
!(test (MultiMap.equals (ConsMMap (1 b) (ConsMMap (2 b) (ConsMMap (3 c) NilMMap)))
(ConsMMap (2 b) (ConsMMap (1 a) (ConsMMap (3 c) NilMMap)))) False)