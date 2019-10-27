<?php
/**
 *  数据字典sql操作
 **/
class ddsql
{
    private $pdo;

    /**
     * 【dd】初始化参数
     */
    public function __construct()
    {
        $config = config('database');

        $db_type     = $config['type']; //数据库类型
        $db_host     = $config['hostname']; //数据库主机名
        $db_name     = $config['database']; //使用的数据库
        $db_user     = $config['username']; //数据库连接用户名
        $db_password = $config['password']; //数据库连接密码
        $dsn         = $db_type . ':host=' . $db_host . ';port=3306;dbname=' . $db_name;

        // 实例化PDO对象
        $this->pdo = new \PDO($dsn, $db_user, $db_password);
        $this->pdo->exec("set character set 'utf8'"); //读库字符设置
        $this->pdo->exec("set names 'utf8'"); //写库字符设置
    }

    /**
     * 【dd】创建数据表
     */
    public function create_table($table)
    {
        $table = 'work_custom_' . $table;

        $query  = "CREATE TABLE `$table` (`id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',PRIMARY KEY (`id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8";
        $result = $this->pdo->exec($query);
        if (!$result) {
            return ['code' => 1, 'msg' => '创建数据表成功'];
        } else {
            return ['code' => 0, 'msg' => '创建数据表失败'];
        }
    }

    /**
     * 【dd】增加数据表列
     */
    public function add_field($table, $attr, $abbr, $type)
    {
        $table = 'work_custom_' . $table;

        $query  = "ALTER TABLE `$table` ADD `$abbr` text COMMENT '$type|$attr'";
        $result = $this->pdo->exec($query);
        return ['code' => 1, 'msg' => '增加数据表列成功'];
    }

    /**
     * 【dd】修改数据表列
     */
    public function mod_field($table, $attr, $abbr, $type)
    {
        $table = 'work_custom_' . $table;

        $query  = "ALTER TABLE `$table` MODIFY COLUMN `$abbr` text COMMENT '$type|$attr'";
        $result = $this->pdo->exec($query);
        if (!$result) {
            return ['code' => 1, 'msg' => '修改数据表列成功'];
        } else {
            return ['code' => 0, 'msg' => '修改数据表列失败'];
        }
    }

    /**
     * 【dd】查看数据表列
     */
    public function get_field($table, $field)
    {
        $table = 'work_custom_' . $table;

        $query = $this->pdo->prepare("show full columns from `$table`");
        $query->execute();
        $result = $query->fetchAll();

        $info = [];
        foreach ($result as $key => $value) {
            if ($value['Field'] == $field) {
                $comment = explode('|', $value['Comment']);

                $info['abbr'] = $value['Field'];
                $info['attr'] = $comment[1];
                $info['type'] = (int) $comment[0];
                break;
            }
        }

        return ['code' => 1, 'msg' => '读取数据表列信息成功', 'data' => $info];
    }

    /**
     * 【dd】删除数据表列
     */
    public function del_field($table, $abbr)
    {
        $table = 'work_custom_' . $table;

        $query  = "ALTER table `$table` DROP `$abbr`";
        $result = $this->pdo->exec($query);
        if (!$result) {
            return ['code' => 1, 'msg' => '删除数据表列成功'];
        } else {
            return ['code' => 0, 'msg' => '删除数据表列失败'];
        }
    }

    /**
     * 【dd】删除数据表
     */
    public function del_table($table)
    {
        $table = 'work_custom_' . $table;

        $query  = "DROP TABLE `$table`";
        $result = $this->pdo->exec($query);
        if (!$result) {
            return ['code' => 1, 'msg' => '删除数据表成功'];
        } else {
            return ['code' => 0, 'msg' => '删除数据表失败'];
        }
    }

    /**
     * 【dd】读取数据表信息
     */
    public function table_info($table)
    {
        $table = 'work_custom_' . $table;

        $query = $this->pdo->prepare("show full columns from `$table`");
        $query->execute();
        $result = $query->fetchAll();

        $info = [];
        foreach ($result as $key => $value) {
            if ($value['Field'] == 'id') {
                continue;
            }

            $comment = explode('|', $value['Comment']);

            $info[$key]['abbr'] = $value['Field'];
            $info[$key]['attr'] = $comment[1];
            $info[$key]['type'] = (int) $comment[0];
        }

        return ['code' => 1, 'msg' => '读取数据表信息成功', 'data' => array_values($info)];
    }
}
