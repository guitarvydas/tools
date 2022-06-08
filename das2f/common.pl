:- use_module(library(http/json)).

common:-
    consult("fb.pl"),
    consult("shapes.pl"),
    consult("onSameDiagram.pl"),
    consult("inside.pl"),
    consult("names.pl"),
    consult("ports.pl").


