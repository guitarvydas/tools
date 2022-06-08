:- use_module(library(http/json)).
?- consult(fb).
?- consult("./shapes.pl").
?- consult("./onSameDiagram.pl").
?- consult("./inside.pl").
?- consult("./ports.pl").
?- consult("./contains.pl").
query_helper(ID,Name):- 
    diagram_fact(vertex,ID,_),
    diagram_fact(value,ID,Name),
    true.
query:-
    bagof([ID,Name],query_helper(ID,Name),Bag),
    json_write(user_output,Bag,[width(128)]).
