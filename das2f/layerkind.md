# layer kind
## parameters
  X
  Kind
## imports
  shapes
  onSameDiagram
  inside
  names
  ports
  contains
## forall X as diagram_fact(cell,X,_)
    Kind = cond
      diagram_fact(kind,X,"ellipse") "ellipse"
      diagram_fact(edge,X,1)         "edge"
      diagram_fact(root,X,1)         "root"
     else                            "rectangle"
## display
  das_fact(kind,${X},${Kind}).
  
