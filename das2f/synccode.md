# synchronous code
## parameters
  Codebox
  Code
## imports
  shapes
  values
## query
  das_fact(kind,Codebox,rectangle)
  das_fact(color,Codebox,"red")
  valueof(Codebox,Code)
## display
das_fact(codebox,${Codebox},\"${Code}\").
