from numpy import matrix
from numpy import linalg
A=matrix([[4,3],[3,2]])
AI=matrix([[-2,3],[3,-4]])
I=matrix([[1,0],[0,1]])
print "A ----------"
print A
print "Inverse of A ----------"
print AI
print "Identity Matrix --------"
print I
print "A * AI ---------"
print A*AI
#matrix([[1, 0],
#        [0, 1]])

print "solve inverse of A ----------"
AI2=linalg.solve(A,I)
print AI2
#matrix([[-2.,  3.],
#        [ 3., -4.]])

print "A * AI (verify) ---------"
print A*AI
#matrix([[1, 0],
#        [0, 1]])
