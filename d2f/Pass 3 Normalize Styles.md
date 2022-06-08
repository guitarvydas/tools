Pass 3 normalizes the *styles* attribute.

It unpacks each *style* into a separate attribute.

See `stylexpander.ohm` and `stylexpander.glue`.

For this POC, the styles are expanded by REGEXPs in `support.js` (see `support.js/expandStyle ()`).

In the future, a string parser could be built in Ohm-JS (see, maybe, applySyntactic<> and how JS template strings are parsed).

Unparsing style strings is moderately simple, as witnessed by the fact that it can be done with REGEXPs.