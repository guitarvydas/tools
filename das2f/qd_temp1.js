const fs = require ('fs');
var rawText = fs.readFileSync ('/dev/fd/0');
var parameters = JSON.parse(rawText);

parameters.forEach (param => {
    var Name = param[0];
    var Kind = param[1];
    var Color = param[2];
    var Left = param[3];
    var Top = param[4];
    var Right = param[5];
    var Bottom = param[6];
    var VertexID = param[7];
    var Synonym = param[8];
    var Value = param[9];
    
    console.log ();
});
