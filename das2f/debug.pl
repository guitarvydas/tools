:- use_module(library(http/json)).


debug1:-
    debug1b.

debug1b:-
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(values),
    consult(names),
    bagof([Name, Kind, Clr, L,T,R,B, V,Syn,Val],
	  (
	      ( das_fact(kind,V,"edge"),
		Kind = "edge",
		Val  = "-",
		L = "-", T = "-", R = "-", B = "-", Clr = "-", Syn = "-",
		Name = "-"
	      )
	      ;
	      (
		  diagram_fact(vertex,V,1)
		  %,Val="-"
		  ,das_fact(color,V,Clr)
		  ,das_fact(bbL,V,L)
		  ,das_fact(bbT,V,T)
		  ,das_fact(bbR,V,R)
		  ,das_fact(bbB,V,B)
		  ,das_fact(kind,V,Kind)
		  %,diagram_fact(value,V,Long),sub_string(Long,0,1,_,Val)
		  ,diagram_fact(value,V,Val)
		  ,diagram_fact(synonym,V,Syn)
		  ,nameof(V,Name)
	          ,format("~q ~w ~w (~w,~w,~w,~w) ~w ~w ~s~n",[Name, Kind, Clr, L,T,R,B, V,Syn,Val])
	      )
	  ) ,_),
    %json_write(user_output,Bag,[width(256)]),
    nl.

debug2b:-
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(names),
    bagof([contains, Parent, Child, ParentID, ChildID],
	  (
	      (
		  das_fact(contains,ParentID,ChildID),
		  nameof(ParentID,Parent),
		  Child = "?1"
	      )
	  ;
	      (
		  das_fact(contains,ParentID,ChildID),
		  Parent = "?2",
		  Child = "?2"
              )
	  ) ,Bag),
    json_write(user_output,Bag),
    nl.
debug2a:-
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(names),
    bagof([name, ID, Name],
	  das_fact(name,ID,Name)
	  ,Bag),
    json_write(user_output,Bag),
    nl.

debug2z:-
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(names),
    bagof([F,ID,O],
	  (
	      ( ID = cell_13,diagram_fact(synonym,ID,Syn),diagram_fact(F,Syn,O) )
	  ;
	      ( ID = cell_13,                     diagram_fact(F,ID,O) )
	  ;
	      ( ID = "-", F = "-", O = "-")
	  )
	  ,Bag),
    json_write(user_output,Bag,[width(256)]),
    nl.

debug2:- debug2z.
