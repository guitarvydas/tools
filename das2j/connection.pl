sourceof(Edge, sender{component:SourceName,port:SourcePort}):-
    sourceidof(Edge,PortID),
    das_fact(direct_contains,Parent,PortID),
    nameof(PortID,SourcePort),
    nameof(Parent,SourceName).

sourceidof(Edge, SourceID):-
    diagram_fact(source,Edge, SourceLongID),
    diagram_fact(synonym,SourceID,SourceLongID).
sourceidof(Edge, Source):-
    diagram_fact(source, Edge, Source),
    \+ diagram_fact(synonym,Source,_).
% sourceidof(Edge,_):-format(user_error,"FATAL no source for connection ~w~n",[Edge]).


targetof(Edge, receiver{component:TargetName,port:TargetPort}):-
    targetidof(Edge,PortID),
    das_fact(direct_contains,Parent,PortID),
    nameof(PortID,TargetPort),
    nameof(Parent,TargetName).

targetidof(Edge, Target):-
    diagram_fact(target, Edge, TargetLongID),
    diagram_fact(synonym,Target,TargetLongID).
targetidof(Edge, Target):-
    diagram_fact(target, Edge, Target),
    \+ diagram_fact(synonym,Target,_).
% targetidof(Edge,_):-format(user_error,"FATAL no target for connection ~w~n",[Edge]).


connectionsof(R,Connections):-
    bagof(Conn,directconnection(R,Conn,_),Connections),
    !.
connectionsof(_,[]).

directconnection(R,dconnection{senders:[s{sender:Source}],receivers:[r{receiver:Target}]},""):-
    das_fact(connection,R,ID),
    das_fact(sender,ID,Source),
    das_fact(receiver,ID,Target).
    
