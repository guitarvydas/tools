direct_contains(Direct):-
    setof([G,H],indirect_contains(G,H),Indirect).
    setof([J,K],contains(J,K),All).
    subtract(All,Indirect,Direct).

indirect_contains(X,Y):-
    contains(X,Y),
    contains(X,A),
    contains(A,Y),
    X \= Y,
    X \= A,
    Y \= A.
indirect_contains(X,Y):-
    contains(X,Y),
    contains(X,A),
    \+ contains(A,Y),
    indirect_contains(A,Y),
    X \= Y,
    X \= A,
    Y \= A.
