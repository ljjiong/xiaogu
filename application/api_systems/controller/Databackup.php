<?php
namespace app\api_systems\controller;

use app\api_init\controller\Rest;
use think\Request;

import('app.api_extend.extend.databackup.Backup');

class Databackup extends Rest
{
    protected $beforeActionList = [
        'checkClientType' => ['except' => 'download'],
        'checkAuth'       => ['except' => 'download'],
        'checkToken'      => ['except' => 'download'],
        'checkAdmin'      => ['except' => 'download'],
    ];

    /**
     * 【数据库】获取已备份的sql文件
     */
    public function index()
    {
        $backup = new \Backup();

        // 已备份的数据库列表
        $files = $backup->fileList();

        $this->data['data'] = $files;

        return $this->data;
    }

    /**
     * 【数据库】备份数据库
     */
    public function backups()
    {
        $backup = new \Backup();

        // 备份数据库
        $tables = $backup->dataList();
        $part   = (WANCLL_ENV == 'prod') ? 2 : 1;
        $file   = ['name' => date('Ymd-His', time()), 'part' => $part];
        foreach ($tables as $key => $value) {
            $start = $backup->setFile($file)->backup($value['name'], 0);
            if ($start !== 0) {
                $this->data['code'] = 0;
                $this->data['msg']  = '数据库备份失败';
                return $this->data;
                break;
            }
        }

        $this->data['msg'] = '数据库备份成功';
        $this->data['test'] = $tables;

        return $this->data;
    }

    /**
     * 【数据库】恢复数据库
     */
    public function recover()
    {
        $time = input('time');
        $part = input('part');
        $file = './data/' . date('Ymd-His', $time) . '-' . $part . '.sql';

        $backup = new \Backup();
        $start  = 0;
        $start  = $backup->setFile($file)->import($start);
        if ($start == 0) {
            $this->data['msg'] = '数据库恢复成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '数据库恢复失败';
        }

        return $this->data;
    }

    /**
     * 【数据库】删除数据库
     */
    public function delete()
    {
        $time = input('time');

        $backup = new \Backup();

        // 删除数据库
        $result = $backup->delFile($time); // 传时间戳
        if ($result === $time) {
            $this->data['msg'] = '数据库文件删除成功';
        } else {
            $this->data['code'] = 0;
            $this->data['msg']  = '数据库文件删除失败';
        }

        return $this->data;
    }

    /**
     * 【数据库】批量删除数据库
     */
    public function batch_delete(Request $request)
    {
        $time_ids = $request->param()['time_ids'];
        $backup   = new \Backup();
        foreach ($time_ids as $time) {
            $result = $backup->delFile($time);
            if ($result !== $time) {
                $this->data['code'] = 0;
                $this->data['msg']  = '批量删除数据库文件失败';
                return $this->data;
                break;
            }
        }

        $this->data['msg'] = '批量删除数据库文件成功';

        return $this->data;
    }

    /**
     * 【数据库】下载数据库
     */
    public function download()
    {
        $time   = input('time');
        $backup = new \Backup();

        // 下载数据库
        $backup->downloadFile($time); // 传时间戳
    }

    /**
     * 【数据库】优化数据库
     */
    public function optimize()
    {
        $backup = new \Backup();

        // 备份数据库
        $tables      = $backup->dataList();
        $deal_tables = [];
        foreach ($tables as $key => $value) {
            $deal_tables[] = $value['name'];
        }
        $result = $backup->optimize($deal_tables);

        $this->data['msg'] = '优化数据库成功';

        return $this->data;
    }

    /**
     * 【数据库】修复数据库
     */
    public function repair()
    {
        $backup = new \Backup();

        // 修复数据库
        $tables      = $backup->dataList();
        $deal_tables = [];
        foreach ($tables as $key => $value) {
            $deal_tables[] = $value['name'];
        }
        $result = $backup->repair($deal_tables);

        $this->data['msg'] = '修复数据库成功';

        return $this->data;
    }

    /*
     * 初始化数据库
     * */
    public function init()
    {
        $backup = new \Backup();

        // 初始化之前先备份数据库
        $tables = $backup->dataList();
        $part   = (WANCLL_ENV == 'prod') ? 2 : 1;
        $file   = ['name' => date('Ymd-His', time()), 'part' => $part];
        foreach ($tables as $key => $value) {
            $start = $backup->setFile($file)->backup($value['name'], 0);
            if ($start !== 0) {
                $this->data['code'] = 0;
                $this->data['msg']  = '数据库备份失败';
                return $this->data;
                break;
            }
        }

        // 初始化数据库
        $this->data = $backup->init();
        return $this->data;
    }
}
