!(import! &self ../data-structures/ordered-multiset)


;; Testcase OMS.insert
!(test (OMS.insert 4 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))) (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 (ConsOMS 4 NilOMS)))))
!(test (OMS.insert 1 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))) (ConsOMS 1 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))))
!(test (OMS.insert 2 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))) (ConsOMS 1 (ConsOMS 2 (ConsOMS 2 (ConsOMS 3 NilOMS)))))

;; Testcase for OMS.remove
!(test (OMS.remove 5 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))) (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS))))
!(test (OMS.remove 1 (ConsOMS 1 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS))))) (ConsOMS 2 (ConsOMS 3 NilOMS)))
!(test (OMS.remove 2 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))) (ConsOMS 1 (ConsOMS 3 NilOMS)))

;; Testcase for OMS.contains
!(test (OMS.contains 5 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))) False)
!(test (OMS.contains 1 (ConsOMS 1 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS))))) True)
!(test (OMS.contains 2 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))) True)

;; Testcase for OMS.getByIdx
!(test (OMS.getByIdx 0 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))) 1)
!(test (OMS.getByIdx 1 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 NilOMS)))) 2)
!(test (OMS.getByIdx 7 (ConsOMS 1 (ConsOMS 2 (ConsOMS 3 (ConsOMS 4 (ConsOMS 5 (ConsOMS 6 (ConsOMS 7 (ConsOMS 8 (ConsOMS 9 NilOMS)))))))))) 8)