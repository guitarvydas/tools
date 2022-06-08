# view0
## query
    consult(fb),
    bagof(
	  [Relation,Subject,Object],
	  das_fact(Relation,Subject,Object)
	  ,Bag),
	  json_write(user_output,Bag,[width(128)])
## display
	(Relation Subject Object)
    [[das_fact: ${Relation} ${Subject} ${Object}]]
	
