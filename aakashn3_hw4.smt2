#PROBLEM 1 (in python)
#P1 Task 2
from z3 import *
a = Real('a')
b = Real('b')
r = Real('r')
s = Real('s')


s = Solver()
#Add bounds between 0 and 1
s.add(And(Or(0 < a, 0 == a), Or(1 > a, 1 == a), Or(0 < b, 0 == b), Or(1 > b, 1 == b), Or(0 < r, 0 == r), Or(1 > r, 1 == r), Or(0 < s, 0 == s), Or(1 > s, 1 == s)))
def f(i,j):
    return 100*i*j - 40*i - 30*j + 60

fpart1 = ForAll(r, f(a, b) > f(r, b))
fpart2 = ForAll(s, f(a, b) < f(a, s))
formula = Exists(a, Exists(b, And(fpart1, fpart2)))
s.add(formula)
print(s.check())

#P1 Task 3
from z3 import *
a = Real('a')
b = Real('b')
r = Real('r')
s = Real('s')
#indicate the various payoffs. fb indicates payoff when R expects f and S plays b, and so on
ff = Real('ff')
fb = Real('fb')
bf = Real('bf')
bb = Real('bb')


s = Solver()
#Add bounds between 0 and 1
s.add(And(Or(0 < a, 0 == a), Or(1 > a, 1 == a), Or(0 < b, 0 == b), Or(1 > b, 1 == b), Or(0 < r, 0 == r), Or(1 > r, 1 == r), Or(0 < s, 0 == s), Or(1 > s, 1 == s)))
def f(i,j, ff, fb, bf, bb):
    return i*(ff*j + fb*(1-j)) + (1-i)*(bf*j + bb*(1-j))

fpart1 = ForAll(r, f(a, b, ff, fb, bf, bb) > f(r, b, ff, fb, bf, bb))
fpart2 = ForAll(s, f(a, b, ff, fb, bf, bb) < f(a, s, ff, fb, bf, bb))
formula = Exists(a, Exists(b, And(fpart1, fpart2)))
s.add(formula)
print(s.check())

#PROBLEM 3 (in z3 encoding)
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
