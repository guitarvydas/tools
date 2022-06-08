var v1 = 1;
var v2 = 2;
var v3 = 3;

a = [v1, v2, v3];

var [x, y, z] = a;
console.error (a);
console.error (x);
console.error (y);
console.error (z);



b = {field1: v1, field2: v2, field3: v3};
var {e, f, g} = b;
console.error (b);
console.error (e);
console.error (f);
console.error (b);

c = {v1, v2, v3};
var {h, i, j} = c;
console.error (c);
console.error (h);
console.error (i);
console.error (j);

d = {field1: v1, field2: v2, field3: v3};
var {field1: k, field2: l, field3: m} = d;
console.error (d);
console.error (k);
console.error (l);
console.error (m);

