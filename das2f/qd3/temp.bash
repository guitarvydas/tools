

temp=temp${RANDOM}
# layer direction


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult(fb).
?- consult("fb").
?- consult("shapes").
?- consult("onSameDiagram").
?- consult("inside").
query_helper(ID,Direction):-
diagram_fact(kind,ID,"ellipse"),
(diagram_fact(color, ID, "green")  -> Direction = input;diagram_fact(color, ID, "yellow")  -> Direction = output;diagram_fact(color, ID, "red")  -> Direction = pervasiveinput;diagram_fact(color, ID, "purple")  -> Direction = pervasiveoutput; Direction = "?"),
true.
query:-
bagof([ID,Direction],query_helper(ID,Direction),Bag),
json_write(user_output,Bag,[width(128)]).
~~~
cat >${temp}.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (p => {
  var ID = p [0];
var Direction = p [1];
  
if (${Direction} === "?") { console.log (`all ports must have a direction ; port ${ID} has no direction`);}
else if (${Direction} === "?2") { console.log (`all ports must have a direction ; port ${ID} has no direction`);}
else if (true) { console.log (`das_fact(direction,${ID},${Direction}).`);}
else if (true) { console.log (`das_fact2(direction,${ID},${Direction}).`);};
});
  
if (true) { console.log (`${rawText}`);}
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

