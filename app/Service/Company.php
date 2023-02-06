<?php

namespace App\Service;

class Company
{
    private $db;
    private $name;
    private $postcode;
    private $bedrooms;
    private $type;

    public function __construct(\PDO $db,$company_id=0)
    {
        $this->db = $db;

        if($company_id>0){
            $sql="select * from company where id=".$company_id;
            $company_data = $this->db->query($sql)->fetch();
           $this->name=$company_data['name'];
            $this->postcode=$company_data['postcode'];
            $this->bedrooms=$company_data['bedrooms'];
            $this->type=$company_data['type'];


        }
    }

    /**
     * @return mixed
     */
    public function getBedrooms()
    {
        return $this->bedrooms;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @return mixed
     */
    public function getPostcode()
    {
        return $this->postcode;
    }

    public function set_values(){


        $this->name = $_POST['company_name'];
        $this->postcode=  $_POST['post_code'];
        $this->bedrooms= $_POST['bed_rooms'];
        $this->type= $_POST['type'];

    }

    public function add_company(){


        $this->set_values();

        $sql = 'INSERT INTO company(name,postcode,bedrooms,type) VALUES(:name,:postcode,:bedrooms,:type)';

        $statement = $this->db->prepare($sql);

        $statement->execute([
            ':name' => $this->name,
            ':postcode'=>$this->postcode,
            ':bedrooms'=>$this->bedrooms,
            ':type'=>$this->type
        ]);

        var_dump("new company added@".$this->db->lastInsertId());
    }
}