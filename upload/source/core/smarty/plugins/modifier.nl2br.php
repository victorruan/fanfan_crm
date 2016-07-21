<?php
/**
 * [OESOP] (C)2013-2099 OEdev,Inc.
 * <E-Mail£ºphpcoo@qq.com>
 * Url www.oesop.com, www.phpcoo.com
 * Update 2013.1.17
*/
function smarty_modifier_nl2br($str){
	if (!empty($str)) {
		$str = nl2br($str);
	}
	return $str;
}
?>