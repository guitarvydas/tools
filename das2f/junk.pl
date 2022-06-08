:- use_module(library(http/json)).
?- consult(fb).
?- consult("./shapes.pl").
?- consult("./onSameDiagram.pl").
?- consult("./inside.pl").
?- consult("./names.pl").
?- consult("./ports.pl").
?- consult("./contains.pl").

cond0a(Edge,SourceContainer,TargetContainer):-
    diagram_fact(source,Edge,SourceLongID),
    diagram_fact(synonym,SourceID,SourceLongID),
    diagram_fact(target,Edge,TargetLongID),
    diagram_fact(synonym,TargetID,TargetLongID),
    das_fact(direct_contains,SourceContainer,SourceID),
    das_fact(direct_contains,TargetContainer,TargetID).

cond0b(SourceContainer,TargetContainer,Uber):-
    das_fact(  direct_contains,Uber,TargetContainer  ),das_fact(  direct_contains,Uber,SourceContainer).

cond0c(SourceContainer,TargetContainer,UberTarget):-
( das_fact(  direct_contains,UberTarget,TargetContainer  ),das_fact(  direct_contains,SourceContainer,UberTarget  ) ).

cond0d(SourceContainer,TargetContainer,UberSource):-
    ( das_fact(  direct_contains,UberSource,SourceContainer  ),das_fact(  direct_contains,TargetContainer,UberSource  ) ).

cond0e(SourceContainer,TargetContainer,UberSource):-
    ( das_fact(  direct_contains,UberSource,SourceContainer  ),das_fact(  direct_contains,TargetContainer,UberSource  ) ).

%% ,
%% true)->Passed=true ; Passed=false).


