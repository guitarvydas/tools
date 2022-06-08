contains(X,Y):-
    diagram_fact(contains,X,Y).
contains(X,Y):-
    completelyInside(Y,X),
    X \= Y,
    \+ diagram_fact(contains,X,Y).
