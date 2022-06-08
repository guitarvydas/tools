:-dynamic das_fact/3.

inferPort(X):-
    diagram_fact(kind,X,"ellipse"),
    das_fact(color,X,"green"),
    assertz(das_fact(direction,X,input)),
    assertz(das_fact(inputport,X,"-")).
inferPort(X):-
    diagram_fact(kind,X,"ellipse"),
    das_fact(color,X,"yellow"),
    assertz(das_fact(direction,X,output)),
    assertz(das_fact(outputport,X,"-")).
inferPort(X):-
    diagram_fact(kind,X,"ellipse"),
    das_fact(color,X,"red"),
    assertz(das_fact(direction,X,pervasiveinput)),
    assertz(das_fact(pervasiveinputport,X,"-")).
inferPort(X):-
    diagram_fact(kind,X,"ellipse"),
    das_fact(color,X,"purple"),
    assertz(das_fact(direction,X,pervasiveoutput)),
    assertz(das_fact(pervasiveoutputport,X,"-")).

portHasDirection(X):-
    das_fact(inputport,X,_).
portHasDirection(X):-
    das_fact(outputport,X,_).
portHasDirection(X):-
    das_fact(pervasiveinputport,X,_).
portHasDirection(X):-
    das_fact(pervasiveoutputport,X,_).

checkPortHasDirection(X):-
    \+ portHasDirection(X),
    format("FATAL: port ~w does not have a direction~n",[X]).

inferPortDirections:-
    bagof(X,(diagram_fact(kind,X,"ellipse"),inferPort(X)),_).

designRulePortsHaveDirection:-
    forall(diagram_fact(kind,X,"ellipse"),
	   checkPortHasDirection(X)).
