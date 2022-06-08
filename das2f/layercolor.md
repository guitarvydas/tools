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
## forall ID as diagram_fact(cell,ID,_)
    Color = cond
      diagram_fact(fillColor, ID, "#d5e8d4")  "green"
      diagram_fact(fillColor, ID, "#fff2cc")  "yellow"
      diagram_fact(fillColor, ID, "#f8cecc")  "red"
      diagram_fact(fillColor, ID, "#9673A6")  "purple"
      else                                    "-"
## display
  das_fact(color,${ID},\"${Color}\").
