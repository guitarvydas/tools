# layer bounding boxes
## parameters
  ID
  X
  Y
  Right
  Bottom
## imports
    shapes
    onSameDiagram
    inside
    names
    ports
	contains
## query
    diagram_fact(x,ID,X)
    diagram_fact(y,ID,Y)
    diagram_fact(width,ID,W)
    diagram_fact(height,ID,H)
    Right is X+W
    Bottom is Y+H
## display
  das_fact(bbL,${ID},${X}).
  das_fact(bbT,${ID},${Y}).
  das_fact(bbR,${ID},${Right}).
  das_fact(bbB,${ID},${Bottom}).

