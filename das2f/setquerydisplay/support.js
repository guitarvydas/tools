var parameterArray = [];

exports.formatParameters = function () {
    return parameterArray.join (',');
}

exports.clearParameters = function () {
    parameterArray = [];
}

exports.pushParameter = function (s) {
    parameterArray.push (s.trim ());
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

exports.prefix = function (argv) {
   if (argv.prefix) {
	return argv.prefix;
    } else {
	return '';
    }
}
