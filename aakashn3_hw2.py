from z3 import *
#Show satisfiability
p = Bool('p')
q = Bool('q')
r = Bool('r')

s = Solver()

one = Or(q, Not(r))
two = Or(Not(p), r)
three = Or(Not(q), r, p)
four = Or(p, q, Not(q))
five = Or(Not(r), q)
six = Or(Not(p), q)
original = And(one, two, three, four, five)
s.add(original)
print(s.check())

#Prove equivalence
p = Bool('p')
q = Bool('q')
r = Bool('r')

one = Or(q, Not(r))
two = Or(Not(p), r)
three = Or(Not(q), r, p)
four = Or(p, q, Not(q))
five = Or(Not(r), q)
six = Or(Not(p), q)
original = And(one, two, three, four, five)
resolved = And(one, two, three, six)

prove(original == resolved)
