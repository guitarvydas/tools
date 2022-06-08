# view3
## query
    consult(fb),
    consult(shapes),
    consult(values),
    consult(names),
    consult(ports),
    bagof([Parent, Child],
	  (
          das_fact(direct_contains,ParentID,ChildID),
          nameof(ParentID,Parent),
		  nameof(ChildID,Child)
      ),	
	  Bag),
	  json_write(user_output,Bag)
## display
  (Parent Child)
  [[${Parent} direct-contains ${Child}]]

