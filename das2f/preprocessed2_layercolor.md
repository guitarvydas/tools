# layer kind
## parameters
  ID
  Color
## imports
  shapes
  onSameDiagram
  inside
  names
  ports
  contains
## query
diagram_fact(cell,ID,_) 
(diagram_fact(fillColor, ID, "#d5e8d4")  -> Color = "green";diagram_fact(fillColor, ID, "#fff2cc")  -> Color = "yellow";diagram_fact(fillColor, ID, "#f8cecc")  -> Color = "red";diagram_fact(fillColor, ID, "#9673A6")  -> Color = "purple"; Color = "-")
## display
  das_fact(color,${ID},\"${Color}\").


