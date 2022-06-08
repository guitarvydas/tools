See `factbase.ohm` and `factbase.glue`.

The goal of this pass is to parse a diagram and to output it in *factbase* format.

A *fact* in a *factbase* is a *triple* `relation(subject,object)` in PROLOG format.

We use *factbase* format, later, to infer the meaning of the diagram.  See `d2py`.

At present, all inferencing is done using `swipl`.  Converting to PROLOG format is a convenience.

Inferencing *could* be performed in many other ways, e.g.
- miniKanren
- clojure (e.g. core.logic)
- Python
- JavaScript
- etc., etc.