

#PROBLEM 3
#P3 Task 1
(declare-const c Int)
(declare-const e Int)
(assert (= (f c e) c))
(assert (= (f e c) c))
(assert (= (f c e) e))
(assert (= (f e c) e))
(assert not (= c e))
(check-sat)

#P3 Task 2
(declare-const i Int)
(declare-const j Int)
(declare-const k Int)
(declare-const e Int)
(declare-fun f (Int Int) Int)
(assert (= (f (f k i) j) (f k (f i j))))
(assert (= (f k i) e))
(assert (= (f i j) e))
(assert (= (f k i) e))
(assert (= (f k e) k))
(assert (= (f e j) j))
(assert not (= j k))
(check-sat)
