# view0b
## query
    consult(fb),
    bagof(
	  [Relation,Subject,Object],
	  (
	      das_fact(Relation,Subject,Object),
	      Relation \= bbL,
	      Relation \= bbT,
	      Relation \= bbR,
	      Relation \= bbB
	  ),
	      Bag),
	  json_write(user_output,Bag,[width(128)])
## display
	(Relation Subject Object)
    [[das_fact: ${Relation} ${Subject} ${Object}]]
	
