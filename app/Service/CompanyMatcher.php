<?php

namespace App\Service;

class CompanyMatcher
{
    private $db;

    private $req_post_code_prefix;  // Requested company Post code Prefix

    private $req_no_of_bed_rooms; // Requested number of Beds in company

    private $req_type;// Requested company type

    private $matches = [];

    public function __construct(\PDO $db)
    {
        $this->db = $db;

    }



    public function set_values(){

        $this->req_post_code_prefix=substr($_POST['postcode'],0,2);
        $this->req_no_of_bed_rooms=$_POST['bedrooms'];
        $this->req_type=$_POST['type'];
    }


    public function match()
    {
        $this->set_values();



        $sql="select id from company where bedrooms='".$this->req_no_of_bed_rooms."' and type='".$this->req_type."' and postcode like '".$this->req_post_code_prefix."%' ORDER BY RAND() LIMIT 3";


        $data = $this->db->query($sql)->fetchAll();
        $i=0;
        foreach ($data as $row) {
            $this->matches[$i] = new Company( $this->db,$row['id']);
            $i++;
        }





    }

    public function pick(int $count)
    {
        
    }

    public function results(): array
    {
        return $this->matches;
    }

    public function deductCredits()
    {
        
    }
}
