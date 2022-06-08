The helloworld diagram in DaS form.

DaS means "Diagrams as Syntax".

Meaning:

- all software components are asynchronous by default
- ports are ellipses with names
- green ports are input ports
- yellow ports are output ports 
- arrows join ports, one-way only, and indicate flow of information
- ports intersect the edges of component rectangles
- components are rectangles that have at least one port
- red rectangles represent synchronous code
- synchronous code is always contained in an asynchronous component - a rectangle which directly contains the code (red) rectangle
- everything else is undefined
- undefined diagram elements might, or might not, generate some kind of code, the results are undefined and unpredictable
- every software component contains a piece of text - its name.  The name can contain whitespace (spaces, newlines, etc.)
- every synchronous code rectangle contains text. That text is taken to be code in some other language (e.g. Python, Common Lisp, C++, Bash, etc, etc).

N.B. DaS diagrams can be represented in SVG using only rects, ellipses, lines and text.

N.B. We used draw.io (aka diagrams.net) only because it is convenient to do so.  Draw.io does not save drawings as SVG by default.  Draw.io saves drawings in an XML format (mxGraph) that we read and transpile.
