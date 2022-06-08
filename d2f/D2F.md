# D2F
Diagram to Factbase transpiler.
# A Simple Diagram
![[helloworld.svg]]
![[helloworld.mp4]]

Using [drawio.io aka diagrams.net](https://app.diagrams.net).

The diagram contains only 4 kinds of things:
- rectangles
- ellipses
- lines
- text

Some of the objects have attributes, e.g. color, rounded corners, etc.

The diagram can be represented using simple SVG.

Draw.io saves diagrams in its own format - `.drawio`.

The format is based on [mxgraph](https://jgraph.github.io/mxgraph/).

# Goal of D2F (Diagram to Factbase)
To Convert `.drawio` files into triples (relation, subject, object).

The triples are queried and manipulated using [PROLOG](https://www.swi-prolog.org). 

D2F simply dumps information out from diagram format to factbase format.

D2F does not try to "parse" or understand the diagram (that comes later - see `das2f`)

In compiler terminology, D2F is like a *scanner* that reads input and produces tokens (input = 2D diagram, tokens = triples). 

# Factbase
We will create triples in a format that is compatible with PROLOG, e.g. `relation(subject,object).`

We will call the collection of triples a `factbase`.

## Sorting
PROLOG requires that triples be sorted contiguously by name.  

 `Sort` is used for this purpose.

## String Encoding
 `Sort` works only with lines.  We encode strings to ensure that that multi-line strings appear on one line in the factbase.

 The encoding is compatible with HTML and JavaScript.  We use standard libraries to encode/decode strings.

 Draw.io can display drawings in a browser, so it encodes strings for HTML formatting.  
 
 Strings remain encoded in the factbase.  
 
 Later, we unencode strings (using JavaScript) as we emit code from the factbase.

 # Transpilation Steps

[[Pass 1 Uncompress]]
[[Pass 2 Extract Diagrams]]
[[Pass 3 Normalize Styles]]
[[Pass 4 Convert to Facts]]
[[Cleanup]]
 