<?php
namespace app\common\model;

/*
 *  【产品模型】
 */
class Goods extends BaseModel
{
    // 指定数据表
    protected $table = 'work_goods';

    //类型转换
    protected $type = [
        'id'                  => 'integer',
        'goods_cate_id'       => 'integer',
        'is_virtual'          => 'boolean',
        'is_common'           => 'integer',
        'imgs'                => 'json',
        'tags'                => 'json',
        'tag_ids'             => 'json',
        'attr_info'           => 'json',
        'spec_info'           => 'json',
        'stock'               => 'integer',
        'weight'              => 'float',
        'cost_price'          => 'float',
        // 'sell_price'          => 'float',
        'market_price'        => 'float',
        'red_price'           => 'float',
        'sell_num'            => 'integer',
        'click_num'           => 'integer',
        'collect_num'         => 'integer',
        'sort'                => 'integer',
        'is_top'              => 'boolean',
        'score'               => 'integer',
        'buy_get_score'       => 'integer',
        'status'              => 'integer',
        'freight_template_id' => 'integer',
        'data_state'          => 'integer',
    ];

    // 定义全局的查询范围
    protected function base($query)
    {
        // $query->where('data_state', 1);
    }

    // 获取器【thum】
    public function getThumAttr($value, $data)
    {
        return show_upload_img($value);
    }

    // 获取器【imgs】
    public function getImgsAttr($value, $data)
    {
        $imgs = json_decode($value);
        foreach ($imgs as $key => $img) {
            $imgs[$key] = show_upload_img($img);
        }

        return $imgs;
    }

    // 获取器【desc】
    public function getDescAttr($value, $data)
    {
        $data_value = htmlspecialchars_decode($value);
        $str        = 'src="' . get_host() . '/public/upload/ueditor';
        $real_value = str_replace('src="/public/upload/ueditor', $str, $data_value);
        return $real_value;
    }

    // 获取器【goods_cate_name】
    public function getGoodsCateNameAttr($value, $data)
    {
        $goods_cate = model('goods_cates')->getOne($data['goods_cate_id']);
        if ($goods_cate) {
            $goods_cate_name = $goods_cate['name'];
        } else {
            $goods_cate_name = '';
        }

        return $goods_cate_name;
    }

    // 获取器【goods_cate_name】
    public function getSpecGroupInfoAttr($value, $data)
    {
        $spec_group_info = model('goods_spec_groups')->getAll(['goods_id' => $data['id']]);
        return $spec_group_info ? $spec_group_info : [];
    }

    // 初始化
    protected static function init()
    {
        // 新增或更新时处理图片
        self::beforeWrite(function ($model) {
            if (isset($model->data['thum'])) {
                $model->thum = base64_to_img([$model->data['thum']],500,500)[0];
            }

            if (isset($model->data['imgs'])) {
                $model->imgs = deal_upload_img(json_decode($model->data['imgs'], true));
            }
        });
    }

    // 查询全部(含分页)
    public function getAll($where = [], $page_num = '', $page_limit = '', $sort_by = 'all', $sort_type = 'desc')
    {
        switch ($sort_by) {
            // 综合排序
            case 'all':
                if ($sort_type == 'desc') {
                    $order_by = 'is_top desc,sort desc,id desc';
                } else {
                    $order_by = 'is_top asc,sort asc,id asc';
                }
                break;
            // 销量排序
            case 'sell_num':
                if ($sort_type == 'desc') {
                    $order_by = 'sell_num desc';
                } else {
                    $order_by = 'sell_num asc';
                }
                break;
            // 新品排序
            case 'new_goods':
                if ($sort_type == 'desc') {
                    $order_by = 'id desc';
                } else {
                    $order_by = 'id asc';
                }
                break;
            // 价格排序
            case 'sell_price':
                if ($sort_type == 'desc') {
                    $order_by = 'sell_price desc';
                } else {
                    $order_by = 'sell_price asc';
                }
                break;
            default:
                if ($sort_type == 'desc') {
                    $order_by = 'is_top desc,sort desc,id desc';
                } else {
                    $order_by = 'is_top asc,sort asc,id asc';
                }
                break;
        }

        $where['data_state'] = 1;

        if ($page_num && $page_limit) {
            $data = $this->where($where)->order($order_by)->page($page_num, $page_limit)->select();
        } else {
            $data = $this->where($where)->order($order_by)->select();
        }

        foreach ($data as $key => $value) {
            $data[$key]['goods_cate_name'] = '';
            $data[$key]['spec_group_info'] = '';
        }

        return $data;
    }

    // 查询统计
    public function getAllCount($where)
    {
        $where['data_state'] = 1;
        return $this->where($where)->count();
    }

    // 查询单条数据
    public function getOne($id)
    {
        $data = $this->where('id', $id)->find();
        if ($data) {
            $data['goods_cate_name'] = '';
            $data['spec_group_info'] = '';
        }

        return $data;
    }

    // 更新字段
    public function updateNum($id, $type, $field, $num)
    {
        switch ($type) {
            case '+':
                $this->where('id', $id)->setInc($field, $num);
                break;
            case '-':
                $this->where('id', $id)->setDec($field, $num);
                break;
            default:
                # code...
                break;
        }
    }

    // 查询产品的基本信息
    public function getOneBasicInfo($id)
    {
        return $this->where('id', $id)->field('id,name,thum,sell_price')->find();
    }

    // 关联规格
    public function specGroupsInfo()
    {
        return $this->hasMany('GoodsSpecGroups', 'goods_id', 'id');
    }
}
