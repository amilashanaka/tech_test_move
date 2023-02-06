<?php

namespace App\Controller;

use App\Service\Company;

class CompanyController extends Controller
{

    public function index(){

        $this->render('new_company.twig');
    }

    public function add_company(){
        $company = new Company($this->db());
        $company->add_company();

    }

}