XPTemplate priorty=personal

let s:f = g:XPTfuncs()

" Strip directory path for require expansion
function! s:f.strip_path(pathname)
    return substitute(system("basename " . shellescape(a:pathname)), "\n", "", 'g')
endfunction

XPT req " node require scripts
var `module^strip_path(V())^ = require('``module^');

" =======================function and variables ==============================

" =======================snippets ===========================================
XPT fun
XSET arg*|post=ExpandIfNotEmpty(',', 'arg*')
var `name^ = function `name^(`arg*^) {
    `body^
}

XPT f
XSET arg*|post=ExpandIfNotEmpty(',', 'arg*')
function `name^ (`arg*^) {
    `cursor^
}

XPT this
$(this)`^

XPT $
$(`'stuff'^)`^

XPT docr
$(document).ready(function() {
    `start here^
});

XPT for
for (var i=0; i < `var^ i++) {
    `things^[`i^]
};

XPT log
console.log(`curosr^);

XPT :
{ 
    `key^: `val^`...^,
  , `key^: `val^`...^
}
