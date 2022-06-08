
-------

connectionOf(C,connection{name:ConnectionName,source:pair{component:SourceName,port:SourcePort},target:pair{component:TargetName,port:TargetPort}}):-
    contains(C,E),
    edge(E,_),
    source(E,SC),
    componentname(SC,SourcePort),
    contains(SourceParent,SC),
    getname(SourceParent,SourceName),
    target(E,TC),
    componentname(TC,TargetPort),
    contains(TargetParent,TC),
    getname(TargetParent,TargetName),
    gensym(x,ConnectionName).
    


need synccode
need connections

cond 
     diagram_fact(kind,X,"ellipse") then Kind = "ellipse"
     diagram_fact(edge,X,1) then Kind = "edge"
     diagram_fact(root,X,1) then Kind = "root"
     else Kind = "rectangle"
end cond


## cond=
### Kind =
###      diagram_fact(cell,X,_) diagram_fact(kind,X,"ellipse") "ellipse"
###      diagram_fact(edge,X,1)         "edge"
###      diagram_fact(root,X,1)         "root"
### else                                "rectangle"

(
  ( diagram_fact(kind,X,"ellipse"), Kind = "ellipse" )
; ( diagram_fact(edge,X,1), Kind = "edge" )
; ( diagram_fact(root,X,1), Kind = "root" )
; (
    diagram_fact(cell,X,_),
    \+ diagram_fact(kind,X,"ellipse"),
    \+ diagram_fact(edge,X,1),
    \+ diagram_fact(root,X,1),
    Kind = "rectangle"
  )
)

## forall X in diagram_fact(cell, X, _)
## cond=
### Kind =
###      diagram_fact(kind,X,"ellipse") "ellipse"
###      diagram_fact(edge,X,1)         "edge"
###      diagram_fact(root,X,1)         "root"
### else                                "rectangle"

## forall X in diagram_fact(cell, X, _)
 cond Kind =
      diagram_fact(kind,X,"ellipse") "ellipse"
      diagram_fact(edge,X,1)         "edge"
      diagram_fact(root,X,1)         "root"
 else                                "rectangle"
# end forall

diagram_fact(cell,X,_),
(
    diagram_fact(kind,X,"ellipse") -> Kind = "ellipse"
  ; diagram_fact(edge,X,1)         -> Kind = "edge"
  ; diagram_fact(root,X,1)         -> Kind = "root"
  ;                                   Kind = "rectangle"
)

apply /## forall/ /# end forall/ pfr $1 pre.ohm pre.glue
bracket /## forall/ /# end forall/ | apply pfr $1 pre.ohm pre.glue support.js

note: bracket begins with "#"+ "~"  "~"  "~" 
note: bracket ends with the same
note: all lines exclusive of begin/end are passed to pfr
note: result file is before-match, processed-match, after-match
note: repeats beginning with 1st line of processed-match (begin/end removed)
##~~~
  forall X matching diagram_fact(cell,X,_)
  cond Kind
      diagram_fact(kind,X,"ellipse") "ellipse"
      diagram_fact(edge,X,1)         "edge"
      diagram_fact(root,X,1)         "root"
     else                            "rectangle"
##~~~

repetitive example
a b c
##~~~
code1
##~~~
d e f
##~~~
code2
##~~~
g h i

1. passes "a b c" to output
2. passess lines "code1" to pfr and captures output
3. processes:
"
result1
##~~~
code2
##~~~
g h i
"
4. passes "result1" to output
5. passes "code2" to pfr and captures output
6. processes
"
result2
g h i
"
7. passes rest to output
"
result2
g h i
"
8. final output is
"
a b c
result1
result2
g h i
"

pre mac.ohm mac.glue <in.txt >out.txt
