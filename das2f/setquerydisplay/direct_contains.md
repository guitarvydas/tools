# contains port
## parameters
  R
  E
## imports
    fb
    shapes
    onSameDiagram
    inside
    names
    ports
## setquery
	setof([A,B],das_fact(contains,A,B),All)
	setof([C,D],das_fact(indirect_contains,C,D),Indirect)
	subtract(All,Indirect,Set)
## display
das_fact(contains,${R},${E}).
  
