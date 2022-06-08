inferName(ID):-
    diagram_fact(vertex,ID,_),
    diagram_fact(value,ID,Name),
    assertz(das_fact(name,ID,Name)).

nameof(ID,Name):-
    das_fact(name,ID,Name),
    \+ das_fact(color,ID,"red").
nameof(ID,"-"):-
    das_fact(name,ID,_),
    das_fact(color,ID,"red").
nameof(ID,ID):-
    \+ das_fact(name,ID,_),
    \+ das_fact(color,ID,"red").
