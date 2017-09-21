<?php

class Category extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('category_model');
        $this->load->model('news_model');
        $this->load->helper('url_helper');
    }

    // RETRIEVES NEWS FROM DATABASE
    public function index() {

        /*$data = array();
        $data[0]  = array('id' => 1, 'name' => 'News');
        $data[2]  = array('id' => 2, 'name' => 'Sport');
        $data[3]  = array('id' => 3, 'name' => 'Fashion');
         * 
         */
        $data = $this->category_model->get_by_id();
        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($data));
    }
    public function get_news() {
        $cat_id = $this->input->get('cat_id', TRUE);

        /*$data = array();
        $data[0]  = array('id' => 1, 'name' => 'News');
        $data[2]  = array('id' => 2, 'name' => 'Sport');
        $data[3]  = array('id' => 3, 'name' => 'Fashion');
         * 
         */
        $data = $this->news_model->get_by_cat_id($cat_id);
        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($data));
    }
    

}
