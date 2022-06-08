# Goal
To parse `.drawio` files and uncompress the contained diagrams.

# .Drawio Encoding
A single `.drawio` can contain multiple diagrams - one diagram per GUI Tab.

The set of diagrams is wrapped in a header:

```
<mxfile ...>
...
</mxfile>
```

Each diagram is wrapping in:

```
<diagram id=...>
???
</diagram>
```

Where `???` is encoded text.

# Parsing and Uncompressing
## Parsing (Pattern Matching)
Parsing is performed using the `prep` tool.  It uses the pattern specification (aka grammar) in `drawio.ohm`.
## Uncompressing
As the input is pattern-matched, `prep` invokes reformatting rules contained in `drawio.glue`.

The rules sync up with incoming diagrams and call JavaScript code to uncompress the diagrams via `support.decodeMxDiagram (...)`.

## Analogy - Meshing Gears
The parser can be thought of as a set of teeth on gears.  

The incoming code meshes with the gears and turns them.

When certain gear teeth come into contact with the input, the decoder function is invoked.

![[two-gears.png]]
# Grammar
`drawio.ohm`
```
AppDiagramsEncodedNet{
TabbedDiagrams = Header Diagram+ Trailer
Header = "<" "mxfile" encodedChar+
Trailer = "</mxfile>"
Diagram = "<diagram" Attribute* ">" encodedChar+ "</diagram>"
Attribute = alnum+ "=" attributeValue
string= "\"" notDQ* "\""
notDQ = ~"\"" any
encodedChar = ~"<" any		   
attributeValue = number | string
number = digit+
}
```
## Reading

![[drawio-grammar 2.svg]]

A `.drawio` file has the pattern given by the grammar `AppDiagrsEncodedNet`.

At the top level, we expect to see `TabbedDiagrams`.

The `TabbedDiagrams` section contains 3 main parts
1. Header
2. Diagram (one or more)
3. Trailer

A `Header` consists of
1. the string `<`
2. the string `mxfile`
3. encodedChar (one or more)

[nuance: The fact that the rule `Header` is capitalized signals that it is a *syntactic rule*.  A *syntactic rule* skips spaces (if any) between its items.  For example, the rule says that there might be 0 or more spaces between "<" and "mxfile" and 0 or more spaces between "mxfile" and the encodedChar.]

An `encodedChar` is exactly one character:
- the character must not be `<`
- the character can be anything else.

[nuance: the `+` in `Header` says to match 1 or more `encodedChar`s, each of which is exactly on character].

A `Trailer` is
1. the string `</mxfile>`

(Nothing else - if we don't see `</mxfile>` in that position, an error is raised.)

A `Diagram` is
1. the string `<diagram`
2. something that matches the rule `Attribute` (0 or more times)
3. the string `>`
4. something that matches the rule `encodeChar` (1 or more times)
5. the string `</diagram>`.

An `Attribute` is
1. something that matches the rule `alnum` (1 or more times)
2. the string `=`
3. something that matches the rule `atributeValue` (exactly once)

An `attributeValue` is
- a `number`, or
- a `string`

A `number` is
- `digit` (1 or more times) (`digit` is builtin, it is, also, possible to specify it fully in the grammar - see the Ohm-JS documentation).

A `string` is:
1. the character `"` (actually, the string `"`)
2. something that matches the rule `notDQ` (0 or more times)
3. the character `"`.

A `notDQ` is exactly one character:
- the character must not be `"`
- the character can be anything else
# Format
If the parse succeeds, using the patterns in `drawio.ohm`, the system will invoke formatting rules specified in `drawio.glue`.

There must be exactly on formatting rule to correspond with each grammar rule (the formatting rules must have the same name as the rules in `drawio.ohm`).

The format specification is given in `drawio.glue`:

```
TabbedDiagrams [h @d t] = [[${d}]]
Header [k k2 @ec] = [[${k}${k2}${ec}]]
Trailer [k] = [[${k}]]
Diagram [k @a k2 @ec k3] = [[${k}${a}${k2}\n${support.decodeMxDiagram(ec)}\n${k3}\n]]
Attribute [@an k s] = [[\ ${an}${k}${s}]]
string [q1 @cs q2] = [[${q1}${cs}${q2}]]
notDQ [c] = [[${c}]]
encodedChar [c] = [[${c}]]
attributeValue[x] = [[${x}]]
number [n] = [[${n}]]
```
## Reading
The parser creates a CST (concrete syntax tree) tree representing the input source code.  The tree has nodes that correspond directly to the rules in `drawio.ohm`.  The tree is ordered from the top down as matched in the input source code.  The tree might contain more than one of the same kind of node - distinguished by the order that was encountered in the parse of the input source code.