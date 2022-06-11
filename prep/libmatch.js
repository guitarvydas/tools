//'use strict'
const ohm = require ('ohm-js');

exports.ohmMatch = function (src, grammarname, grammarsrc) {
    // use Ohm-JS to match src with grammarsrc (both strings)
    // "grammarname" is a string name of the grammar to be used
    // return an array, containing
    // [0] the matchObject created by Ohm, and,
    // [1] a semantics object if the parse succeeded, else undefined
    const grammar = ohm.grammars(grammarsrc)[grammarname];
    var matchObject = grammar.match (src);
    if (matchObject.succeeded ()) {
	console.log ('match succeeded');
	var sem = grammar.createSemantics ();
	console.log ('match succeeded 2');
	return [matchObject, sem];
    } else {
	return [matchObject, ''];
    }
}

    
