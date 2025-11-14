
;; Insert an element to an ordered multiset
(= (OMS.insert $x NilOMS) (ConsOMS $x NilOMS))
(= (OMS.insert $x (ConsOMS $head $tail))
   (if (< $x $head)
       (ConsOMS $x (ConsOMS $head $tail))
       (ConsOMS $head (OMS.insert $x $tail))))

;; Get an element from an ordered multiset by index
(= (OMS.getByIdx $idx NilOMS) (Error (Index out of range)))
(= (OMS.getByIdx $idx (ConsOMS $head $tail)) (if (== $idx 0) $head (OMS.getByIdx (- $idx 1) $tail)))

;; Check if an element is in an ordered multiset
(= (OMS.contains $x NilOMS) False)
(= (OMS.contains $x (ConsOMS $head $tail)) (if (== $x $head) True (OMS.contains $x $tail)))

;; Remove an element from an ordered multiset
(= (OMS.remove $x NilOMS) NilOMS)
(= (OMS.remove $x (ConsOMS $head $tail)) (if (== $x $head) (OMS.remove $x $tail) (ConsOMS $head (OMS.remove $x $tail))))

