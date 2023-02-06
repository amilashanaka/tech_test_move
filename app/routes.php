<?php

return [
    '/form' => [
        [
            'type'      => 'GET',
            'handler'   => 'FormController@index',   
        ],[
            'type' =>'POST',
            'handler'=> 'FormController@submit',
        ],
    ],
    '/add'=>[
        [
            'type'=>'GET',
            'handler'=> 'CompanyController@index',

        ],[
            'type'=>'POST',
            'handler'=> 'CompanyController@add_company',
        ],
    ]
];