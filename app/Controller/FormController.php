<?php

namespace App\Controller;

use App\Service\Company;
use App\Service\CompanyMatcher;

class FormController extends Controller
{
    public function index()
    {
        $this->render('form.twig');
    }



    public function submit()
    {
        $matchedCompanies = new CompanyMatcher($this->db());
        $matchedCompanies->match();
//        var_dump($matchedCompanies->results());
//
      $this->render('results.twig', [
          'matchedCompanies'  => $matchedCompanies->results(),
      ]);
    }
}