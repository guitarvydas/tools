
cat >temp1.pl <<'~~~'
:- use_module(library(http/json)).

qd:-
% from common.pl but using vfb.pl instead of fb.pl
    consult(vfb),
    consult(shapes),
    consult(values),
    consult(names),
    bagof([Name, Kind, Clr, L,T,R,B, V,Syn,Val],
	  (
	      ( das_fact(kind,V,"edge"),
		Kind = "edge",
		Val  = "-",
		L = "-", T = "-", R = "-", B = "-", Clr = "-", Syn = "-",
		Name = "-"
	      )
	      ;
	      (
		  diagram_fact(vertex,V,1)
		  %,Val="-"
		  ,das_fact(color,V,Clr)
		  ,das_fact(bbL,V,L)
		  ,das_fact(bbT,V,T)
		  ,das_fact(bbR,V,R)
		  ,das_fact(bbB,V,B)
		  ,das_fact(kind,V,Kind)
		  %,diagram_fact(value,V,Long),sub_string(Long,0,1,_,Val)
		  ,diagram_fact(value,V,Val)
		  ,diagram_fact(synonym,V,Syn)
		  ,nameof(V,Name)
	      )
	  ) ,Bag),
	  json_write(user_output,Bag)

.
~~~


cat >temp2.js <<'~~~'
const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);
parameters.forEach (param => {
  var Name = param [0];
var Kind = param [1];
var Color = param [2];
var Left = param [3];
var Top = param [4];
var Right = param [5];
var Bottom = param [6];
var VertexID = param [7];
var Synonym = param [8];
var Value = param [9];
  console.log(`${Name} ${Kind} ${Color} [${Left},${Top},${Right},${Bottom}] ${VertexID} ${Synonym} "${Value.substring(0,9)}..."`);
});
~~~

swipl -g 'consult(temp1)' -g 'qd.' -g 'halt.' | node temp2.js >buffer
clear
cat buffer

