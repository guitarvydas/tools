# contains port
## parameters
  Parent
  Child
## imports
    shapes
    onSameDiagram
    inside
    names
    ports
## query
	das_fact(contains,Parent,X)
	das_fact(contains,X,Child)	
## display
das_fact(indirect_contains,${Parent},${Child}).
  
