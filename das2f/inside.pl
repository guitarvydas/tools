% succeeds only if B's bounding box is fully inside A's bounding box, inclusively
completelyInside(B,A):-
    das_fact(bbL,B,Bl),
    das_fact(bbT,B,Bt),
    das_fact(bbR,B,Br),
    das_fact(bbB,B,Bb),
    das_fact(bbL,A,Al),
    das_fact(bbT,A,At),
    das_fact(bbR,A,Ar),
    das_fact(bbB,A,Ab),
    Bl >= Al,
    Bl =< Ar,
    Br >= Al,
    Br =< Ar,
    Bt >= At,
    Bt =< Ab,
    Bb >= At,
    Bb =< Ab.
    
