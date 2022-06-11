// argv
// ._[0] = reTrigger
// ._[1] = reEnd
// ._[2] = grammarFileName
// ._[3] = fmtFileName
// .trace
// .view
// .stop
// .input
// .fmt
// .support
// .grammarname
// .inclusive
// .split
// .errorview
// .grammarname

// var tracing
// var traceDepth

//'use strict'


const fs = require ('fs');
var argv;

var reTrigger;
var reEnd;
var stop;


var viewGeneratedCode = false;
var tracing = false;
var traceDepth;

var ohm = require ('ohm-js');
var support;
var fmt;

const fmtGrammar =
      String.raw`
SemanticsSCL {
  semantics = ws* semanticsStatement+
  semanticsStatement = ruleName ws* "[" ws* parameters "]" ws* "=" ws* code? rewrites ws*

  ruleName = letter1 letterRest*
  
  parameters = parameter*
  parameter = treeparameter | flatparameter
  flatparameter = fpws | fpd
  fpws = pname ws+
  fpd = pname delimiter
  treeparameter = "@" tflatparameter
  tflatparameter = tfpws | tfpd
  tfpws = pname ws+
  tfpd = pname delimiter

  pname = letterRest letterRest*
  rewrites = rw1 | rw2
  rw1 = "[[" ws* code? rwstringWithNewlines "]]" ws*
  rw2 = rwstring

  letter1 = "_" | "a" .. "z" | "A" .. "Z"
  letterRest = "0" .. "9" | letter1

  comment = "%%" notEol* eol
  notEol = ~eol any
  
  eol = "\n"
  ws = comment | eol | " " | "\t" | "," 
  delimiter = &"]" | &"="

  rwstring = stringchar*
  stringchar = ~"\n" any

  rwstringWithNewlines = nlstringchar*
   nlstringchar = ~"]]" ~"}}" any
  code = "{{" ws* codeString "}}" ws* 
  codeString = rwstringWithNewlines

}
`;


var varNameStack = [];


var fmtSemantics = {	
    semantics: function (_1s, _2s) { 
	var __1s = _1s._fmt ().join (''); 
	var __2s = _2s._fmt ().join (''); 
	return `
{
${__2s}
_terminal: function () { return this.sourceString; },
_iter: function (...children) { return children.map(c => c._fmt ()); }
}`; 
    },
    semanticsStatement: function (_1, _2s, _3, _4s, _5, _6, _7s, _8, _9s, _10s, _11, _12s) {
	varNameStack = [];
	var __1 = _1._fmt ();
	var __2s = _2s._fmt ().join ('');
	var __3 = _3._fmt ();
	var __4s = _4s._fmt ().join ('');
	var __5 = _5._fmt ();
	var __6 = _6._fmt ();
	var __7s = _7s._fmt ().join ('');
	var __8 = _8._fmt ();
	var __9s = _9s._fmt ().join ('');
	var __10s = _10s._fmt ().join ('');
	var __11 = _11._fmt ();
	var __12s = _12s._fmt ().join ('');
	return `
${__1} : function (${__5}) { 
_ruleEnter ("${__1}");
${__10s}
${varNameStack.join ('\n')}
var _result = \`${__11}\`; 
_ruleExit ("${__1}");
return _result; 
},
            `;
    },
    ruleName: function (_1, _2s) { var __1 = _1._fmt (); var __2s = _2s._fmt ().join (''); return __1 + __2s; },
    parameters: function (_1s) {  var __1s = _1s._fmt ().join (','); return __1s; },
    
    parameter: function (_1) { 
	var __1 = _1._fmt ();
	return `${__1}`;
    },
    flatparameter: function (_1) { 
	var __1 = _1._fmt (); 
	varNameStack.push (`var ${__1} = _${__1}._fmt ();`);
	return `_${__1}`;
    },
    fpws: function (_1, _2s) { var __1 = _1._fmt (); var __2s = _2s._fmt ().join (''); return __1; },
    fpd: function (_1, _2) { var __1 = _1._fmt (); var __2 = _2._fmt (); return __1; },
    
    treeparameter: function (_1, _2) { 
	var __1 = _1._fmt (); 
	var __2 = _2._fmt (); 
	varNameStack.push (`var ${__2} = _${__2}._fmt ().join ('');`);
	return `_${__2}`; 
    },
    tflatparameter: function (_1) { 
	var __1 = _1._fmt (); 
	return `${__1}`;
    },
    tfpws: function (_1, _2s) { var __1 = _1._fmt (); var __2s = _2s._fmt ().join (''); return __1; },
    tfpd: function (_1, _2) { var __1 = _1._fmt (); var __2 = _2._fmt (); return __1; },

    pname: function (_1, _2s) { var __1 = _1._fmt (); var __2s = _2s._fmt ().join (''); return __1 + __2s;},
    rewrites: function (_1) { var __1 = _1._fmt (); return __1; },
    rw1: function (_1, _2s, codeQ, _3, _4, _5s) {
	var __2 = _2s._fmt ().join ('');
	var code = codeQ._fmt ();
	var __3 = _3._fmt ();
	if (0 === code.length) {
  	    return `${__2}${__3}`;
	} else {
	    process.stderr.write ('code is NOT empty\n');
	    throw "code in rw1 NIY";
  	    return `${code}${__3}`;
	}
    },
    rw2: function (_1) { var __1 = _1._fmt (); return __1; },
    letter1: function (_1) { var __1 = _1._fmt (); return __1; },
    letterRest: function (_1) { var __1 = _1._fmt (); return __1; },

    ws: function (_1) { var __1 = _1._fmt (); return __1; },
    delimiter: function (_1) { return ""; },

    rwstring: function (_1s) { var __1s = _1s._fmt ().join (''); return __1s; },
    stringchar: function (_1) { var __1 = _1._fmt (); return __1; },
    rwstringWithNewlines: function (_1s) { var __1s = _1s._fmt ().join (''); return __1s; },
    nlstringchar: function (_1) { var __1 = _1._fmt (); return __1; },

    code: function (_1, _2s, _3, _4, _5s) { return _3._fmt (); },
    codeString: function (_1) { return _1._fmt (); },

    // Ohm v16 requires ...children, previous versions require no ...
    _iter: function (...children) { return children.map(c => c._fmt ()); },
    _terminal: function () { return this.sourceString; }
};


