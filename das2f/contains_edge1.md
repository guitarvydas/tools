# contains edge
## parameters
  Parent
  Edge
## imports
    shapes
    onSameDiagram
    inside
    names
    ports
## query
    das_fact(kind,Edge,edge)
    das_fact(kind,Parent,rectangle)
    diagram_fact(source,Edge,SourceLongID)
	diagram_fact(synonym,Source,SourceLongID)
	das_fact(direct_contains,Rect,Source)
	das_fact(direct_contains,Parent,Rect)
## display
das_fact(direct_contains,${Parent},${Edge}).
  
