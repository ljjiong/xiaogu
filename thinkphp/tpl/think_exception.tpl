<?php
if (!function_exists('parse_padding')) {
    function parse_padding($source)
    {
        $length = strlen(strval(count($source['source']) + $source['first']));
        return 40 + ($length - 1) * 8;
    }
}

if (!function_exists('parse_class')) {
    function parse_class($name)
    {
        $names = explode('\\', $name);
        return '<abbr title="' . $name . '">' . end($names) . '</abbr>';
    }
}

if (!function_exists('parse_file')) {
    function parse_file($file, $line)
    {
        return '<a class="toggle" title="' . "{$file} line {$line}" . '">' . basename($file) . " line {$line}" . '</a>';
    }
}

if (!function_exists('parse_args')) {
    function parse_args($args)
    {
        $result = [];

        foreach ($args as $key => $item) {
            switch (true) {
                case is_object($item):
                    $value = sprintf('<em>object</em>(%s)', parse_class(get_class($item)));
                    break;
                case is_array($item):
                    if (count($item) > 3) {
                        $value = sprintf('[%s, ...]', parse_args(array_slice($item, 0, 3)));
                    } else {
                        $value = sprintf('[%s]', parse_args($item));
                    }
                    break;
                case is_string($item):
                    if (strlen($item) > 20) {
                        $value = sprintf(
                            '\'<a class="toggle" title="%s">%s...</a>\'',
                            htmlentities($item),
                            htmlentities(substr($item, 0, 20))
                        );
                    } else {
                        $value = sprintf("'%s'", htmlentities($item));
                    }
                    break;
                case is_int($item):
                case is_float($item):
                    $value = $item;
                    break;
                case is_null($item):
                    $value = '<em>null</em>';
                    break;
                case is_bool($item):
                    $value = '<em>' . ($item ? 'true' : 'false') . '</em>';
                    break;
                case is_resource($item):
                    $value = '<em>resource</em>';
                    break;
                default:
                    $value = htmlentities(str_replace("\n", '', var_export(strval($item), true)));
                    break;
            }

            $result[] = is_int($key) ? $value : "'{$key}' => {$value}";
        }

        return implode(', ', $result);
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo \think\Lang::get('System Error'); ?></title>
    <meta name="robots" content="noindex,nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <style>
        /* Base */
        body {
            color: #333;
            font: 14px Verdana, "Helvetica Neue", helvetica, Arial, 'Microsoft YaHei', sans-serif;
            margin: 0;
            padding: 0 20px 20px;
            word-break: break-word;
        }
        h1{
            margin: 10px 0 0;
            font-size: 28px;
            font-weight: 500;
            line-height: 32px;
        }
        h2{
            color: #4288ce;
            font-weight: 400;
            padding: 6px 0;
            margin: 6px 0 0;
            font-size: 18px;
            border-bottom: 1px solid #eee;
        }
        h3.subheading {
            color: #4288ce;
            margin: 6px 0 0;
            font-weight: 400;
        }
        h3{
            margin: 12px;
            font-size: 16px;
            font-weight: bold;
        }
        abbr{
            cursor: help;
            text-decoration: underline;
            text-decoration-style: dotted;
        }
        a{
            color: #868686;
            cursor: pointer;
        }
        a:hover{
            text-decoration: underline;
        }
        .line-error{
            background: #f8cbcb;
        }

        .echo table {
            width: 100%;
        }

        .echo pre {
            padding: 16px;
            overflow: auto;
            font-size: 85%;
            line-height: 1.45;
            background-color: #f7f7f7;
            border: 0;
            border-radius: 3px;
            font-family: Consolas, "Liberation Mono", Menlo, Courier, monospace;
        }

        .echo pre > pre {
            padding: 0;
            margin: 0;
        }
        /* Layout */
        .col-md-3 {
            width: 25%;
        }
        .col-md-9 {
            width: 75%;
        }
        [class^="col-md-"] {
            float: left;
        }
        .clearfix {
            clear:both;
        }
        @media only screen
        and (min-device-width : 375px)
        and (max-device-width : 667px) {
            .col-md-3,
            .col-md-9 {
                width: 100%;
            }
        }
        /* Exception Info */
        .exception {
            margin-top: 20px;
        }
        .exception .message{
            padding: 12px;
            border: 1px solid #ddd;
            border-bottom: 0 none;
            line-height: 18px;
            font-size:16px;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            font-family: Consolas,"Liberation Mono",Courier,Verdana,"微软雅黑";
        }

        .exception .code{
            float: left;
            text-align: center;
            color: #fff;
            margin-right: 12px;
            padding: 16px;
            border-radius: 4px;
            background: #999;
        }
        .exception .source-code{
            padding: 6px;
            border: 1px solid #ddd;

            background: #f9f9f9;
            overflow-x: auto;

        }
        .exception .source-code pre{
            margin: 0;
        }
        .exception .source-code pre ol{
            margin: 0;
            color: #4288ce;
            display: inline-block;
            min-width: 100%;
            box-sizing: border-box;
        font-size:14px;
            font-family: "Century Gothic",Consolas,"Liberation Mono",Courier,Verdana;
            padding-left: <?php echo (isset($source) && !empty($source)) ? parse_padding($source) : 40; ?>px;
        }
        .exception .source-code pre li{
            border-left: 1px solid #ddd;
            height: 18px;
            line-height: 18px;
        }
        .exception .source-code pre code{
            color: #333;
            height: 100%;
            display: inline-block;
            border-left: 1px solid #fff;
        font-size:14px;
            font-family: Consolas,"Liberation Mono",Courier,Verdana,"微软雅黑";
        }
        .exception .trace{
            padding: 6px;
            border: 1px solid #ddd;
            border-top: 0 none;
            line-height: 16px;
        font-size:14px;
            font-family: Consolas,"Liberation Mono",Courier,Verdana,"微软雅黑";
        }
        .exception .trace ol{
            margin: 12px;
        }
        .exception .trace ol li{
            padding: 2px 4px;
        }
        .exception div:last-child{
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
        }

        /* Exception Variables */
        .exception-var table{
            width: 100%;
            margin: 12px 0;
            box-sizing: border-box;
            table-layout:fixed;
            word-wrap:break-word;
        }
        .exception-var table caption{
            text-align: left;
            font-size: 16px;
            font-weight: bold;
            padding: 6px 0;
        }
        .exception-var table caption small{
            font-weight: 300;
            display: inline-block;
            margin-left: 10px;
            color: #ccc;
        }
        .exception-var table tbody{
            font-size: 13px;
            font-family: Consolas,"Liberation Mono",Courier,"微软雅黑";
        }
        .exception-var table td{
            padding: 0 6px;
            vertical-align: top;
            word-break: break-all;
        }
        .exception-var table td:first-child{
            width: 28%;
            font-weight: bold;
            white-space: nowrap;
        }
        .exception-var table td pre{
            margin: 0;
        }

        /* Copyright Info */
        .copyright{
            margin-top: 24px;
            padding: 12px 0;
            border-top: 1px solid #eee;
        }

        /* SPAN elements with the classes below are added by prettyprint. */
        pre.prettyprint .pln { color: #000 }  /* plain text */
        pre.prettyprint .str { color: #080 }  /* string content */
        pre.prettyprint .kwd { color: #008 }  /* a keyword */
        pre.prettyprint .com { color: #800 }  /* a comment */
        pre.prettyprint .typ { color: #606 }  /* a type name */
        pre.prettyprint .lit { color: #066 }  /* a literal value */
        /* punctuation, lisp open bracket, lisp close bracket */
        pre.prettyprint .pun, pre.prettyprint .opn, pre.prettyprint .clo { color: #660 }
        pre.prettyprint .tag { color: #008 }  /* a markup tag name */
        pre.prettyprint .atn { color: #606 }  /* a markup attribute name */
        pre.prettyprint .atv { color: #080 }  /* a markup attribute value */
        pre.prettyprint .dec, pre.prettyprint .var { color: #606 }  /* a declaration; a variable name */
        pre.prettyprint .fun { color: red }  /* a function name */



        @import url(http://fonts.googleapis.com/css?family=Finger+Paint);

body{
  margin: 0;
  padding: 0;
overflow:hidden;
}

.init{
  display: none;

}

/* Mozilla based browsers */
::-moz-selection {
       background-color: #FFA620;
       color: #fff;
}

/* Works in Safari */
::selection {
       background-color: #FFA620;
       color: #fff;
}

.text-sign .text {
    color: #9D4F00;
    font-size: 23px;
    margin-left: 47px;
    margin-top: 50px;
        -moz-transform:rotate(-5deg);
    -webkit-transform:rotate(-5deg);
    -o-transform:rotate(-5deg);
    -ms-transform:rotate(-5deg);
}
.webkit .sweat.show{
     top: 90px!important;
}
.sweat.show{
    opacity: 0;
    top: 50px;
     -webkit-transition: all 1.5s ease-in-out;
    -moz-transition: all 1.5s ease-in-out;
    -o-transition: all 1.5s ease-in-out;
    -ms-transition: all 1.5s ease-in-out;
    transition: all 1.5s ease-in-out;
}

.sweat {
    background-image: url("http://web.xiaogutech.com/images/sweat.png");
    background-repeat: no-repeat;
    height: 42px;
    left: 220px;
    opacity: 1;
    position: absolute;

    width: 94px;
    top: 220px;
}

.work-sign {
    background-image: url("http://web.xiaogutech.com/images/working-sign.png");
    height: 339px;
    width: 218px;
    position: absolute;
    z-index: 300;
    top: 0;
   right: 20px;
}
.text-sign {
    background-image: url("http://web.xiaogutech.com/images/texty-sign.png");
    height: 225px;
    width: 250px;
    position: absolute;
    z-index: 300;
    top: -120px;
    left: 80px;
    font-family: 'Finger Paint', cursive;
}
#indicator{
    background-color: #fff;
     border-radius: 5px;
       padding: 10px;
       margin: auto;
        background-image:  url(http://web.xiaogutech.com/images/load.gif) ;
        background-repeat: no-repeat;
        background-position: center;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    position: absolute;
    width: 64px;
    height: 64px;
}

.sky{
     background-image:  url(http://web.xiaogutech.com/images/sky-bg.jpg) ;

      background-repeat: repeat-x;
}

.ground {
    background-image: url("http://web.xiaogutech.com/images/ground.png");
    background-repeat: repeat-x;
    min-height: 200px;
    width: 100%;
    top: -190px;
    position: relative;
}
.convas{
     background-color: #FFA620;
     position: relative;
      min-height: 991px;

}

.holder {
    margin: 0 auto;
    position: relative;
    width: 900px;
    top: -380px;
}
.mountain {
    background-image: url("http://web.xiaogutech.com/images/mountain.png");
    background-repeat: repeat-x;
    min-height: 172px;
    top: -120px;
    width: 200%;
    left: -60px;
    position: relative;
    z-index: 0;
}
.tlinks{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}

.rocks {
    background-image: url("http://web.xiaogutech.com/images/rocks.png");
    height: 455px;
  left: -100px;
    position: absolute;
    width: 791px;
    top: 0px;
    z-index: 300;
}

.hole {
    background-image: url("http://web.xiaogutech.com/images/hole.png");
    height: 273px;
    position: absolute;
    top: 80px;
    width: 807px;
    z-index: 100;
    left: 0;
    right: 0;
    margin: auto;
}

.worker {
    background-image: url("http://web.xiaogutech.com/images/worker.png");
    background-repeat: no-repeat;
    height: 189px;
    width: 242px;
    position: absolute;
    left: 190px;
    top: 35px;

}
.webkit.worker{
     left: 190px;
    top: 70px;
}
.swing {

      -webkit-transition: all 1.5s ease-in-out;
    -moz-transition: all 1.5s ease-in-out;
    -o-transition: all 1.5s ease-in-out;
    -ms-transition: all 1.5s ease-in-out;
    transition: all 1.5s ease-in-out;
    -moz-transform:rotate(40deg);
    -webkit-transform:rotate(40deg);
    -o-transform:rotate(40deg);
    -ms-transform:rotate(40deg);
}
.webkit.right{
    top: 460px;
     left: 280px;
}
.right {
    -moz-transform:rotate(190deg);
    -webkit-transform:rotate(190deg);
    -o-transform:rotate(190deg);
    -ms-transform:rotate(190deg);
        left: 330px;
    top: 430px;
}

.ground-bottom .cleaner {
    background-color: #FFA620;
    bottom: -70px;
    height: 300px;
    position: absolute;
    width: 100%;
}
.ground-bottom {
    background-image: url("http://web.xiaogutech.com/images/ground-bottom.png");
    background-repeat: no-repeat;
    height: 463px;
    left: -297px;
    position: absolute;
    top: 148px;
    width: 160%;
    z-index: 200;
}
.clouds {




    height: 300px;


    background: transparent url(http://web.xiaogutech.com/images/clouds.png) repeat-x;

}

    </style>
    <script type="text/javascript" src="http://web.xiaogutech.com/public/static/404/js/jquery-1.8.3.min.js"></script>
    <script src="http://web.xiaogutech.com/public/static/404/js/preloader.js"></script>
    <link rel="stylesheet" href="http://web.xiaogutech.com/public/static/404/css/style.css">
    <link href='http://fonts.googleapis.com/css?family=Finger+Paint' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="http://web.xiaogutech.com/public/static/404/js/css_browser_selector.js"></script>
     <script type="text/javascript" src="http://web.xiaogutech.com/public/static/404/js/plax.js"></script>
    <script type="text/javascript" src="http://web.xiaogutech.com/public/static/404/js/jquery.spritely-0.6.1.js"></script>
    <script type="text/javascript" src="http://web.xiaogutech.com/public/static/404/js/jquery-animate-css-rotate-scale.js"></script>
    <script type="text/javascript" src="http://web.xiaogutech.com/public/static/404/js/script.js"></script>

<!--     <script type="text/javascript" src="/thinkphp/tpl/404/js/jquery-1.8.3.min.js"></script>
    <script src="/thinkphp/tpl/404/js/preloader.js"></script>
    <link rel="stylesheet" href="/thinkphp/tpl/404/css/style.css">
    <link href='http://fonts.googleapis.com/css?family=Finger+Paint' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="/thinkphp/tpl/404/js/css_browser_selector.js"></script>
     <script type="text/javascript" src="/thinkphp/tpl/404/js/plax.js"></script>
    <script type="text/javascript" src="/thinkphp/tpl/404/js/jquery.spritely-0.6.1.js"></script>
    <script type="text/javascript" src="/thinkphp/tpl/404/js/jquery-animate-css-rotate-scale.js"></script>
    <script type="text/javascript" src="/thinkphp/tpl/404/js/script.js"></script> -->

</head>
<body>
    <div class="echo">
        <?php echo $echo; ?>
    </div>
    <?php if (\think\App::$debug) {
    ?>
    <div class="exception">
    <div class="message">

            <div class="info">
                <div>
                    <h2>[<?php echo $code; ?>]&nbsp;<?php echo sprintf('%s in %s', parse_class($name), parse_file($file, $line)); ?></h2>
                </div>
                <div><h1><?php echo nl2br(htmlentities($message)); ?></h1></div>
            </div>

    </div>
    <?php if (!empty($source)) {?>
        <div class="source-code">
            <pre class="prettyprint lang-php"><ol start="<?php echo $source['first']; ?>"><?php foreach ((array) $source['source'] as $key => $value) {?><li class="line-<?php echo $key + $source['first']; ?>"><code><?php echo htmlentities($value); ?></code></li><?php }?></ol></pre>
        </div>
    <?php }?>
        <div class="trace">
            <h2>Call Stack</h2>
            <ol>
                <li><?php echo sprintf('in %s', parse_file($file, $line)); ?></li>
                <?php foreach ((array) $trace as $value) {
        ?>
                <li>
                <?php
// Show Function
        if ($value['function']) {
            echo sprintf(
                'at %s%s%s(%s)',
                isset($value['class']) ? parse_class($value['class']) : '',
                isset($value['type']) ? $value['type'] : '',
                $value['function'],
                isset($value['args']) ? parse_args($value['args']) : ''
            );
        }

        // Show line
        if (isset($value['file']) && isset($value['line'])) {
            echo sprintf(' in %s', parse_file($value['file'], $value['line']));
        }
        ?>
                </li>
                <?php }?>
            </ol>
        </div>
    </div>
    <?php } else {?>
    <div class="exception">

            <div class="info"><h1><?php echo htmlentities($message); ?></h1></div>

    </div>
    <?php }?>

    <?php if (!empty($datas)) {
    ?>
    <div class="exception-var">
        <h2>Exception Datas</h2>
        <?php foreach ((array) $datas as $label => $value) {
        ?>
        <table>
            <?php if (empty($value)) {?>
            <caption><?php echo $label; ?><small>empty</small></caption>
            <?php } else {?>
            <caption><?php echo $label; ?></caption>
            <tbody>
                <?php foreach ((array) $value as $key => $val) {?>
                <tr>
                    <td><?php echo htmlentities($key); ?></td>
                    <td>
                        <?php
if (is_array($val) || is_object($val)) {
            echo htmlentities(json_encode($val, JSON_PRETTY_PRINT));
        } else if (is_bool($val)) {
            echo $val ? 'true' : 'false';
        } else if (is_scalar($val)) {
            echo htmlentities($val);
        } else {
            echo 'Resource';
        }
            ?>
                    </td>
                </tr>
                <?php }?>
            </tbody>
            <?php }?>
        </table>
        <?php }?>
    </div>
    <?php }?>

    <?php if (!empty($tables)) {
    ?>
    <div class="exception-var">
        <h2>Environment Variables</h2>
        <?php foreach ((array) $tables as $label => $value) {
        ?>
        <div>
            <?php if (empty($value)) {?>
            <div class="clearfix">
                <div class="col-md-3"><strong><?php echo $label; ?></strong></div>
                <div class="col-md-9"><small>empty</small></div>
            </div>
            <?php } else {?>
            <h3 class="subheading"><?php echo $label; ?></h3>
            <div>
                <?php foreach ((array) $value as $key => $val) {?>
                <div class="clearfix">
                    <div class="col-md-3"><strong><?php echo htmlentities($key); ?></strong></div>
                    <div class="col-md-9"><small>
                        <?php
if (is_array($val) || is_object($val)) {
            echo htmlentities(json_encode($val, JSON_PRETTY_PRINT));
        } else if (is_bool($val)) {
            echo $val ? 'true' : 'false';
        } else if (is_scalar($val)) {
            echo htmlentities($val);
        } else {
            echo 'Resource';
        }
            ?>
                    </small></div>
                </div>
                <?php }?>
            </div>
            <?php }?>
        </div>
        <?php }?>
    </div>
    <?php }?>

    <div id="indicator"></div>
<div class="wrapper">
    <div class="sky init">
    <div id="clouds" class="clouds init"> </div>
    </div>

    <div class="convas init">
        <div id="mountain" class="mountain"></div>
        <div class="ground"></div>
        <div class="holder">
        <div class="rocks"></div>
        <div class="work-sign"></div>
        <div class="text-sign">
            <div class="text font">

                    We're Working Hard...

            </div>
        </div>
        <div class="init hole">
            <div class="sweat"></div>
            <div class="worker swing "></div>
            <div class="ground-bottom">
                <div class="cleaner"></div>
            </div>
        </div>
        </div>
    </div>
</div>

    <?php if (\think\App::$debug) {?>
    <script>
        var LINE = <?php echo $line; ?>;

        function $(selector, node){
            var elements;

            node = node || document;
            if(document.querySelectorAll){
                elements = node.querySelectorAll(selector);
            } else {
                switch(selector.substr(0, 1)){
                    case '#':
                        elements = [node.getElementById(selector.substr(1))];
                        break;
                    case '.':
                        if(document.getElementsByClassName){
                            elements = node.getElementsByClassName(selector.substr(1));
                        } else {
                            elements = get_elements_by_class(selector.substr(1), node);
                        }
                        break;
                    default:
                        elements = node.getElementsByTagName();
                }
            }
            return elements;

            function get_elements_by_class(search_class, node, tag) {
                var elements = [], eles,
                    pattern  = new RegExp('(^|\\s)' + search_class + '(\\s|$)');

                node = node || document;
                tag  = tag  || '*';

                eles = node.getElementsByTagName(tag);
                for(var i = 0; i < eles.length; i++) {
                    if(pattern.test(eles[i].className)) {
                        elements.push(eles[i])
                    }
                }

                return elements;
            }
        }

        $.getScript = function(src, func){
            var script = document.createElement('script');

            script.async  = 'async';
            script.src    = src;
            script.onload = func || function(){};

            $('head')[0].appendChild(script);
        }

        ;(function(){
            var files = $('.toggle');
            var ol    = $('ol', $('.prettyprint')[0]);
            var li    = $('li', ol[0]);

            // 短路径和长路径变换
            for(var i = 0; i < files.length; i++){
                files[i].ondblclick = function(){
                    var title = this.title;

                    this.title = this.innerHTML;
                    this.innerHTML = title;
                }
            }

            // 设置出错行
            var err_line = $('.line-' + LINE, ol[0])[0];
            err_line.className = err_line.className + ' line-error';

            $.getScript('//cdn.bootcss.com/prettify/r298/prettify.min.js', function(){
                prettyPrint();

                // 解决Firefox浏览器一个很诡异的问题
                // 当代码高亮后，ol的行号莫名其妙的错位
                // 但是只要刷新li里面的html重新渲染就没有问题了
                if(window.navigator.userAgent.indexOf('Firefox') >= 0){
                    ol[0].innerHTML = ol[0].innerHTML;
                }
            });

        })();
    </script>
    <?php }?>
</body>
</html>
