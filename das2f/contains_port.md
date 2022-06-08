# contains port
## parameters
  R
  E
## imports
    shapes
    onSameDiagram
    inside
    names
    ports
    contains_port
## query
    das_fact(kind,R,rectangle)
    das_fact(kind,E,ellipse)
    containsport(R,E)
## display
das_fact(contains,${R},${E}).
  
