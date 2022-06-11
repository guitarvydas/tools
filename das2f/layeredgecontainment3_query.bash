
temp=temp${RANDOM}
# contains edge


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult("fb.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/shapes.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/onSameDiagram.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/inside.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/names.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/ports.pl").
query_helper(Parent,Edge):-
das_fact(kind,Edge,edge),
diagram_fact(source,Edge,SourceLongID),
diagram_fact(synonym,Source,SourceLongID),
diagram_fact(target,Edge,TargetLongID),
diagram_fact(synonym,Target,TargetLongID),
(das_fact(direction,Source,output) ; das_fact(direction,Source,pervasiveoutput)),
(das_fact(direction,Target,output) ; das_fact(direction,Target,pervasiveoutput)),
das_fact(kind,Parent,rectangle),
das_fact(direct_contains,Parent,Target),
true.
query:-
(bagof([Parent,Edge],query_helper(Parent,Edge),Bag),
json_write(user_output,Bag,[width(128)])
)
;
json_write(user_output,[],[width(123)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var Parent = p [0];
var Edge = p [1];
  
if (true) { console.log (`das_fact(direct_contains,${Parent},${Edge}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

