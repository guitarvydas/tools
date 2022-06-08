# layer names
## parameters
    ID
	Name
## imports
    shapes
    onSameDiagram
    inside
    names
    ports
	contains
## query
    diagram_fact(vertex,ID,_)
    diagram_fact(value,ID,Name)
## display
    das_fact(name, ${ID}, \"${Name}\").
