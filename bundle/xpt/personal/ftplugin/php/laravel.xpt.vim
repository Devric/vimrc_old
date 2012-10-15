XPTemplate priorty=personal

let s:f = g:XPTfuncs()

" =======================function and variables ==============================

" =======================snippets ============================================
XPT var
`public^ $`function^;

XPT class
/**
 * `comment^
 */


class `ClassName^
{
    `repeat...^`var^
    `repeat...^

    function `__construct^(`argument^)
    {
    	`code^
    }
}


XPT fun hint=function
`public ^function `function_name^(`var^)
{ 
    `method^
}

XPT ar
array('`2^' => `3^)

XPT arr
$`array_name^ = `ar^)

XPT arrr
array(
    `2^ => `3^,
    `repeat...^`2^ => `3^,
    `repeat...^
    )



XPT post
$_POST['`1^']

XPT baseu hint=base url
base_url();

XPT rands hint=random string
random_string('`type^', `length^);

XPT readf hint=read file
read_file('`file_path^');

XPT while
while (`condtion^) {
    `code^
}

XPT switch
switch ($`var^) { 
    case '`val^':
        `code^
        break;
    default:
        `code^
        break;
}


XPT req hint=require file
require '`file^';

XPT req1 hint=require once
require_once '`file^';

XPT request
$_REQUEST['`1^']


XPT session
$_SESSION['`1^'];

XPT do
do {
    `code^
} while (`condition^);


XPT echo
echo "`string^";

XPT else 
else { 
    `code^
}

XPT elseif
elseif (`condition^) {
    `code^
}


XPT inc hint=include
include '`file^';

XPT inco hint=include once
include_once '`file^';

" ================== documentation =================
XPT doccp hint=package,author
/**
 * `undocumented class^
 *
 * @package`default^
 * @author `snips_author^
 **/

XPT docf hint=doc  with function
/**
 * `undocumented class^
 * @return`void^
 * @author `author^
 **/
`public^ function `someFuncm^(`var^)
{
    `code^
}
