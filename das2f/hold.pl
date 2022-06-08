
	      valueof(V,ValLong),
	      (sub_string(ValLong,_,32,_,Val),! ; Val = ValLong)

	      	      (fact(synonym,V,Syn),! ; Syn = V)

	      (fact(color,V,Clr) ; \+fact(color,V,_),Clr = "?"),
	      fact(bbL,V,L),
	      fact(bbT,V,T),
	      fact(bbR,V,R),
	      fact(bbB,V,B)
	      
	      (fact(synonym,V,Syn) ; \+fact(synonym,V,_),Syn = V),

debug1a:-
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(values),
    consult(names),
    consult(layer1),
    inferLayer1,
    % fact(cell,^Cell,_) fact(kind,^Cell,^Kind) fact(color,^Cell,^Clr)
    setof([Cell,Kind,Clr],
	  (
              fact(cell,Cell,_),
	      fact(kind,Cell,Kind),
	      (fact(color,Cell,Clr) ; (\+fact(color,Cell,_),Clr = "?") )
	  ) ,Bag),
    json_write(user_output,Bag,[width(64)]),
    nl.
	      
