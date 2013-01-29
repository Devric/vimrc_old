XPTemplate priorty=personal

let s:f = g:XPTfuncs()

" =======================function and variables ==============================

" =======================snippets ============================================

" == view
XPT vmake hint=View::make
return View::make('`view^'`, data^);

" == blade
XPT layout hint=@layout
@layout('`name^')

XPT section hint=@section
@section('`name^')
    `content^
@endsection

XPT yield hint=@yield
@yield('`name^')

XPT include hint=@include
@include('`name^')

XPT render hint=@render
@render('`name^')

XPT FO
{{ Form::open('`name^') }}

    {{ Form::submit('`Submit^') }}

{{ Form::close() }}

XPT FT
{{ Form::label('`name^','`label^') }}
{{ Form::text('`name^') }}

XPT resource
// `controller^ Resouce
Route::get('`controller^s', array('as' => '`controller^s', 'uses' => '`controller^s@index'));
Route::get('`controller^s/(:any)', array('as' => '`controller^', 'uses' => '`controller^s@show'));
Route::get('`controller^s/new', array('as' => 'new_`controller^', 'uses' => '`controller^s@new'));
Route::get('`controller^s/(:any)/edit', array('as' => 'edit_`controller^', 'uses' => '`controller^s@edit'));
Route::post('`controller^s', '`controller^s@create');
Route::put('`controller^s/(:any)', '`controller^s@update');
Route::delete('`controller^s/(:any)', '`controller^s@destroy');
