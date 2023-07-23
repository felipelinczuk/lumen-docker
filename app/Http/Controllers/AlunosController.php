<?php

namespace App\Http\Controllers;
use App\Models\Aluno;

class AlunosController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        
    }

    public function index(){
        return Aluno::all();
    }
}
