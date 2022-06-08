inferBB(S):-
    diagram_fact(x,S,X),
    diagram_fact(y,S,Y),
    diagram_fact(width,S,W),
    diagram_fact(height,S,H),
    Right is X+W,
    Bottom is Y+H,
    assertz(das_fact(bbL,S,X)),
    assertz(das_fact(bbT,S,Y)),
    assertz(das_fact(bbR,S,Right)),
    assertz(das_fact(bbB,S,Bottom)).

inferLayer1:-
    bagof(X,inferBB(X),_).

displayLayer1Facts:-
    forall(das_fact(bbL,X,K),format("das_fact(bbL,~w,~q).~n",[X,K])),
    forall(das_fact(bbT,X,K),format("das_fact(bbT,~w,~q).~n",[X,K])),
    forall(das_fact(bbR,X,K),format("das_fact(bbR,~w,~q).~n",[X,K])),
    forall(das_fact(bbB,X,K),format("das_fact(bbB,~w,~q).~n",[X,K])).

layer1:-
    inferLayer1,
    displayLayer1Facts.
