XPTemplate priorty=personal

let s:f = g:XPTfuncs()

" =======================function and variables ==============================

" =======================snippets ============================================
XPT thisview
$this->load->view('`viewfile^');

XPT thismodel
$this->load->model('`model^');

XPT this
$this->`^->`^;

XPT thisconf
$this->load->config('`conf^');

XPT thishelper
$this->load->helper('`helper^');

XPT thislib
#this->load->library('`library^');

XPT thisplugin
#this->load->plugin('`plugin^');

" =============== basic ==================
XPT c_c hint=extend controller
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class `classname^ extends CI_Controller{ 
    function __construct()
    {
        parent::Controller();
    }

    `function...^
    function `method^()
    {
        `^
    }
    `function...^

}
XPT c_m hint=extend model
class `classname^Model extends CI_Model{ 
    function __construct()
    {
        parent::Model();
    }

    `function...^
    function `method^()
    {
        `^
    }
    `function...^

}

XPT c_d hint=extend doctrine model
class `classname^ extends Doctrine_Record {

    public function setTableDefinition()
    {
	`has_col...^$this->hasColumn('`column_name^', '`string^', `255^);  
 `has_col...^
    }

    public function setUp() 
    {
        $this->setTableName('`table_name^}');
        $this->ActAs('Timestampable');
    }
}


XPT c_getlist hint=list db in model
function (get`list^) { 
    sqlselect`3^
        $q = $this->db->get('`table^');

        if($q->num_rows() > 0 ){
            foreach ($q -> result() as $row){
                $data[] =$row;
            }
            return $data;
        }
}

XPT echolist hint=php foreach in html
<?php foreach($`var^ as `container^): ?>
    <?php echo $`container^->`dbfield^; ?>
<?php endforeach; ?>
:<F12>

" ================ agent ==================

XPT c_agentc hint=accept_charset
$this->agent->accept_charset('`charset^');
`^

XPT c_agentl hint=accept_lang
$this->agent->accept_lang('`language');
`^

XPT c_agent
$this->agent->`function^(`^);
`^

XPT c_agentb hint=browser
$this->agent->browser();
`^

XPT c_agentib hint=is browser
$this->agent->is_browser();
`^

XPT c_agentim hint=is mobile
$this->agent->is_mobile();
`^

XPT c_agentir hint=is referral
$this->agent->is_referral();
`^

XPT c_agentm hint=mobile
$this->agent->mobile();
`^

XPT c_agentiro hint=is robot
$this->agent->is_robot();
`^
XPT c_agentp hint=platform
$this->agent->platform();
`^
XPT c_agentr hint=referrer
$this->agent->referrer();
`^
XPT c_agentro hint=robot
$this->agent->robot();
`^

XPT c_agents hint=agent string
$this->agent->agent_string();
`^

XPT c_agentv hint=agent version
$this->agent->version();
`^

" ================ bench mark ============
XPT bench hint=benchmark->memory usage
$this->benchmark->memory_usage();
`^

" ================ calendar ==============
XPT c_cal
$this->calendar->`function^(`^);
`^
XPT c_calg hint=cal generate
$this->calendar->generate();
`^

" ================ zip ===================
XPT c_zipad hint=add_dir
$this->zip->add_dir('`directory_name');
`^

XPT c_zipa hint=archive
$this->zip->archive('`output_file^');
`^

XPT c_zip hint=zip
$this->zip->`function^(`method^);
`^

XPT c_zipc hint=zip clear
$this->zip->clear_data();
`^

XPT c_zipd hint=zip download
$this->zip->download('`filename^');
`^

XPT c_zipg hint=zip get
$this->zip->get_zip();
`^

XPT c_ziprd hint=zip read_dir
$this->zip->read_dir('`path_to_file^');
`^

XPT c_ziprf hint=zip read file
$this->zip->read_file('`path_to_file^');
`^

XPT c_zipadata hint=add data
$this->zip->add_data('`file_name^', '`data^');
`^

" =============== cart ====================
XPT c_cart
$this->cart->`function^(`method^);
`^

XPT c_carti hint=cart->insert
$this->cart->insert(`array^);
`^

XPT c_cartc hint= cart content
$this->cart->contents();
`^

