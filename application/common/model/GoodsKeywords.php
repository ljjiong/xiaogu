<?php
namespace app\common\model;

/*
 *  【商品搜索关键词模型】
 */
class GoodsKeywords extends BaseModel
{
    // 指定数据表
    protected $table = 'work_goods_keywords';

    //类型转换
    protected $type = [
        'id'         => 'integer',
        'search_num' => 'integer',
        'data_state' => 'integer',
    ];

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '')
    {
        if ($page_num && $page_limit) {
            $data = $this->where($where)->order('search_num desc')->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order('search_num desc')->select();
        }

        return $data;
    }

    // 更新商品的热搜词
    public function updateKeyword($keyword)
    {
        $keyword = trim($keyword);
        if ($keyword) {
            $goods_keyword = $this->findOne(['keyword' => $keyword]);
            if ($goods_keyword) {
                $this->where(['keyword' => $keyword])->setInc('search_num', 1);
            } else {
                $this->addOne(['keyword' => $keyword, 'search_num' => 1]);
            }
        }

        return;
    }
}
