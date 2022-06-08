diagram to factbase transpiler

## Usage
1. Draw a diagram in draw.io, using only boxes, ellipses, lines and text
	- blue boxes are *isolated* components
	- red boxes are bits of code
	- green circles are inputs
	- yellow circles are outputs
	- use arrows to join green circles to yellow circles
	- draw an empty box[^1] around the whole program

Pull `d2f` into a local directory, say 
The, run *d2f*
```
d2f ~/projects helloworld.drawio >fb.pl
```

`D2f` only converts the diagram into `factbase` format.

See `d2py` for how to convert diagrams to Python.

2. Explanation:
	- d2f requires 2 command-line arguments
		1. root directory of the tools (~/projects on my machine)
		2. the `.drawio` file to be transpiled
		- the result is a `factbase` that is sent to `stdout`, capture the result in the file `fb.pl`

[^1]: no colour

## Details and Internals

input: draw.io diagram containing tabs containing diagrams

diagram contains only:
- rectangles
- ellipses
- text (value)
- edges


output: facts (1 set of facts per drawio tab)


a `fact` is output in PROLOG format, e.g.
```
fact(relation,subject,object).
```

see run.bash for example usage of d2f.bash

See [[D2F]] for more details.


