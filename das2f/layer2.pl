
inferLayer2:-
    inferPortDirections.

displayLayer2Facts:-
    forall(das_fact(direction,X,K),format("das_fact(direction,~w,~q).~n",[X,K])),
    forall(das_fact(inputport,X,K),format("das_fact(inputport,~w,~q).~n",[X,K])),
    forall(das_fact(outputport,X,K),format("das_fact(outputport,~w,~q).~n",[X,K])),
    forall(das_fact(pervasiveinputport,X,K),format("das_fact(pervasiveinputport,~w,~q).~n",[X,K])),
    forall(das_fact(pervasiveoutputport,X,K),format("das_fact(pervasiveoutputport,~w,~q).~n",[X,K])).

layer2:-
    inferLayer2,
    displayLayer2Facts.

designRuleLayer2:-
    designRulePortsHaveDirection.



    
    