function ohm_parse (maybeMultipleGrammars, grammar, text, errorMessage) {
    var parser;
    if (maybeMultipleGrammars && argv.grammarname) {
	var grammars = ohm.grammars (grammar);
	parser = grammars [argv.grammarname];
    } else {
	parser = ohm.grammar (grammar);
    }
    var cst = parser.match (text);
    if (cst.succeeded ()) {
	return { parser: parser, cst: cst };
    } else {
	// console.error (parser.trace (text).toString ());
	// console.error (text.length);
	// console.error ("/" + text + "/");
	// or ... 
	if (argv.errorview) {
	    console.error (parser.trace (text).toString ());
	    console.error (text.length);
	    console.error ("/" + text + "/");
	}
	var pos = cst._rightmostFailurePosition;
	throw ("FAIL: at position " + pos.toString () + " " + errorMessage);
    }
}

function transpiler (maybeMultipleGrammars, scnText, grammar, semOperation, semanticsObject, errorMessage) {
    var { parser, cst } = ohm_parse (maybeMultipleGrammars, grammar, scnText, errorMessage);
    var sem = {};
    try {
	if (cst.succeeded ()) {
	    sem = parser.createSemantics ();
	    sem.addOperation (semOperation, semanticsObject);
	    let result = sem (cst)[semOperation]();
	    return result;
	} else {
	    throw ("fail: " + " " + errorMessage);
	}
    } catch (err) {
	throw err;
    }
}
function fmttranspiler (scnText, grammar, semOperation, semanticsObject, errorMessage) {
    return transpiler(false, scnText, grammar, semOperation, semanticsObject, errorMessage);
}

function inputtranspiler (scnText, grammar, semOperation, semanticsObject, errorMessage) {
    return transpiler(true, scnText, grammar, semOperation, semanticsObject, errorMessage);
}


function _ruleInit () {
}

function traceSpaces () {
    var n = traceDepth;
    while (n > 0) {
	process.stderr.write (" ");
	n -= 1;
    }
    process.stderr.write ('[');
    process.stderr.write (traceDepth.toString ());
    process.stderr.write (']');
}

function _ruleEnter (ruleName) {
    if (tracing) {
	traceDepth += 1;
	traceSpaces ();
	process.stderr.write("enter: ");
	process.stderr.write (ruleName.toString ());
	process.stderr.write ("\n");
    }
}

function _ruleExit (ruleName) {
    if (tracing) {
	traceSpaces ();
	traceDepth -= 1;
	process.stderr.write("exit: "); 
	process.stderr.write (ruleName); 
	process.stderr.write ("\n");
    }
}


function execTranspiler (source, grammar, semantics, errorMessage, srcFilename, fmtFilename) {
    // first pass - transpile fmt code to javascript
    try {
	let generatedSCNSemantics = fmttranspiler (semantics, fmtGrammar, "_fmt", fmtSemantics, "in FORMAT specification: " + fmtFilename);
    _ruleInit();
	try {
	    if (viewGeneratedCode) {
		console.error ("[ execTranspiler");
		console.error (generatedSCNSemantics);
		console.error ("execTranspiler ]");
	    }
            let semObject = eval('(' + generatedSCNSemantics + ')');
	    try {
		let tr = inputtranspiler(source, grammar, "_fmt", semObject, srcFilename);
		return tr;
	    } catch (err) {
		throw err;
	    }
	}
	catch (err) {
	    throw err;
	}
    } catch (err) {
	if (argv.errorview) {
	    console.error ('source:');
	    console.error (source.replace (/[\n\t ]/g,'.'));
	}
	throw err;
    }
}

function internal_stranspile (sourceString, grammarFileName, fmtFileName, errorMessage, srcFilename) {
    var grammar = fs.readFileSync (grammarFileName, 'utf-8');
    var fmt = fs.readFileSync (fmtFileName, 'utf-8');
    var returnString = execTranspiler (sourceString, grammar, fmt, errorMessage, srcFilename, fmtFileName);
    return returnString;
}




