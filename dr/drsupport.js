let argv;

exports.setArgv = function (a) {
    // console.error (a);
    argv = a;
}

exports.getArgv = function (s) {
    return argv [s];
}

let condcounter = 0;
function ccname () {
    return `cond${condcounter}`;
}
exports.generateConditionName = function () {
    condcounter += 1;
    return ccname ();
}
exports.getCurrentConditionName = function () {
    return ccname ();
}

///////
// from ~/app/querydisplay3/support.js
//////

var parameterArray = [];

exports.formatParameters = function () {
    return parameterArray.join (',');
}

exports.formatAllTrueParameters = function () {
    trueArray = [];
    parameterArray.forEach( () => {
	trueArray.push (true);
    });
    return trueArray.join (',');
}

exports.clearParameters = function () {
    parameterArray = [];
}

exports.pushParameter = function (s) {
    let r = s.trim ();
    parameterArray.push (r);
    return '';
}

exports.formatJSParameters = function () {
    var counter = 0;
    var result = [];
    parameterArray.forEach (ident => {
	result.push (`var ${ident} = p [${counter}];`);
	counter += 1;
    });
    return result.join ('\n');
}

//////////

exports.prefix = function (argv) {
   if (argv.prefix) {
	return argv.prefix;
    } else {
	return '';
    }
}
