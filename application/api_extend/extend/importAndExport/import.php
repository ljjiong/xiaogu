<?php

/**
 *  数据导入
 **/

require_once "extend/PHPExcel/PHPExcel.php";

class import
{
    /**
     *  数据导入
     * @param string $file excel文件
     * @param string $sheet
     * @return string   返回解析数据
     * @throws PHPExcel_Exception
     * @throws PHPExcel_Reader_Exception
     */
    public function importExecl($file = '', $sheet = 0)
    {
        $file = iconv("gb2312", "utf-8", $file); //转码
        if (empty($file) or !file_exists($file)) {
            die('file not exists!');
        }

        $objRead = new PHPExcel_Reader_Excel2007(); //建立reader对象
        if (!$objRead->canRead($file)) {
            $objRead = new PHPExcel_Reader_Excel5();
            if (!$objRead->canRead($file)) {
                die('No Excel!');
            }
        }

        $cellName = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ');

        $obj       = $objRead->load($file); //建立excel对象
        $currSheet = $obj->getSheet($sheet); //获取指定的sheet表
        $columnH   = $currSheet->getHighestColumn(); //取得最大的列号
        $columnCnt = array_search($columnH, $cellName);
        $rowCnt    = $currSheet->getHighestRow(); //获取总行数

        $data = array();
        for ($_row = 1; $_row <= $rowCnt; $_row++) {
            //读取内容
            for ($_column = 0; $_column <= $columnCnt; $_column++) {
                $cellId    = $cellName[$_column] . $_row;
                $cellValue = $currSheet->getCell($cellId)->getValue();
                //$cellValue = $currSheet->getCell($cellId)->getCalculatedValue();  #获取公式计算的值
                if ($cellValue instanceof PHPExcel_RichText) {
                    //富文本转换字符串
                    $cellValue = $cellValue->__toString();
                }

                $data[$_row][$cellName[$_column]] = $cellValue;
            }
        }
        // var_dump($data);
        return $data;
    }
}
