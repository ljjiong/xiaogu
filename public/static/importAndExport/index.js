//数据导入 

var rABS = false; //是否将文件读取为二进制字符串
    function importf(obj) {//导入
        if (!obj.files) { return; }
        var f = obj.files[0];
        {
            var reader = new FileReader();
            var name = f.name;
            reader.onload = function (e) {
                var data = e.target.result;
                var wb;
                if (rABS) {
                    wb = XLSX.read(data, { type: 'binary' });
                } else {
                    var arr = fixdata(data);
                    wb = XLSX.read(btoa(arr), { type: 'base64' });
                }
                document.getElementById("importexcle").value = JSON.stringify(XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]]));
            };
            if (rABS) reader.readAsBinaryString(f);
            else reader.readAsArrayBuffer(f);
        }
    }
    function fixdata(data) {
        var o = "", l = 0, w = 10240;
        for (; l < data.byteLength / w; ++l) o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w, l * w + w)));
        o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w)));
        return o;
    }
    

   function exportexcel(jsono)
   {
	    var option={};
	    jsono=JSON.parse(jsono);
	    option.fileName = 'excel'
	    option.datas=[
	      {
	    	sheetData:jsono,
	        sheetName:'sheet',
	        sheetFilter:['is_community','shop_id','name','price'],
	        sheetHeader:['社区','店铺','产品名称','价格']
	      },
	      {
	        sheetData:[{one:'一行一列7',two:'一行二列8'},{one:'二行一列9',two:'二行二列10'}]
	      }
	    ];
	    var toExcel=new ExportJsonExcel(option);
	    toExcel.saveExcel();
    
  }
   
  
   
   