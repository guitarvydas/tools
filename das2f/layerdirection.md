# layer direction
## parameters
  ID
  Direction
## imports
  shapes
  onSameDiagram
  inside
## forall ID as diagram_fact(kind,ID,"ellipse")
    Direction = cond
      das_fact(color, ID, "green")  input
      das_fact(color, ID, "yellow") output
      das_fact(color, ID, "red")    pervasiveinput
      das_fact(color, ID, "purple") pervasiveoutput
      else                          "?"
## cond design rule
  Direction === "?" 
  FATAL: all ports must have a direction ; port ${ID} has no direction
## display
  das_fact(direction,${ID},${Direction}).
