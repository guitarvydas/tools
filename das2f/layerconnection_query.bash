
temp=temp${RANDOM}
# connection


cat >${temp}.pl <<'~~~'
:- use_module(library(http/json)).
?- consult("fb.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/shapes.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/names.pl").
?- consult("/Users/tarvydas/quicklisp/local-projects/tools/das2f/connection.pl").
query_helper(Parent,Edge,Sender,Receiver):-
das_fact(kind,Edge,edge),
sourceof(Edge,Sender),
targetof(Edge,Receiver),
das_fact(direct_contains,Parent,Edge),
true.
query:-
(bagof([Parent,Edge,Sender,Receiver],query_helper(Parent,Edge,Sender,Receiver),Bag),
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
var Sender = p [2];
var Receiver = p [3];
  
if (true) { console.log (`das_fact(connection, ${Parent}, ${Edge}).
das_fact(sender, ${Edge}, sender{component:"${Sender.component}",port:"${Sender.port}"}).
das_fact(receiver, ${Edge}, receiver{component:"${Receiver.component}",port:"${Receiver.port}"}).`);};
});
  
~~~
swipl -g "consult(${temp})." -g 'query.' -g 'halt.' | node ${temp}.js
rm -f ${temp}.pl
rm -f ${temp}.js

