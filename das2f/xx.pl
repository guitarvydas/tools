?- consult(fb).
kind(X,Kind):-
    diagram_fact(cell,X,_),
    (
	diagram_fact(kind,X,"ellipse") -> Kind = "ellipse"
    ;   diagram_fact(edge,X,_)         -> Kind = "edge"
    ;   diagram_fact(root,X,_)         -> Kind = "root"
    ;
	Kind = "rectangle"
    ).

