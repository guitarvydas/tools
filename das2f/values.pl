valueof(X,Val):-
    diagram_fact(value,X,Val).
valueof(X,Val):-
    \+ diagram_fact(value,X,_),
    Val = "-".
