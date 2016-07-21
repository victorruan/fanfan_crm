<?php
/**
 * [OESOP] (C)2013-2099 OEdev,Inc.
 * <E-Mail£ºphpcoo@qq.com>
 * Url www.oesop.com, www.phpcoo.com
 * Update 2013.1.17
*/
function smarty_modifier_replacebr($s_content){
	if (!empty($s_content)) {
		$s_content = stripslashes($s_content);
		$s_content = str_replace("\n", "<br />", $s_content);
	}
	return $s_content;
}
?>