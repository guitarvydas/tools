
temp=temp${RANDOM}
# layer bounding boxes


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult("fb.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/shapes.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/onSameDiagram.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/inside.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/names.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/ports.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/contains.pl").
query_helper(ID,X,Y,Right,Bottom):-
diagram_fact(x,ID,X),
diagram_fact(y,ID,Y),
diagram_fact(width,ID,W),
diagram_fact(height,ID,H),
Right is X+W,
Bottom is Y+H,
true.
query:-
(bagof([ID,X,Y,Right,Bottom],query_helper(ID,X,Y,Right,Bottom),Bag),
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
var X = p [1];
var Y = p [2];
var Right = p [3];
var Bottom = p [4];
  
if (true) { console.log (`das_fact(bbL,${ID},${X}).
  das_fact(bbT,${ID},${Y}).
  das_fact(bbR,${ID},${Right}).
  das_fact(bbB,${ID},${Bottom}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

