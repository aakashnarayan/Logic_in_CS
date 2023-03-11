from z3 import *
#Problem 2a
l1 = Real('l1')
l2 = Real('l2')
u1 = Real('u1')
u2 = Real('u2')
z = Real('z')
w = Real('w')

s = Then('qe', 'smt').solver()
formula = ForAll(z, Implies(And(l1 < z, z < u1, l2 < z, z < u2), Exists(w, l1 < w, w < u1, l2 < w, w < u2, Not(w == z))))
s.add(formula)
print(s.check())

#Problem 2b
l1 = Real('l1')
l2 = Real('l2')
l3 = Real('l3')
l4 = Real('l4')

u1 = Real('u1')
u2 = Real('u2')
u3 = Real('u3')
u4 = Real('u4')

a = Real('a')
b = Real('b')
c = Real('c')
d = Real('d')
e = Real('e')
f = Real('f')

s = Solver()

one = Exists(a, And(l1 < a, l2 < a, a < u1, a < u2))
two = Exists(b, And(l1 < b, l3 < b, b < u1, b < u3))
three = ForAll(c, Not(And(l1 < c, l4 < c, c < u1, c < u4)))
four = ForAll(d, Not(And(l2 < d, l3 < d, d < u2, d < u3)))
five = Exists(e, And(l2 < e, l4 < e, e < u2, e < l4))
six = Exists(f, And(l3 < f, l4 < f, f < u3, f < u4))

formula = And(one, two, three, four, five, six)
s.add(formula)
print(s.check())
