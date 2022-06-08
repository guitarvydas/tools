codeof(ID,Code):-
    das_fact(direct_contains,ID,CodeBox),
    das_fact(codebox,CodeBox,Code),
    !.
codeof(_,"").
