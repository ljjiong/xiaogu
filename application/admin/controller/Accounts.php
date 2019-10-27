<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;

class Accounts extends Controller
{
    public function ie()
    {
        return view();
    }

    public function login()
    {
        if (Request::instance()->isMobile()) {
            echo "<h1 style='text-align:center;position:absolute;top:45%;width:100%;'>暂不支持手机端，请在PC端打开！</h1>";
        } else {
            return view();
        }
    }

    public function login_new()
    {
        if (Request::instance()->isMobile()) {
            echo "<h1 style='text-align:center;position:absolute;top:45%;width:100%;'>暂不支持手机端，请在PC端打开！</h1>";
        } else {
            return view();
        }
    }
}
