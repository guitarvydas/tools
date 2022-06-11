
temp=temp${RANDOM}
# synchronous code


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult("fb.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/shapes.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/values.pl").
query_helper(Codebox,Code):-
das_fact(kind,Codebox,rectangle),
das_fact(color,Codebox,"red"),
valueof(Codebox,Code),
true.
query:-
(bagof([Codebox,Code],query_helper(Codebox,Code),Bag),
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
  var Codebox = p [0];
var Code = p [1];
  
if (true) { console.log (`das_fact(codebox,${Codebox},\"${Code}\").`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

