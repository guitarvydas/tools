var identStack = [];

exports.pushIdent = function (s) { identStack.push (s); };

exports.getIdent = function () { var topIndex = identStack.length - 1; return identStack [topIndex]; };
