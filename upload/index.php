<?php
/**
 * [OESOP] (C)2013-2099 OEdev,Inc.
 * <E-Mail：phpcoo@qq.com>
 * Url www.oesop.com, www.phpcoo.com
 * Update 2013.1.17
*/
/* 载入主文件 */
require_once 'source/core/init.php';
header("Location:admincp.php");
/* 获取参数值 */
$c = XRequest::getGpc('c');
$a = XRequest::getGpc('a');
$c = empty($c) ? 'index' : $c;
$a = empty($a) ? 'run' : $a;
/* Module白名单 */
if (!in_array($c, 
    array(
        'index'
    ))) {
	XHandle::error('Module ['.$c.'] is forbiden!');
}
/* Action判断 */
if (isset($_GET['cid']) || isset($_GET['cat'])) {
	$a = 'list';
}
if (($c == 'about') && isset($_GET['cid']) || ($c == 'about' && isset($_GET['cat']))) {
	$a = 'detail';
}
if (isset($_GET['id']) || isset($_GET['name'])) {
	$a = 'detail';
}
/* 载入Plugin插件 */
if (($c=='passport' && $a=='loginpost') || ($c=='passport' && $a=='logout')){
}
else {
    X::importPlugin();
}
/* 载入control文件 */
$control_base = BASE_ROOT.'./source/control/indexbase.php';
$hoook_base = BASE_ROOT.'./source/control/apphook.php';
$control_path = BASE_ROOT.'./source/control/index/'.$c.'.php';
if (!file_exists($control_path)) {
	XHandle::error('Module file:['.$c.'Controller] not found!');
}
else {
	require_once($control_base);
    require_once($hoook_base);
	require_once($control_path);
	/* 实例化control */
	$classname = $c.'Controller';
	$control = new $classname();
	/* 调用类的action方法 */
	$method = 'control_'.$a;
	if(method_exists($control, $method) && $a{0} != '_') {
		$control->$method();
	} else {
		XHandle::error('Action ['.$a.'] not found!');
    }
}
?>