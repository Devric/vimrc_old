XPTemplate priorty=personal

let s:f = g:XPTfuncs()

" =======================function and variables ==============================

" =======================snippets ============================================

" == view
XPT vmake hint=View::make()
return View::make(`view^ `, data^);


" == blade
XPT layout hint=@layout
@layout('`name^')

XPT section hint=@section
@section('`name^')
    `content^
@endsection

XPT include hint=@include
@include('`name^')

XPT render hint=@render
@render('`name^')

XPT form
{{ Form::open('`name^') }}

    {{ Form::submit('`Submit^') }}

{{ Form::close() }}
