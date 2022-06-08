onSameDiagram(A,B):-
    diagramContains(D,A),
    diagramContains(D,B).
    
diagramContains(D,X):-
    diagram_fact(contains,D,X).

