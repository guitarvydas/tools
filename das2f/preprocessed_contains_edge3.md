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
	(das_fact(direction,Source,output) ; das_fact(direction,Source,pervasiveoutput))
	(das_fact(direction,Target,output) ; das_fact(direction,Target,pervasiveoutput))
    das_fact(kind,Parent,rectangle)
	das_fact(direct_contains,Parent,Target)
## display
das_fact(direct_contains,${Parent},${Edge}).
  

