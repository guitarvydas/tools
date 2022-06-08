% a rectangle "contains" a port if that port intersects one boundary of the rect

containsport(R,C):-
    rightsideinsideBB(C,R).
containsport(R,C):-
    leftsideinsideBB(C,R).
containsport(R,C):-
    bottomsideinsideBB(C,R).
containsport(R,C):-
    topsideinsideBB(C,R).

rightsideinsideBB(Circle,Rect):-
    das_fact(bbL,Rect,Rl),   das_fact(bbT,Rect,Rt),   das_fact(bbR,Rect,Rr),   das_fact(bbB,Rect,Rb),
    das_fact(bbL,Circle,Cl), das_fact(bbT,Circle,Ct), das_fact(bbR,Circle,Cr), das_fact(bbB,Circle,Cb),
    Cl =< Rl,
    Ct >= Rt, Ct =< Rb,
    Cr >= Rl, Cr =< Rr,
    Cb >= Rt, Cb =< Rb.
leftsideinsideBB(Circle,Rect):-
    das_fact(bbL,Rect,Rl),   das_fact(bbT,Rect,Rt),   das_fact(bbR,Rect,Rr),   das_fact(bbB,Rect,Rb),
    das_fact(bbL,Circle,Cl), das_fact(bbT,Circle,Ct), das_fact(bbR,Circle,Cr), das_fact(bbB,Circle,Cb),
    Cl =< Rr, Cl >= Rl,
    Ct >= Rt, Ct =< Rb,
    Cr >= Rr,
    Cb >= Rt, Cb =< Rb.
bottomsideinsideBB(Circle,Rect):-
    das_fact(bbL,Rect,Rl),   das_fact(bbT,Rect,Rt),   das_fact(bbR,Rect,Rr),   das_fact(bbB,Rect,Rb),
    das_fact(bbL,Circle,Cl), das_fact(bbT,Circle,Ct), das_fact(bbR,Circle,Cr), das_fact(bbB,Circle,Cb),
    Cl >= Rl, Cl =< Rr,
    Ct =< Rt,
    Cr >= Rl, Cr =< Rr,
    Cb >= Rt, Cb =< Rb.
topsideinsideBB(Circle,Rect):-
    das_fact(bbL,Rect,Rl),   das_fact(bbT,Rect,Rt),   das_fact(bbR,Rect,Rr),   das_fact(bbB,Rect,Rb),
    das_fact(bbL,Circle,Cl), das_fact(bbT,Circle,Ct), das_fact(bbR,Circle,Cr), das_fact(bbB,Circle,Cb),
    Cl >= Rl, Cl =< Rr,
    Ct >= Rt, Ct =< Rb,
    Cr >= Rl, Cr =< Rr,
    Cb >= Rb.
