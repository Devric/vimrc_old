XPTemplate priorty=personal

let s:f = g:XPTfuncs()

" =======================function and variables ==============================

" =======================snippets ===========================================
XPT fun
function `function^(`argument^) {
    `body^
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
