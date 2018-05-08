<?php
/**
 * Created by PhpStorm.
 * User: 王崇全
 * Date: 2018/1/4
 * Time: 15:16
 */

namespace app\common\model;


use think\Db;
use think\Model;

class GroupRole extends Model
{
    const GROUP_AS = [
        "news",
        "notice",
    ];

    /**
     * setGroupAsAttr
     * @author 王崇全
     * @date
     * @param $value
     * @param $data
     * @return void
     * @throws \Exception
     */
    protected function setGroupAsAttr($value, $data) {
        if (!in_array($value, self::GROUP_AS)) {
            throw new \Exception("组类型错误");
        }
    }

    /**
     * setRole
     * @author 王崇全
     * @date
     * @param string $groupId
     * @param string $role
     * @return void
     * @throws \Exception
     */
    public function setRole(string $groupId, string $role) {
        if (!in_array($role, self::GROUP_AS)) {
            throw new \Exception("组类型错误");
        }

        $info = $this->where([
            "group_id" => $groupId,
            "group_as" => $role,
        ])
            ->value("id");
        if ($info) {
            return;
        }

        Db::startTrans();
        try {

            $this->where([
                "group_as" => $role,
            ])
                ->delete();

            $this->insert([
                "group_id" => $groupId,
                "group_as" => $role,
            ]);

        } catch (\Exception $e) {
            Db::rollback();
            throw new \Exception($e->getMessage());
        }
        Db::commit();
    }

}