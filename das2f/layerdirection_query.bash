
temp=temp${RANDOM}
# layer direction


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult("fb.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/shapes.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/onSameDiagram.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/inside.pl").
query_helper(ID,Direction):-
diagram_fact(kind,ID,"ellipse"),
(das_fact(color, ID, "green")  -> Direction = input;das_fact(color, ID, "yellow")  -> Direction = output;das_fact(color, ID, "red")  -> Direction = pervasiveinput;das_fact(color, ID, "purple")  -> Direction = pervasiveoutput; Direction = "?"),
true.
query:-
(bagof([ID,Direction],query_helper(ID,Direction),Bag),
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
  var ID = p [0];
var Direction = p [1];
  
if (Direction === "?") { console.log (`FATAL: all ports must have a direction ; port ${ID} has no direction`);}
else if (true) { console.log (`das_fact(direction,${ID},${Direction}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

