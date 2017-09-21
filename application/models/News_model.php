<?php

class News_model extends CI_Model {

    public function __construct() {
        $this->load->database();
    }

    public function get_by_id($slug = FALSE) {
        $sql = "SELECT news.*, category.category_name  FROM news JOIN
                category on news.category_id = category.id";
        if ($slug === FALSE) {
       
            $query = $this->db->query($sql);
            return $query->result_array();
        }
        $sql .= " Where news.id = ?";
        $query = $this->db->query($sql, array($slug));
        return $query->row_array();
    }

    public function get_news($id = False) {
        $sql = "SELECT news.*, category.category_name  FROM news JOIN
                category on news.category_id = category.id";
        if ($id === FALSE) {
            $query = $this->db->query($sql);
            return $query->result_array();
        }
        $sql .= " Where news.id = ?";
        $query = $this->db->query($sql, array($id));

        return $query->row_array();
    }

    public function get_by_cat_id($id = False) {

        $sql = "SELECT news.*, category.category_name  FROM news JOIN
                category on news.category_id = category.id";
        if ($id === FALSE) {
            $query = $this->db->query($sql);
            return $query->result_array();
        }

        $sql .= " Where category.id = ?";
        $query = $this->db->query($sql, array($id));

        return $query->result_array();
    }

    public function set_news() {
        $this->load->helper('url');

        $slug = url_title($_POST['title'], 'dash', TRUE);


        $data = array(
            'title' => $_POST['title'],
            'slug' => $slug,
            'intro' => $_POST['intro'],
            'category_id' => $_POST['category_id'],
            'content' => $_POST['content']
        );
        if ($_POST['id']) {
            $this->db->update('news', $data, array('id' => $_POST['id']));
        } else {
            $this->db->insert('news', $data);
        }
        return 1;
    }

}
