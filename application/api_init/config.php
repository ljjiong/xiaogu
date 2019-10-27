<?php
// +----------------------------------------------------------------------
// | API的配置参数
// +----------------------------------------------------------------------
// | Author: yiyun <jianhaihao@gmail.com>
// +----------------------------------------------------------------------

return [
    'default_return_type' => 'json',

    // API之uri映射关系
    'uri'                 => [
        // 广告
        'api/Advertisements/index'               => 'advertisements#read',
        'api/Advertisements/read'                => 'advertisements#read',
        'api/Advertisements/save'                => 'advertisements#create',
        'api/Advertisements/update'              => 'advertisements#update',
        'api/Advertisements/delete'              => 'advertisements#delete',
        'api/Advertisements/batch_delete'        => 'advertisements#delete',

        // 公告
        'api/Annoncements/index'                 => 'annoncements#read',
        'api/Annoncements/read'                  => 'annoncements#read',
        'api/Annoncements/save'                  => 'annoncements#create',
        'api/Annoncements/update'                => 'annoncements#update',
        'api/Annoncements/delete'                => 'annoncements#delete',
        'api/Annoncements/batch_delete'          => 'annoncements#delete',

        // 文章
        'api/Articles/index'                     => 'articles#read',
        'api/Articles/read'                      => 'articles#read',
        'api/Articles/save'                      => 'articles#create',
        'api/Articles/update'                    => 'articles#update',
        'api/Articles/delete'                    => 'articles#delete',
        'api/Articles/batch_delete'              => 'articles#delete',
        'api/Articles/batch_on_line'             => 'articles#update',
        'api/Articles/batch_off_line'            => 'articles#update',

        // 文章分类
        'api/ArticleTypes/index'                 => 'article_types#read',
        'api/ArticleTypes/read'                  => 'article_types#read',
        'api/ArticleTypes/save'                  => 'article_types#create',
        'api/ArticleTypes/update'                => 'article_types#update',
        'api/ArticleTypes/index_tree'            => 'article_types#read',
        'api/ArticleTypes/delete'                => 'article_types#delete',
        'api/ArticleTypes/batch_delete'          => 'article_types#delete',
        'api/ArticleTypes/lists'                 => 'article_types#read',

        // 图片资源
        'api/Resources/index'                    => 'resources#read',
        'api/Resources/read'                     => 'resources#read',
        'api/Resources/save'                     => 'resources#create',
        'api/Resources/update'                   => 'resources#update',
        'api/Resources/delete'                   => 'resources#delete',
        'api/Resources/batch_delete'             => 'resources#delete',

        // 友情链接
        'api/FriendlyLinks/index'                => 'friendly_links#read',
        'api/FriendlyLinks/read'                 => 'friendly_links#read',
        'api/FriendlyLinks/save'                 => 'friendly_links#create',
        'api/FriendlyLinks/update'               => 'friendly_links#update',
        'api/FriendlyLinks/delete'               => 'friendly_links#delete',
        'api/FriendlyLinks/batch_delete'         => 'friendly_links#delete',

        // 用户反馈
        'api/Feedbacks/index'                    => 'feedbacks#read',
        'api/Feedbacks/read'                     => 'feedbacks#read',
        'api/Feedbacks/save'                     => 'feedbacks#create',
        'api/Feedbacks/update'                   => 'feedbacks#update',
        'api/Feedbacks/delete'                   => 'feedbacks#delete',
        'api/Feedbacks/batch_delete'             => 'feedbacks#delete',

        // 规则
        'api/Rules/index'                        => 'rules#read',
        'api/Rules/read'                         => 'rules#read',
        'api/Rules/save'                         => 'rules#create',
        'api/Rules/update'                       => 'rules#update',
        'api/Rules/delete'                       => 'rules#delete',

        // 指导手册
        'api/Guides/index'                       => 'guides#read',
        'api/Guides/read'                        => 'guides#read',
        'api/Guides/save'                        => 'guides#create',
        'api/Guides/update'                      => 'guides#update',
        'api/Guides/delete'                      => 'guides#delete',
        'api/Guides/batch_delete'                => 'guides#delete',

        // 基础信息
        'api/Basics/index'                       => 'basics#read',
        'api/Basics/read'                        => 'basics#read',
        'api/Basics/save'                        => 'basics#create',
        'api/Basics/update'                      => 'basics#update',
        'api/Basics/delete'                      => 'basics#delete',

        // banners
        'api/Banners/index'                      => 'banners#read',
        'api/Banners/read'                       => 'banners#read',
        'api/Banners/save'                       => 'banners#create',
        'api/Banners/update'                     => 'banners#update',
        'api/Banners/delete'                     => 'banners#delete',
        'api/Banners/batch_delete'               => 'banners#delete',

        // 订单
        'api/Orders/index'                       => 'orders#read',
        'api/Orders/read'                        => 'orders#read',
        'api/Orders/save'                        => 'orders#create',
        'api/Orders/update'                      => 'orders#update',
        'api/Orders/delete'                      => 'orders#delete',
        'api/Orders/batch_delete'                => 'orders#delete',
        'api/Orders/lists'                       => 'orders#read',

        // 地址
        'api/Addresses/index'                    => 'addresses#read',
        'api/Addresses/read'                     => 'addresses#read',
        'api/Addresses/save'                     => 'addresses#create',
        'api/Addresses/update'                   => 'addresses#update',
        'api/Addresses/delete'                   => 'addresses#delete',
        'api/Addresses/batch_delete'             => 'addresses#delete',

        // 购物车
        'api/Carts/index'                        => 'carts#read',
        'api/Carts/read'                         => 'carts#read',
        'api/Carts/save'                         => 'carts#create',
        'api/Carts/update'                       => 'carts#update',
        'api/Carts/delete'                       => 'carts#delete',
        'api/Carts/batch_delete'                 => 'carts#delete',

        // 会员
        'api/Users/index'                        => 'users#read',
        'api/Users/read'                         => 'users#read',
        'api/Users/save'                         => 'users#create',
        'api/Users/update'                       => 'users#update',
        'api/Users/delete'                       => 'users#delete',
        'api/Users/batch_delete'                 => 'users#delete',
        'api/Users/batch_pull_black'             => 'users#update',
        'api/Users/batch_recover_black'          => 'users#update',
        'api/Users/batch_recover_normal'         => 'users#update',

        // 模块
        'api/Modules/index'                      => 'modules#read',
        'api/Modules/read'                       => 'modules#read',
        'api/Modules/save'                       => 'modules#create',
        'api/Modules/update'                     => 'modules#update',
        'api/Modules/index_all'                  => 'modules#read',
        'api/Modules/delete'                     => 'modules#delete',

        // 商品收藏
        'api/GoodsCollections/index'             => 'goods_collections#read',
        'api/GoodsCollections/read'              => 'goods_collections#read',
        'api/GoodsCollections/save'              => 'goods_collections#create',
        'api/GoodsCollections/update'            => 'goods_collections#update',
        'api/GoodsCollections/index_all'         => 'goods_collections#read',
        'api/GoodsCollections/delete'            => 'goods_collections#delete',
        'api/GoodsCollections/batch_delete'      => 'goods_collections#delete',

        // 商品分类
        'api/GoodsCates/index'                   => 'goods_cates#read',
        'api/GoodsCates/read'                    => 'goods_cates#read',
        'api/GoodsCates/save'                    => 'goods_cates#create',
        'api/GoodsCates/update'                  => 'goods_cates#update',
        'api/GoodsCates/index_all'               => 'goods_cates#read',
        'api/GoodsCates/delete'                  => 'goods_cates#delete',
        'api/GoodsCates/lists'                   => 'goods_cates#read',

        // 商品
        'api/Goods/index'                        => 'goods#read',
        'api/Goods/read'                         => 'goods#read',
        'api/Goods/save'                         => 'goods#create',
        'api/Goods/update'                       => 'goods#update',
        'api/Goods/index_all'                    => 'goods#read',
        'api/Goods/delete'                       => 'goods#delete',
        'api/Goods/batch_delete'                 => 'goods#delete',
        'api/Goods/batch_on_line'                => 'goods#read',
        'api/Goods/batch_off_line'               => 'goods#read',

        // 商品收藏
        'api/GoodsComments/index'                => 'goods_comments#read',
        'api/GoodsComments/read'                 => 'goods_comments#read',
        'api/GoodsComments/save'                 => 'goods_comments#create',
        'api/GoodsComments/update'               => 'goods_comments#update',
        'api/GoodsComments/index_all'            => 'goods_comments#read',
        'api/GoodsComments/delete'               => 'goods_comments#delete',

        // 优惠券
        'api/Coupons/index'                      => 'coupons#read',
        'api/Coupons/read'                       => 'coupons#read',
        'api/Coupons/save'                       => 'coupons#create',
        'api/Coupons/update'                     => 'coupons#update',
        'api/Coupons/index_all'                  => 'coupons#read',
        'api/Coupons/delete'                     => 'coupons#delete',

        // 角色
        'api/Roles/index'                        => 'roles#read',
        'api/Roles/read'                         => 'roles#read',
        'api/Roles/save'                         => 'roles#create',
        'api/Roles/update'                       => 'roles#update',
        'api/Roles/api_powers'                   => 'roles#update',
        'api/Roles/nav_powers'                   => 'roles#update',
        'api/Roles/lists'                        => 'roles#read',
        'api/Roles/delete'                       => 'roles#delete',

        // 菜单
        'api/Navs/index'                         => 'navs#read',
        'api/Navs/read'                          => 'navs#read',
        'api/Navs/save'                          => 'navs#create',
        'api/Navs/update'                        => 'navs#update',
        'api/Navs/delete'                        => 'navs#delete',
        'api/Navs/batch_delete'                  => 'navs#delete',
        'api/Navs/batch_show'                    => 'navs#update',
        'api/Navs/batch_hide'                    => 'navs#update',

        // 管理员
        'api/Admins/index'                       => 'admins#read',
        'api/Admins/read'                        => 'admins#read',
        'api/Admins/save'                        => 'admins#create',
        'api/Admins/update'                      => 'admins#update',
        'api/Admins/delete'                      => 'admins#delete',

        // 参数
        'api/Params/index'                       => 'params#read',
        'api/Params/read'                        => 'params#read',
        'api/Params/save'                        => 'params#create',
        'api/Params/update'                      => 'params#update',
        'api/Params/delete'                      => 'params#delete',
        'api/Params/batch_update'                => 'params#update',

        // 查询类
        'api/Query/shop_goods_cates'             => 'query#read',
        'api/Query/datadict'                     => 'query#read',
        'api/Query/goods_is_collect'             => 'query#read',
        'api/Query/default_address'              => 'query#read',

        // 数据字典
        'api/Dds/index'                          => 'dds#read',
        'api/Dds/read'                           => 'dds#read',
        'api/Dds/save'                           => 'dds#create',
        'api/Dds/update'                         => 'dds#update',
        'api/Dds/delete'                         => 'dds#delete',
        'api/Dds/add_key'                        => 'dds#create',
        'api/Dds/edit_key'                       => 'dds#update',
        'api/Dds/del_key'                        => 'dds#delete',
        'api/Dds/get_key'                        => 'dds#read',
        'api/Dds/keys_index'                     => 'dds#read',
        'api/Dds/add_value'                      => 'dds#create',
        'api/Dds/edit_value'                     => 'dds#update',
        'api/Dds/del_value'                      => 'dds#delete',
        'api/Dds/get_value'                      => 'dds#read',
        'api/Dds/values_index'                   => 'dds#read',

        'api/DataCounts/info'                    => 'data_counts#read',
        'api/DataCounts/all'                     => 'data_counts#read',

        //资产管理
        'api/AsstesSupervise/index'              => 'asstes_supervise#read',
        'api/AsstesSupervise/detail'             => 'asstes_supervise#read',
        'api/AsstesSupervise/via'                => 'asstes_supervise#update',
        'api/AsstesSupervise/refuse'             => 'asstes_supervise#update',
        'api/AsstesSupervise/user_wallet_detail' => 'asstes_supervise#read',
        'api/AsstesSupervise/wallet_edit'        => 'asstes_supervise#update',

        // 商品规格模型
        'api/SpecModels/index'                   => 'spec_models#read',
        'api/SpecModels/read'                    => 'spec_models#read',
        'api/SpecModels/save'                    => 'spec_models#create',
        'api/SpecModels/update'                  => 'spec_models#update',
        'api/SpecModels/delete'                  => 'spec_models#delete',
        'api/SpecModels/batch_delete'            => 'spec_models#delete',

        // 商品规格
        'api/Specs/index'                        => 'specs#read',
        'api/Specs/read'                         => 'specs#read',
        'api/Specs/save'                         => 'specs#create',
        'api/Specs/update'                       => 'specs#update',
        'api/Specs/delete'                       => 'specs#delete',
        'api/Specs/batch_delete'                 => 'specs#delete',
        'api/Specs/lists'                        => 'specs#read',

        // 商品属性模板
        'api/AttrModels/index'                   => 'attr_models#read',
        'api/AttrModels/read'                    => 'attr_models#read',
        'api/AttrModels/save'                    => 'attr_models#create',
        'api/AttrModels/update'                  => 'attr_models#update',
        'api/AttrModels/delete'                  => 'attr_models#delete',
        'api/AttrModels/batch_delete'            => 'attr_models#delete',

        // 商品属性
        'api/Attrs/index'                        => 'attrs#read',
        'api/Attrs/read'                         => 'attrs#read',
        'api/Attrs/save'                         => 'attrs#create',
        'api/Attrs/update'                       => 'attrs#update',
        'api/Attrs/delete'                       => 'attrs#delete',
        'api/Attrs/batch_delete'                 => 'attrs#delete',
        'api/Attrs/lists'                        => 'attrs#read',

        // 商品运费模板
        'api/TransportModels/index'              => 'transport_models#read',
        'api/TransportModels/read'               => 'transport_models#read',
        'api/TransportModels/save'               => 'transport_models#create',
        'api/TransportModels/update'             => 'transport_models#update',
        'api/TransportModels/delete'             => 'transport_models#delete',
        'api/TransportModels/batch_delete'       => 'transport_models#delete',

        // 七牛
        'api/Qiniu/index'                        => 'qiniu#read',
        'api/Qiniu/read'                         => 'qiniu#read',
        'api/Qiniu/save'                         => 'qiniu#create',
        'api/Qiniu/update'                       => 'qiniu#update',
        'api/Qiniu/delete'                       => 'qiniu#delete',
        'api/Qiniu/batch_delete'                 => 'qiniu#delete',
        'api/Qiniu/lists'                        => 'qiniu#read',

        // 数据库备份与恢复
        'api/Databackup/backups'                 => 'databackup#create',
        'api/Databackup/recover'                 => 'databackup#update',
        'api/Databackup/lists'                   => 'databackup#read',
        'api/Databackup/delete'                  => 'databackup#delete',
        'api/Databackup/batch_delete'            => 'databackup#delete',
        'api/Databackup/download'                => 'databackup#read',
        'api/Databackup/optimize'                => 'databackup#update',
        'api/Databackup/repair'                  => 'databackup#update',

        // 邮件系统
        'api/Email/send'                         => 'email#create',
        'api/Email/get_from_email'               => 'email#read',
    ],
];
