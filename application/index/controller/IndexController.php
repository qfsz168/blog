<?php

namespace app\index\controller;

use app\adm\model\Config;
use app\common\model\Group;
use think\Controller;

class IndexController extends Controller
{
	public function index()
	{
		$c    = new Config();
		$aid  = $c->getValue("syaid");
		$this->redirect(url("Article/content", ["id" => $aid]));

		return $this->fetch();
	}
}
