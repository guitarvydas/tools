# query
    % from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(values),
    consult(names),
    consult(ports),
    bagof([Name, Direction],
	  (
		  diagram_fact(vertex,V,1),
		  isellipse(V),
          nameof(V,Name),
		  das_fact(direction,V,Direction)
      ),	
	  Bag),
	  json_write(user_output,Bag)
# display
  (Name Direction)
  [[${Name} ${Direction}]]
