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

set_indirect_contains(Set):-
    setof([G,H],indirect_contains(G,H),Set).

set_contains(Set):-
    setof([J,K],contains(J,K),Set).

direct_contains(Direct):-
    set_indirect_contains(Indirect),
    set_contains(All),
    subtract(All,Indirect,Direct).

contains(X,Y):-
    diagram_fact(contains,X,Y).
