
temp=temp${RANDOM}
# layer kind


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult("fb.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/shapes.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/onSameDiagram.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/inside.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/names.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/ports.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/contains.pl").
query_helper(X,Kind):-
diagram_fact(cell,X,_),
(diagram_fact(kind,X,"ellipse")  -> Kind = "ellipse";diagram_fact(edge,X,1)  -> Kind = "edge";diagram_fact(root,X,1)  -> Kind = "root"; Kind = "rectangle"),
true.
query:-
(bagof([X,Kind],query_helper(X,Kind),Bag),
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
  var X = p [0];
var Kind = p [1];
  
if (true) { console.log (`das_fact(kind,${X},${Kind}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

