inferKind(X):-
    diagram_fact(kind,X,"ellipse"),
    assertz(das_fact(kind,X,"ellipse")).
inferKind(X):-
    diagram_fact(edge,X,1),
    assertz(das_fact(kind,X,"edge")).
inferKind(X):-
    diagram_fact(vertex,X,1),
    \+diagram_fact(kind,X,"ellipse"),
    \+diagram_fact(kind,X,"edge"),
    assertz(das_fact(kind,X,"rectangle")).

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

inferColor(X):-
    diagram_fact(fillColor,X,"#d5e8d4"),
    assertz(das_fact(color,X,"green")).
inferColor(X):-
    diagram_fact(fillColor,X,"#fff2cc"),
    assertz(das_fact(color,X,"yellow")).
inferColor(X):-
    diagram_fact(fillColor,X, "#f8cecc"),
    assertz(das_fact(color,X,"red")).
inferColor(X):-
    diagram_fact(fillColor,X,"#9673A6"),
    assertz(das_fact(color,X,"purple")).
inferColor(X):-
    diagram_fact(vertex,X,1),
    \+hasColor(X),
    assertz(das_fact(color,X,"-")).

hasColor(X):-
    diagram_fact(fillColor,X,"#d5e8d4").
hasColor(X):-
    diagram_fact(fillColor,X,"#fff2cc").
hasColor(X):-
    diagram_fact(fillColor,X, "#f8cecc").
hasColor(X):-
    diagram_fact(fillColor,X,"#9673A6").


inferLayer1:-
    bagof(X,inferKind(X),_),
    bagof(X,inferBB(X),_),
    bagof(X,
	  (diagram_fact(vertex,X,1),inferColor(X)),
	  _),
    bagof(X,inferName(X),_).

displayLayer1Facts:-
    forall(das_fact(kind,X,K),format("das_fact(kind,~w,~q).~n",[X,K])),
    forall(das_fact(bbL,X,K),format("das_fact(bbL,~w,~q).~n",[X,K])),
    forall(das_fact(bbT,X,K),format("das_fact(bbT,~w,~q).~n",[X,K])),
    forall(das_fact(bbR,X,K),format("das_fact(bbR,~w,~q).~n",[X,K])),
    forall(das_fact(bbB,X,K),format("das_fact(bbB,~w,~q).~n",[X,K])),
    forall(das_fact(name,X,K),format("das_fact(name,~w,~q).~n",[X,K])),
    forall(das_fact(color,X,K),format("das_fact(color,~w,~q).~n",[X,K])).

layer1:-
    inferLayer1,
    displayLayer1Facts.


    
