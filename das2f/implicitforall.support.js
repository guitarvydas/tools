exports.replnl = function (s) {
    // we want to put all lines onto one
    // but, it is not enough to simply trim() nls from the lines, we must replace nls with whitespace

    let r = s.replace (/\n/g, ' ');

    // console.error ();
    // console.error ("replnl");
    // console.error (s);
    // console.error (r);
    // console.error ();
    
    return r;
}