XPT c_cartf hint=cart destroy
$this-cart->destroy();
`^

XPT c_cartfn hint=cart format number
$this->cart->format_number(`number^);
`^

XPT c_cartho hint=cart Has Option
$this->cart->has_option(`row id^);
`^


XPT c_carto hint=cart option
$this->cart->options(`row_id^);
`^

XPT c_cartt hint=cart Total
$this->cart->options();
`^

XPT c_cartti hint=cart Total Items
$this->cart->total_items();
`^

XPT c_cartu hint=cart update
$this->cart->update(`array^);
`^


" =============== others and config ==============
XPT c_active hint=unit->active
$this->unit->active('`FALSE^');
`^

XPT c_cipher hint=encrpt cipher
$this->encrypt->set_cipher(`cipher constant^);
`^
XPT c_confg hint=config Get
$this->config->item('name');
`^

XPT c_confs hint=config site url
$this->config->site_url(`^);
`^

XPT c_confsys hint=config sys url
$this->config->system_url(`^);
`^

XPT c_decode hint=encrypt decode
$this->encript->decode('`msg');
`^

XPT c_sha
$this->encript->sha1('`string^');
`^

XPT siteurl
site_url('`string^');
`^

XPT c_stddate hint=standard date
standard_date("`date_string^", "`timestamp^");
`^

XPT c_stripit hint=strip Img Tag
strip_image_tags('`string^');
`^

XPT c_stripq hint=strip qoutes
strip_qoutes('`string^');
`^

XPT c_e2c hint=entities to ascii
entities_to_ascii(`'`string^'^);
`^

XPT c_lang hint=c lang support
$this->lang->`function^(`method^);
`^

XPT c_langline
$this->lang->line('`language_key');
`^

XPT c_output
$this->output->`function^(`method^);
`^

XPT c_outputcache
$this->output->cache(`minutes to cache^);
`^

XPT c_outputget
$this->output->get_output();
`^

XPT c_outputprof hint= output profiler
$this->output->enable_profiler(`TRUE^);
`^

XPT c_outputstat hint=output status
$this->output->set_status_header('`code^', '`text^');
`^

XPT c_pagi hint=pagination
$this->pagination->`function^(`method^);
`^

XPT c_pagic hint=pagination create link
$this->pagination->create_links();
`^

XPT c_pagii hint=pagination initialize
$this->pagination->initialize(`config^);
`^

XPT c_parse
$this->parser->parse('`template^', `data^, `TRUE^);
`^

XPT c_parser
$this->parser->`function^(`method^);
`^

XPT c_session
$this->session->`function^(`method^);
`^

XPT c_sessiondes hint=session destroy
$this->session->sess_destroy();
`^

XPT c_sessiond hint=user or flash data
$this->session->`user or flah^data('`index^');
`^

XPT c_sessionflashkeep hint=keep flash data
$this->session->keep_flashdata('`index^');
`^

XPT c_sessionset
$this->session->`un^set_`user or flash^data('`index^');
`^

XPT c_setcookie
set_cookie(`value^`value...^, value`value...^);

XPT c_realpath
set_realpath('`path^, `TRUE^');
`^

XPT c_set_value
set_value('`field^', '`value^');
`^

XPT c_wordl hint=word limiter
word_limiter('`string^', `number_of_words^);
`^

XPT c_wordw hint=wordwrap
word_wrap('`string^',`num_of_chars^);
`^


" ============================ ftp & email =========================

XPT c_mail
$this->email->`function^(`method^);
`^

XPT c_mailalt hint=alt message
$this->email->set_alt_message('`message^');
`^

XPT c_mailattach hint=attachment
$this->email->attach('`path^');
`^

XPT c_mailbcc
$this->email->bcc('`a@mail.com^, `to_address...^`to address^,`to_address...^');

XPT c_mailcc
$this->email->cc('`a@mail.com^, `to_address...^`to address^,`to_address...^');
`^

XPT c_mailmsg
$this->email->message('`message^');
`^

XPT c_mailto
$this->email-to('`a@mail.com^, `to_address...^`to address^,`to_address...^');
`^

XPT c_mailclear
$this->email->clear(`TRUE^);
`^

XPT c_maildebug
$this-email->print_debug();
`^

XPT c_mailform
$this->email->form('`from adress^', '`from_name^');
`^

XPT c_mailreply
$this->email->replay_to('`reply_address^', '`reply_name^');
`^

XPT c_mailsend
$this->email->send();
`^

XPT c_mailsubject
$this->email->to('`subject^');
`^

XPT c_sendemail
send_email('`recipient^', '`subject^', '`message^');
`^


XPT c_ftp
$this->ftp->`function^(`method^);
`^

XPT c_ftpchmod
$this->ftp->chmod('`path^', `permissions^);
`^

XPT c_ftpclose
$this->ftp->close();
`^

XPT c_ftpdel hint=delete file
$this->ftp->delete_file('`path^');
`^

XPT c_ftpdeldir hint= delete dir
$this->ftp->delete_dir('`path^');
`^

XPT c_ftplf hint=list file
$this->ftp->list_files('`path^');
`^

XPT c_ftpm hint=ftp mirror
$this->ftp->mirror('`local_path^', '`remote_path^');
`^

XPT c_ftpmkdir hint=make dir
$this->ftp->mkdir('`path^', `persmissons^);
`^

XPT c_ftpmove hint=move file
$this->ftp->move('`original file^', '`new_path^');
`^

XPT c_ftprename hint=rename
$this->ftp->rename('`orig^', '`new^');
`^

XPT c_ftpupload hint=upload
$this->ftp->upload('`local path^', '`remote path^', `permissions^);
`^

XPT c_upload
$this->upload->`function^(`method^);
`^

XPT c_uploadd hint=upload data
$this->upload->data();
`^

XPT c_uploaddo hint=do upload
$this->upload->do_upload(`fields^);
`^

XPT c_uploaddoe hint= do upload error
$this->upload->display_errors(`delimiter^);
`^

XPT c_writef hint=write file
write_file('`../path/file.php^', `data^`, 'r'^);
`^


" =============== db =====================
XPT c_data hint=$data['var'] = $this->model->function
$`dataname^['`var^'] = $this->`model name^->`model function^();

XPT c_db hint=db->function
$this->db->`function^(`^);

XPT c_dbar hint=db->Affected_Rows
$this->db->affected_rows();

XPT c_dbsc hint=db start cache
$this->db->start_cache();

XPT c_dbcountall hint=db count all
$this->db->count_all_results();

XPT c_dbcout hint=db count
$this->db->count_all('`table^');

XPT c_dbdel hint=db delete
$this->db->delete('`table^');

XPT c_dbdistinct hint=db distinct
$this->db->distinct();

XPT c_dbempty hint=db empty
$this->db->empty_table('`table^');

XPT c_dbfd hint=db Field Data
$this->db->field_data('`table^');

XPT c_dbfe hint=db field exsits
$this->db->field_exists('`field^', '`table^');

XPT c_dbfields hint=db field
$this-db->list_fields('`table^');

XPT c_dbflush hint=db flush
$this->db->flash_cache();

XPT c_dbget hint=db get
$this->db->get('`table^');

XPT c_dbgetw hint=db get Where
$this->db->get_where('`table^', $`array^, `limit^, `offset^);

XPT c_dbgroup hint=db group
$this->db->group_by('`field^');

XPT c_dbinserts hint=db INSERT String
$this->db->insert_string('`table_name^', '`array^');

XPT c_dbinsert hint=db Insert
$this->db->insert('`table^', $`array^);

XPT c_dbinsertid hint=db INSERT ID
$this->db->insert_id();

XPT c_dbjoin
$this->db->join('`table^', '`where^');

XPT c_dbblast hint=db blast
$this->db->last_query();

XPT c_dblike hint=db like
$this->db->like('`field^', '`match^');

XPT c_dborderby hint=db order by
$this->db->order_by('`field^');

XPT c_dborwhere hint=db or where
$this->db->or_where('`field^', '`value^');

XPT c_dbwherein hint=db where in
$this->db->where_in('`field^', $`array^);
`^

XPT c_dbp hint=db platform
$this->db->platform();
`^

XPT c_dbqb hint=db query bind
$this->db->query('`sql^', '`array^');
`^

XPT c_dbsel hint=db select
$this->db->select('`col name');
`^

XPT c_dbselavg hint=select avg
$this->db->select_avg('`field^');
`^



XPT c_dbform hint=db form
$this->db->form('`form table^');
`^

XPT c_dbselmax hint=db select max
$this->db->select_max('`field^');
`^

XPT c_dbselsum hint=db select sum
$this->db->select_sum('`field^');
`^

XPT c_dbset
$this->db->set('`field^, `value^');
`^

XPT c_dbstop
$this->db->stop_cache();
`^

XPT c_dbte hint=db table exists
$this->db->table_exsists('`table_name');
`^

XPT c_dlt hint=db listt ables
$this-db->list_tables();
`^

XPT c_dbus hint=db update string
$this->db->update_string('`table^', $`array^, $`where^);
`^

XPT c_dbv hint=db version
$this->db->version();
`^

XPT c_dbwhere
$this->db->where('`field^', '`value^');
`^


" =================== query ===================
XPT c_qfr hint=query first row
$query->first_row();
`^

XPT c_qlr hint=query last row
$query->last_row();
`^

XPT c_qnr hint= query next row
$query->next_row();
`^
XPT c_qnumfield hint=query number field
$query->num_fields();
`^
XPT c_qnumrow hint=query number row
$query->num_rows();
`^

XPT c_qpr hint=query prev row
$query->previous_row();
`^

XPT $q
$q = $this->db->`get^`select^('`table');
`^

XPT $qf hint=query free result
$query->free_result();
`^

XPT $qr hint=query result
$query->result();
`^

XPT $qra hint= query result array
$query->result_array();
`^

XPT $qrow
$query->row();
`^

XPT $qrowa hint=query row array
$query->row_array();
`^

" ===================== form =================
XPT c_formv hint=form validation
$this->form_validation->`function^(`2^);
`^

XPT c_formvr hint=form validation run
$this->form_validation->run();
`^

XPT c_valm hint=validate mail
valid_email('`mail address^');
`^

XPT c_valip hint=validate ip
$this->input->valid_ip(`ipaddress^);
`^

XPT c_vale hint=echo val error
echo validation_errors('`start^', '`end^');
`^


" ===================== lib ==================
XPT c_imgr hint=image resize
$this->image_lib->resize();
`^

XPT c_img
$this->image_lib->`function^(`methid^);
`^

XPT c_imgc hint=img clear
$this->image_lib->clear();
`^

XPT c_imgcrop hint=img crop
$this->image_lib->crop();
`^

XPT c_imge hint=img error
$this->image_lib->display_errors('`start_tag^', `end_tag^);
`^

XPT c_imagerotate hint=image rotate
$this->image_lib->rotate();
`^

XPT c_imgw hint=watermark
$this->image_lib->watermark();
`^


" ================================= input =============

XPT c_input
$this->input->`function^(`method^);
`^

XPT c_inputa hint=input user agent
$this->input->user_agent();
`^

XPT c_inputcookie
$this->input->cookie('`data^`, TRUE^');
`^

XPT c_inputget
$this->input->get('`data^`, TRUE^');
`^

XPT c_inputgetp hint=input get post
$this->input->get_post('`data^`, TRUE^');
`^

XPT c_inputip hint=input ip address
$this->input->ip_address();
`^

XPT c_inputp hint=input post
$this->input->post('`data^`, TRUE^');
`^

XPT c_inputs hint=input server
$this->input->server('`data^');
`^

" ========================= uri ====================
XPT c_uri
$this->uri->`function^(`method^);

XPT c_uriseg
$this->uri->rsegment(`segment_number^);
`^

XPT c_urisega hint=segment array
$this->uri->segment_array();
`^

XPT c_urisegt hint=segment total
$this->uri->total_segments();
`^

XPT c_urisegs hint=segment string
$this->uri->uri_string();
`^
