<?php
/**
 * [OESOP] (C)2013-2099 OEdev,Inc.
 * <E-Mail：phpcoo@qq.com>
 * Url www.oesop.com, www.phpcoo.com
 * Update 2013.1.17
*/
if (extension_loaded('zlib')) {
    ob_start('ob_gzhandler');
}
/* 载入主文件 */
require_once 'source/core/init.php';
/* 获取参数值 */
$c = XRequest::getGpc('c');
$a = XRequest::getGpc('a');
$c = empty($c) ? 'login' : $c;
$a = empty($a) ? 'run' : $a;

/* Controller白名单 */
if (!in_array($c, 
    array(
        'login', 'frame', 'admin', 'setting','authgroup','shiptype',
        'upload','ajax','user', 'order', 'payment', 'refund','payment',
        'delivery','account','paramter', 'finance', 'invoice',
        'marketing','statistical','quoted','report','product','guide','mailtpl','deliverycorp'
    ))) {
    XHandle::error('Admincp Controller ['.$c.'] is forbiden!');
}

/* 载入Plugin插件 */
if (($c=='login' && $a=='login') || ($c=='login' && $a=='logout')){
}
else {
    X::importPlugin();
}

/* 载入control文件 */
$control_base = BASE_ROOT.'./source/control/adminbase.php';
$hoook_base = BASE_ROOT.'./source/control/apphook.php';
$control_path = BASE_ROOT.'./source/control/admin/'.$c.'.php';
if (!file_exists($control_path)) {
	XHandle::error('Admincp Controller file ['.$c.'] is not found!');
}
else {
	require_once($control_base);
    require_once($hoook_base);
	require_once($control_path);
	/* 实例化Controller */
	$control = new control();
	/* 调用Controller的action方法 */
	$method = 'control_'.$a;
	if (method_exists($control, $method) && $a{0} != '_') {
		$control->$method();
	} 
    else {
		XHandle::error('Admincp Controller Action ['.$a.'] is not found!');
	}
    unset($control);
}
if (extension_loaded('zlib')) {
    ob_end_flush();
}
?>