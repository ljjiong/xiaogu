<?php
/*
 * 树助手类
 * */

class Tree
{
    /*
     * 将数据数组转化为以主键为索引的数据数据
     * */
    public static function toIdIndex($lists)
    {
        $id_lists = [];

        foreach ($lists as $item) {
            $id_lists[$item['id']] = $item;
        }

        return $id_lists;
    }
    /*
     *
     *  判断指定id是否是指定pid的（直接或间接）子分类
     * */
    public static function check_is_son($lists, $pid, $id, $hadChangeFormat = true)
    {
        // 未转换成已id为索引数组的，转化之
        if(!$hadChangeFormat){
            $lists = static::toIdIndex($lists);
        }

        return static::recu_check_is_son($lists, $pid, $id);
    }

    /*
     * 获取指定id的所有父分类id
     * */
    public static function get_parent_ids($lists, $id, $hadChangeFormat = true)
    {
        // 未转换成已id为索引数组的，转化之
        if(!$hadChangeFormat){
            $lists = static::toIdIndex($lists);
        }
        $ids = [];   // 父类id数组
        static::recu_get_parent_ids($lists, $id, $ids);
        return $ids;
    }

    private static function recu_check_is_son($lists, $pid, $id)
    {
        // 结束条件1：指定id分类不存在
        if(!isset($lists[$id])){
            return false;
        }

        $this_pid = $lists[$id]['pid'];
        // 结束条件2:顶层分类了
        if($this_pid == 0){
            return false;
        }

        if($pid == $this_pid){
            return true;
        }else{
            return static::recu_check_is_son($lists, $pid, $this_pid);
        }
    }

    /*
     * 递归获取指定id的所有父分类id
     * */
    private static function recu_get_parent_ids($lists, $id, &$ids)
    {
        // 结束条件1：指定id分类不存在
        if(!isset($lists[$id])){
            return false;
        }

        $pid = $lists[$id]['pid'];
        // 结束条件2:顶层分类了
        if($pid == 0){
            return false;
        }

        $ids[] = $pid;
        return static::recu_get_parent_ids($lists, $pid, $ids);
    }

    /**
     * 把返回的数据集转换成Tree
     */
    public static function list_to_tree($list, $pk = 'id', $pid = 'pid', $child = '_child', $root = 0)
    {
        // 创建Tree
        $tree = array();
        if (is_array($list)) {
            // 创建基于主键的数组引用
            $refer = array();
            foreach ($list as $key => $data) {
                $refer[$data[$pk]] = &$list[$key];
            }
            foreach ($list as $key => $data) {
                // 判断是否存在parent
                $parentId = $data[$pid];
                if ($root == $parentId) {
                    $tree[] = &$list[$key];
                } else {
                    if (isset($refer[$parentId])) {
                        $parent           = &$refer[$parentId];
                        $parent[$child][] = &$list[$key];
                    }
                }
            }
        }

        return $tree;
    }
    /**
     * 获取任意指定id的分类树
     */
    public static function get_one_tree($list, $id)
    {
        // 创建Tree
        $tree = array();
        if (is_array($list)) {
            // 创建基于主键的数组引用
            $refer = array();
            foreach ($list as $key => $data) {
                $refer[$data['id']] = &$list[$key];
            }
            foreach ($list as $key => $data) {
                // 判断是否存在parent
                $parentId = $data['pid'];
                if ($data['id'] == $id) {
                    $tree[] = &$list[$key];
                } else {
                    if (isset($refer[$parentId])) {
                        $parent           = &$refer[$parentId];
                        $parent['_child'][] = &$list[$key];
                    }
                }
            }
        }
        return $tree;
    }
}