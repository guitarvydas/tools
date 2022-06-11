# layer direction
## parameters
  ID
  Direction
## imports
  shapes
  onSameDiagram
  inside
## query
diagram_fact(kind,ID,"ellipse") 
(das_fact(color, ID, "green")  -> Direction = input;das_fact(color, ID, "yellow")  -> Direction = output;das_fact(color, ID, "red")  -> Direction = pervasiveinput;das_fact(color, ID, "purple")  -> Direction = pervasiveoutput; Direction = "?")
## cond design rule
  Direction === "?" 
  FATAL: all ports must have a direction ; port ${ID} has no direction
## display
  das_fact(direction,${ID},${Direction}).


