<?php
/*
Plugin Name: 数据库管理工具
Version: v1.0
Plugin URL:
Description: 数据管理工具，支持数据库分卷备份、恢复等操作。
For Version: OElove v3.x所有版本
Author: OElove官方
Author URL: http://www.phpcoo.com/
Last Update: 2012-04-10
*/
if(!defined('IN_OESOFT')) {
	exit('Access Denied');
}
/**
 * 注册插件管理菜单
*/
function datatool_adm_sidebar() {
	echo 
    " <li onClick=\"addTab('数据备份', 'communication', '".__ADMIN_FILE__."?c=plugin&a=setting&plugin_id=datatool')\">
     <img src='".PATH_URL."tpl/static/ui/images/16/communication.png' alt='数据备份' style=\"vertical-align: middle;\" />
      数据备份</li>&nbsp;&nbsp;<li onClick=\"addTab('数据恢复', 'communication', '".__ADMIN_FILE__."?c=plugin&a=setting&plugin_id=datatool&do=import')\">
     <img src='".PATH_URL."tpl/static/ui/images/16/communication.png' alt='数据恢复' style=\"vertical-align: middle;\" />
      数据恢复</li>";
}
XHook::addAction('adm_sidebar_ext', 'datatool_adm_sidebar');
?>