function dump (announce, s) {
    if (argv.split) {
	console.error ();
	console.error (announce);
	console.error (s);
	console.error (announce);
	console.error ();
    }
}

function expand (s, grammarFileName, fmtFileName, message, srcFilename) {
    dump ("********* block *********", s);
    var result = internal_stranspile (s, grammarFileName, fmtFileName, message, srcFilename);
    dump ("********* Expanded ******", result);
    return result;
}

function splitOnSeparators (triggerSep, endSep, s) {
    // s = front + beginSep + middle + endSep + rest
    // if there is nothing to expand (i.e. no beginSep), s = front
    // return 3 parts, excluding beginSep and endSep

    var frontMatch = s.match (triggerSep);
    if (frontMatch) {

    	var indexEndFront = frontMatch.index;   
	var frontText = s.substring (0, indexEndFront);

	var beginSepText = frontMatch [0];
        // s contains a begin separator : front + beginSep + middle + endSep + rest
	var middleEndSepRestText = s.substring (indexEndFront + beginSepText.length);
        // middleEndSepRestText is : middle + endSep + rest


	var endMatch = middleEndSepRestText.match (endSep);
	if (endMatch) {
	    ;
	} else {
	    dump ("thus far:",middleEndSepRestText);
	    errormsg = `cannot find end separator ${endSep}`;
	    throw errormsg;
	}

	var indexEndEnd = endMatch.index;
	var endSepText = endMatch [0];

	let  middleText;
	let restText;
	if (argv.inclusive ) {
	    // include endSepText in block
	    middleText = beginSepText + middleEndSepRestText.substring (0, indexEndEnd) + endSepText;
	    restText = middleEndSepRestText.substring (indexEndEnd + endSepText.length);
	} else {
	    // endSepText is not part of block
	    middleText = beginSepText + middleEndSepRestText.substring (0, indexEndEnd);
	    restText = endSepText + middleEndSepRestText.substring (indexEndEnd + endSepText.length);
	}
	return { front: frontText, middle: middleText, rest: restText };
    } else {
	// there is no middle nor rest (no beginSep)
	return { front: s, middle: '', rest: '' };
    }
}

function pdebug (s) {
    if (10 < s.length) {
	console.error (s.substring(0,10) + "...");
    } else {
	console.error (s);
    }
}

function expandAll (s, triggerRE, endRE, grammarFileName, fmtFileName, message, srcFilename) {
    dump ("*** expandAll ***", s);
    if (s === undefined) {
	return s;
    } else {
	let _retObj = splitOnSeparators (triggerRE, endRE, s);
	let {front: front, middle: middle, rest: rest} = _retObj;
	
	if (middle === undefined || middle === '') {
	    return front;
	} else {
	    dump ("*** expansion ***", middle);
	    var expandedText = expand (middle, grammarFileName, fmtFileName, message, srcFilename);
	    cycles += 1;
	    if (stop & (cycles >= stop)) {
		return front + expandedText + rest;
	    } else {
		if (expandedText === middle) {
		    console.error ('expand made no changes');
		    console.error (middle.substring (0,30));
		    console.error (expandedText.substring (0,30));
		    throw 'expand made no changes';
		}
		return front + expandAll (expandedText + rest, triggerRE, endRE, grammarFileName, fmtFileName, message, srcFilename);
	    }
	}
    }
}

function pre (allchars, srcFilename) {
    var reTrigger = new RegExp (argv._[0]);
    var reEnd = new RegExp (argv._[1]);
    var grammarFileName = argv._[2];
    var fmtFileName = argv._[3];

    if (argv.support) {
	support = require (argv.support);
	if (support.setArgv) {
	    support.setArgv (argv);
	}
    }
    if (argv.fmt) {
	fmt = require (argv.fmt);
	if (fmt.setArgv) {
	    fmt.setArgv (argv);
	}
    }
    if (argv.trace) {
	var traceFlag = true;
	if (traceFlag === 't') {
	    tracing = true;
	    traceDepth = 0;
	}
    }


    var expanded = expandAll (allchars, reTrigger, reEnd, grammarFileName, fmtFileName, srcFilename, srcFilename);
    return expanded;
}

function main () {
    argv = require('yargs/yargs')(process.argv.slice(2)).argv;
    var fname;
    if (argv.input) {
	fname = argv.input;
    } else {
	fname = '/dev/fd/0';
    }
    cycles = 0;
    if (argv.stop) {
	stop = argv.stop;
    } else {
	stop = undefined;
    }
    if (argv.view) {
	viewGeneratedCode = true;
    } else {
	viewGeneratedCode = false;
    }
    if (argv.trace) {
	tracing = true;
	traceDepth = 0;
    } else {
	tracing = false;
    }
    var allchars = fs.readFileSync (fname, 'utf-8');
    var result = pre (allchars, fname);
    emit (result);
}
function emit (s) {
    console.log (s);
}

function getargv (s) {
    let r = argv[s];
    if (r) {
	return r;
    } else {
	return "";
    }
}

main ();

