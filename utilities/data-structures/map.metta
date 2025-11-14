(= (Map.insert ($key $value) NilMap) (ConsMap ($key $value) NilMap))
(= (Map.insert ($key $value) (ConsMap ($curKey $curVal) $tail))
    (if (== $key $curKey)  (ConsMap ($key $value) $tail)
        (if (< $key $curKey)
            (ConsMap ($key $value) (ConsMap ($curKey $curVal) $tail))
            (ConsMap ($curKey $curVal) (Map.insert ($key $value) $tail)))))
;; An insertion function that also allows map to act as a counter

(= (Map.insertCounter $key NilMap) (ConsMap ($key 1) NilMap))
(= (Map.insertCounter $key (ConsMap ($curKey $curVal) $tail))
    (if (== $key $curKey)
        (ConsMap ($curKey (+ $curVal 1)) $tail)
        (if (< $key $curKey)
            (ConsMap ($key 1) (ConsMap ($curKey $curVal) $tail))
            (ConsMap ($curKey $curVal) (Map.insertCounter $key $tail)))))
;; insert an element to a Map using custom comparison functions (equality $ lessthan)
(= (Map.insert ($key $value) NilMap $fEq $fLt) (ConsMap ($key $value) NilMap))
(= (Map.insert ($key $value) (ConsMap ($curKey $curVal) $tail) $fEq $fLt)
    (if ($fEq $key $curKey)  (ConsMap ($key $value) $tail)
        (if ($fLt $key $curKey)
            (ConsMap ($key $value) (ConsMap ($curKey $curVal) $tail))
            (ConsMap ($curKey $curVal) (Map.insert ($key $value) $tail $fEq $fLt)))))

;; Get a value from a Map using key
(= (Map.getByKey $key NilMap) (Error $key "not found"))
(= (Map.getByKey $key (ConsMap ($curKey $curVal) $tail))
    (if (== $key $curKey) $curVal (Map.getByKey $key $tail) ))

;; Get a pair from a Map using index
(= (Map.getByIdx NilMap $i) (Error NilMap "Index out of bounds"))
(= (Map.getByIdx (ConsMap $x $xs) $i)
   (if (== $i 0)
       $x
       (Map.getByIdx $xs (- $i 1))))
;; Check if a key is in the Map
(= (Map.contains $key NilMap) False)
(= (Map.contains $key (ConsMap ($curKey $curVal) $tail))
    (if (== $key $curKey) True (Map.contains $key $tail)))

;; Check if a value in a Map 
(= (Map.checkValue $value NilMap) False)
(= (Map.checkValue $value (ConsMap ($curKey $curVal) $tail))
        (if (== $value $curVal) True (Map.checkValue $value $tail)))

;; Remove a key-value pair from map
(= (Map.remove $key NilMap) (Error $key "not found"))
(= (Map.remove $key (ConsMap ($curKey $curVal) $tail)) 
    (if (== $key $curKey) $tail (ConsMap ($curKey $curVal) (Map.remove $key $tail))))

;; Get the all the values from the map
(= (Map.values NilMap) Nil)
(= (Map.values (ConsMap ($key $value) $tail))
    (Cons $value (Map.values $tail)))
;; Get the all the keys from the map
(= (Map.keys NilMap) Nil)
(= (Map.keys (ConsMap ($key $value) $tail))
    (Cons $key (Map.keys $tail)))
;; Get the all the key value pairs from the map
(= (Map.items NilMap) Nil)
(= (Map.items (ConsMap $pair $tail))
    (Cons $pair (Map.items $tail)))
(Map.items (ConsMap (1 a) (ConsMap (2 b) (ConsMap (3 c) NilMap))))
;; Get the length of the map
(= (Map.length NilMap) 0)
(= (Map.length (ConsMap ($curKey $curVal) $tail)) (+ 1 (Map.length $tail)))
(Map.length (ConsMap (3 c) NilMap))
;; Get the index of a key value pair given a key
(= (Map.find NilMap $k) -1)
(= (Map.find (ConsMap ($k $v) $xs) $k')
   (if (== $k $k')
       0
       (chain (Map.find $xs $k'' ) $targetIdx
                      (if (== $targetIdx -1)
                          $targetIdx
                          (+ 1 $targetIdx)))))



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

