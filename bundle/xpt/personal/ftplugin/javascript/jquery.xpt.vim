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


XPT val
.val( '`stuff^)`^

XPT getscript
.getscript('`somescript.js')
" ====================== animation ===========
XPT animate
.animate({`param1: value1^`, param2:value2}, `speed^)


XPT slideu hint=slideup
.slideUp('`slow/fast/400^', function() {
    `do stuff after animation^;
})`^

XPT slided hint=slide down
.slideDown('`slow/fast/400^', function() {
    `do stuff after animation^;
})`^

XPT slidet hint=slide toggle
.slideToggle('`slow/fast/400^')`^

XPT show
.show('`slow/400/fast^')`^

XPT shoec hint=show function
.show('`slow/fast/400^', function() {
    `do stuff^;
})`^

XPT hide
.hide('`slow/400/fast^')`^

XPT hidec hint=hide function
.hide('`slow/fast/400^', function() {
    `do stuff^;
})`^

XPT fadei hint=fade in
.fadeIn('`fast/slow/400^')`^

XPT fadeic hint=fade in functon
.fadeIn('`fast/slow/400^', function() {
    `do stuff here^;
)}`^

XPT fadeo hint=fade out
.fadeOut('`fast/slow/400^')`^

XPT fadeoc hint=fade out functon
.fadeOut('`fast/slow/400^', function() {
    `do stuff here^;
})`^
)`^

XPT fadet hint=fadeto
.fadeTo('`slow/fast/400^', `0.5^)`^

XPT toggle
.toggle('`speed^', function(){
    `do stuff^;
}, function() {
    `original state^;
});

XPT togglec hint=toggle class
.toggleClass('`class^')

XPT fadetc hint=fade to function
.fadeTo('`slow/fast/400^', `0.5^, function() {
    `do stuff here^;
})`^

XPT hover
.hover(function() {
    `do stuff^;
}, function() {
    `return state^;
})`^


XPT scroll
.scroll(function() {
    `act on event^
})`^

XPT trim
.trim('`string^')

XPT next
.next('`selector')

XPT prev
.prev('`selector')

XPT parent
.parent('`selector')

XPT parents
.parents('`selector')

XPT clone
.clone()


XPT wrap
.wrap('`&lt;div class="wrapper"&gt;&lt;/div&gt;^')


" ====================== css ===========
XPT addc hint=add class
.addClass('`class name^`')`^

XPT removec hint=remove class
.removeClass('`class name^`')`^

XPT css
.css('`attribute^': '`value^'`new_css...^, '`attribute^': '`value^' `new_css...^)

XPT removea hint=remove attribute
.removeAttr('`attribute^': '`value^'`new_css...^,'`attribute^': '`value^'`new_css...^)

XPT size
.size(`size^)

" ====================== edit ===========
XPT add
.add('`selector expression^')`^

XPT remove
.remove()`^

XPT width
.width(`interger^)`^

XPT height
.height(`interger^)`^

XPT find
.find('`selector')

XPT select
.select(funciton() {
    `act on event^
})`^


XPT sib hint=sibling
.siblings('`selector^')`^

XPT append
.appened('`some html tag^')`^

XPT appendt hint=append to
.appenedTo('`selector^')`^

XPT prepend
.appened('`some html tag^')`^

XPT prependt hint=prepend to
.prepenedTo('`selector^')`^

XPT after
.after('`some html tag^')`^

XPT before
.before('`some html tag^')`^

XPT bind
.bind('`event nane^', function(`event^){
    `act on event^
})`^

XPT unbind
.unbind('`event name&')`^

XPT change
.change(function() {
    `act on event^
})`^

XPT html
.html('`some html tag^')`^

XPT text
.text('`some text^')`^

XPT get
.get(`element^)


XPT attr
.attr('`attribute^:`value^`repeat...^, `attribute^:`value^`repeat...^')

XPT children
.children('`exrepssion^')

XPT resize
.resize(function() {
    `act on event^
})`^

XPT reset
.reset(function() {
    `act on event^
})`^



" ====================== action ==========

 XPT mouseu hint=mouse up
.mouseUp(function) { 
    `act on event^
}

XPT moused hint=mouse down
.mouseDown(function() {
    `act on action^
})

XPT mouseout hint=mouse out
.mouseOut(function() {
    `act on action^
})

XPT mousem hint=mouse move
.mouseMove(function() {
    `act on action^
})

XPT mouseo hint=mouse over
.mouseOver(function() {
    `act on action^
})

XPT submit
.submit(function() {
    `act on event^
})

XPT focus
.focus(function() {
    `act on event^
})


XPT blur
.blur(function() {
    `act on event^
})

XPT filter
.filter(`selector^)


XPT timeout
.setTimeout(function(){ `1^ }, `10^ )


XPT end
.end()


XPT click
.click(function() {
    `act on event^
})

XPT dbclick hint=double click
.dbclick(function() {
    `act on event^
})


XPT load
.load(function() {
    `act on event^
})

XPT loadf
.load('`path/to/file.html^', {`param^:`value^ `new...^, `param^+`value^`new...^}, function() {
    `do stuff after page is loaded^
})

XPT loadif
.loadIfModified('`path/to/file.html^', {`param^:`value^ `new...^, `param^+`value^`new...^}, function() {
    `do stuff after page is loaded^
})

XPT error
.error(function(  ){ 
    `act on event^
})

" ====================== condition ======
XPT contains
.contains('`text to find^')

XPT if
if (`true^)

XPT is
.is ('`selector^')

XPT isnot
.not ('`selector^')

XPT ife hint=if else
if (`true^) {
    `stuff^
} else { 
    `do stuff^
}

" ====================== ajax ===========
XPT ajax
$.ajax({
    url: "`mydomain.com/url^",
    type: "`POST^",
    dataType: "`xml/html/script/json^",
    data: $.param( $("`Element or Expression^") ),

    complete: function() {
            `called when complete^
    },

    success: function() {
            `called when successful^
    },

    error: function() {
            `called when there is an error^
    },
});


XPT ajaxe hint=error
.ajaxError(function(`request^`, settings^) { 
    `do stuff when ajax called return an error^;
});

XPT ajaxs hint=stop
.ajaxStop(function() { 
    `stop when no other ajax calls in progress^;
}); 

XPT ajaxsucess
.ajaxSuccess(function() { 
    `stop when no other ajax calls in progress^;
});

XPT ajaxstart
.ajaxStart(function() {
    `do stuff^
});

XPT ajaxsetup
.ajaxSetup({
    url: "`mydomain.com/url",
    type: "`post^",
    dataType: "`xml/html/script/jason",
    data: $.param($("element/expression")),
    complete: function() {
        `called when complete^
    },
    success: function() {
        `called when success^
    },
    error: function() {
        `called when error^
    }
});

XPT ajaxg hint=get
.get('`/text/ajax-text.xml', function(xml) { 
    `alert(("title", xml).text())//optional stuff to do after get;^
});

XPT ajaxgi hint=get if
.getIfModified('`test/test.cgi', function(data){ 
    `alert("Data Loaded: " + data)//
});

XPT ajaxp hint=post
$.post('`/path/to/file.cgi^',{
    `param1^: "`value1^", `param2^: "`value2^"},
 function(){
    `stuff to do after event occurs;^
});

XPT ajaxsend
.ajaxSend(function(`request, settings^){ 
    `do stuff^
});

