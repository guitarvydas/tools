# connection
## parameters
  Parent
  Edge
  Sender
  Receiver
## imports
  shapes
  names
  connection
## query
  das_fact(kind,Edge,edge)
  sourceof(Edge,Sender)
  targetof(Edge,Receiver)
  das_fact(direct_contains,Parent,Edge)
## display
das_fact(connection, ${Parent}, ${Edge}).
das_fact(sender, ${Edge}, sender{component:"${Sender.component}",port:"${Sender.port}"}).
das_fact(receiver, ${Edge}, receiver{component:"${Receiver.component}",port:"${Receiver.port}"}).

