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
    diagram_fact(source,Edge,SourceLongID)
	diagram_fact(synonym,Source,SourceLongID)
    diagram_fact(target,Edge,TargetLongID)
	diagram_fact(synonym,Target,TargetLongID)
	(das_fact(direction,Source,input) ; das_fact(direction,Source,pervasiveinput))
	(das_fact(direction,Target,input) ; das_fact(direction,Target,pervasiveinput))
    das_fact(kind,Parent,rectangle)
	das_fact(direct_contains,Parent,Source)
## display
das_fact(direct_contains,${Parent},${Edge}).
  

