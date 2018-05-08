<?php
namespace app\index\controller;

use app\common\model\Article;
use app\common\model\Group;
use think\Db;

class IndexController extends BaseController
{
    public function index() {

        try {

            //公告
            $noticeGroupId = Db::name("group_role")
                ->where([
                    "group_as" => "notice",
                ])
                ->value("group_id");

            $a          = new Article();
            $noticeList = $a->getList(1, 3, $noticeGroupId);


            //新闻动态
            $newsGroupId = Db::name("group_role")
                ->where([
                    "group_as" => "news",
                ])
                ->value("group_id");

            $g         = new Group();
            $chidGroup = $g->GetList("article", $newsGroupId);

        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }

        $news = [];
        if ($chidGroup) {
            foreach ($chidGroup as $k => $v) {
                if ($k > 1) {
                    break;
                }
                $news[] = [
                    "groupId"   => $v["id"],
                    "groupName" => $v["title"],
                    "list"      => $a->getList(1, 5, $v["id"])[0],
                ];
            }
        }

        $this->assign("noticeGroupId", $noticeGroupId);
        $this->assign("notice", $noticeList[0]);
        $this->assign("news", $news);

        return $this->fetch();
    }
}
