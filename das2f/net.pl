directlyconnected(A,B):-
    diagram_fact(synonym,A,LA),
    diagram_fact(synonym,B,LB),
    das_fact(kind,A,ellipse),
    das_fact(kind,B,ellipse),
    das_fact(kind,E,edge),
    diagram_fact(source, E, LA),
    diagram_fact(target, E, LB).
connected(A,B):-
    directlyconnected(A,B).
connected(A,B):-
    directlyconnected(A,C),
    directlyconnected(C,B),
    B \= C.
