# view0c
## query
    consult(common),
	common,
	consult(layer3),
	bagof([X,Y],
		das_fact(contains,X,Y),
	Bag),
    json_write(user_output,Bag,[width(128)])
## display
	(Contains)
    [[${Contains}]]
	
