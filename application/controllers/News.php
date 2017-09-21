<?php

class News extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('news_model');
        $this->load->helper('url_helper');
    }

    // RETRIEVES NEWS FROM DATABASE
    public function view() {

        $data = $this->news_model->get_news();

        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($data));
    }
    
    // RETRIEVES NEWS FROM DATABASE
    public function item($id) {
        //$data['id'] = "this is the id " . $id;
        $data = $this->news_model->get_news($id);

        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($data));
    }

    // INSERT NEWS IN DATABASE
    public function create() {
        //print_r($this->session->userdata());
        if(!$this->session->userdata('user_id') || $this->session->userdata('role') != USER_ADMIN) {
            echo "Not authorized to create post";
            exit;
        }
            
        $this->news_model->set_news();
        $data = array('status' => 1);
        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($data));
    }
    public function edit() {
        //print_r($this->session->userdata());
        if(!$this->session->userdata('user_id') || $this->session->userdata('role') != USER_ADMIN) {
            echo "Not authorized to create post";
            exit;
        }
            
        $this->news_model->set_news();
        $data = array('status' => 1);
        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($data));
    }

}
