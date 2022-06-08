# layer direction
## parameters
  ID
  Direction
## imports
  fb
  shapes
  onSameDiagram
  inside
## query
diagram_fact(kind,ID,"ellipse") 
(diagram_fact(color, ID, "green")  -> Direction = input;diagram_fact(color, ID, "yellow")  -> Direction = output;diagram_fact(color, ID, "red")  -> Direction = pervasiveinput;diagram_fact(color, ID, "purple")  -> Direction = pervasiveoutput; Direction = "?")
## cond comment 1
  ${Direction} === "?" 
  all ports must have a direction ; port ${ID} has no direction
## cond comment 2
  ${Direction} === "?2" 
  all ports must have a direction ; port ${ID} has no direction
## display comment 3
  das_fact(direction,${ID},${Direction}).
## display comment 4
  das_fact2(direction,${ID},${Direction}).
## json comment 5

