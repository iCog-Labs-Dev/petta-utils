!(import! &self utils)
!(test (~= 1 2) True)
!(test (~= 1 1) False)

!(test (~= Something Nothing) True)
!(test (~= Something Something) False)
!(test (~= Something something) True)

;; Tests for the function 'concatTuple'
!(test (concatTuple () (3 4)) (3 4))
!(test (concatTuple (1 2) (3 4)) (1 2 3 4))
!(test (concatTuple (1 2) ()) (1 2))
!(test (concatTuple () ()) ())
;; Tests for the function 'Not'
!(test (Not (Not (Not A))) ((NOT A)))
!(test (Not (Not A)) (A))

;; Tests for the function 'isMember'
!(test (isMember 1 ()) False)
!(test (isMember 2 (2 3 4 5)) True)
!(test (isMember 3 (1 2 4 5)) False)


!(test (setDifference (AND a b (NOT a) c (OR a b)) (a b (NOT a) (OR a b)) ) (AND c))
!(test (setDifference (AND a b (NOT a) c (OR a b)) (a c (NOT c) (NOT a)) ) (AND b (OR a b)))
!(test (setDifference (AND a b (NOT a) c (OR a b)) (a) )  (AND b (NOT a) c (OR a b)))
!(test (setDifference (AND a b (NOT a) c (OR a b v) v) (b (NOT a) v) ) (AND a c (OR a b v)))

;; Tests for findAndReplace function

!(test (findAndReplace A Z (B C A (A B C) F G A)) (B C Z (A B C) F G Z))
!(test (findAndReplace (A B C) Z (B C A (A B C) F G A)) (B C A Z F G A))
!(test (findAndReplace G 1 (B C A (A B C) F G A)) (B C A (A B C) F 1 A))
!(test (findAndReplace Z 1 (B C A (A B C) F G A)) (B C A (A B C) F G A))
!(test (findAndReplace A Z (A C A (A B C) A G A)) (Z C Z (A B C) Z G Z))
!(test (findAndReplace F (A B C) (B C A (A B C) F G A)) (B C A (A B C) (A B C) G A))

;; Tests for until function

;; These are functions used for testing helper functions.

;; It returns True only if the input is zero.

;; Test for dummy function of until
!(test (isZero 1) False)
!(test (isZero 0) True)

!(test (greaterThanTen 8) False)
!(test (greaterThanTen 0) False)
!(test (greaterThanTen 11) True)

!(test (isUnit (foo bar bae)) False)
!(test (isUnit ()) True)

!(test (isSingleAtom (foo bar bae)) False)
!(test (isSingleAtom (foo)) True)
!(test (isSingleAtom ()) False)

!(test (decrement 1) 0)
!(test (decrement -1) -2)
!(test (decrement 100000) 99999)

!(test (increment 1) 2)
!(test (increment -1) 0)
!(test (increment 100000) 100001)

;; Test for actual until function

!(test (until isZero decrement 10) 0)
!(test (until greaterThanTen increment 0) 11)
!(test (until isUnit cdr-atom (foo bar bae)) ())
!(test (until isSingleAtom cdr-atom (foo bar bae)) (bae))

;; Test for map function

