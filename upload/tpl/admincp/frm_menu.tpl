<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="<!--{$page_charset}-->">
<title>menu</title>
<link rel="stylesheet" href="<!--{$cppath}-->css/menu.css" type="text/css" /> 
<script type="text/javascript" src="<!--{$cppath}-->js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<!--{$cppath}-->js/menu.js"></script>
</head>
<body style="overflow-x:hidden;">
<div id="accordion2">
  
  <!--{if $mod eq 'setting'}-->
  <div class="switchable-trigger" onClick="menu('label_1');"><i id='label_1_css' class="moo-icon-2"></i><h3>基础设置</h3></div>
  <ul class="switchable-panel" id='label_1'>
    <li>
	  <a href="<!--{$cpfile}-->?c=frame&a=main" target='main'>系统信息</a>&nbsp;&nbsp;
	  <a href="<!--{$cpfile}-->?c=setting" target='main'>站点设置</a>
	</li>
	<li>
	  <a href="<!--{$cpfile}-->?c=setting&a=footer" target='main'>底部信息</a>&nbsp;&nbsp;
	  <a href="<!--{$cpfile}-->?c=setting&a=safety" target='main'>安全设置</a>
    </li>
	<li>
	  <a href="<!--{$cpfile}-->?c=setting&a=order" target='main'>订单设置</a>&nbsp;&nbsp;
	  <a href="<!--{$cpfile}-->?c=setting&a=upload" target='main'>图片设置</a>
	</li>
	<li>
	  <a href="<!--{$cpfile}-->?c=setting&a=seo" target='main'>首页SEO设置</a>&nbsp;&nbsp;
	</li>
  </ul>

  <div class="switchable-trigger" onClick="menu('label_2');"><i id='label_2_css' class="moo-icon-2"></i><h3>管理员帐号</h3></div>
  <ul class="switchable-panel" id='label_2' style="display:;">
    <li>
	  <a href="<!--{$cpfile}-->?c=admin" target='main'>帐号列表</a>&nbsp;&nbsp;
	  <a href="<!--{$cpfile}-->?c=admin&a=add" target='main'>添加管理员</a>
	</li>
	<li>
	  <a href="<!--{$cpfile}-->?c=admin&a=editpassword">修改密码</a>
    </li>
  </ul>

  <div class="switchable-trigger" onClick="menu('label_3');"><i id='label_3_css' class="moo-icon-2"></i><h3>部门/组</h3></div>
  <ul class="switchable-panel" id='label_3' style="display:;">
    <li>
	  <a href="<!--{$cpfile}-->?c=authgroup" target='main'>部门、组设置</a>
	</li>
	<li>
	  <a href="<!--{$cpfile}-->?c=authgroup&a=add" target='main'>添加部门/组</a>
    </li>
  </ul>

  <div class="switchable-trigger last-trigger" onClick="menu('label_4');"><i id='label_4_css' class="moo-icon-2"></i><h3>其他设置</h3></div>
  <ul class="switchable-panel last-pannel" id='label_4' style="display:;">
    <li>
	  <a href="<!--{$cpfile}-->?c=htmllabel" target='main'>自定义HTML标签</a>
	</li>
	<li>
	  <a href="<!--{$cpfile}-->?c=zone" target='main'>广告版位</a>&nbsp;&nbsp;
	  <a href="<!--{$cpfile}-->?c=myads" target='main'>广告管理</a>
    </li>
	<li>
	  <a href="<!--{$cpfile}-->?c=deliverycorp" target='main'>物流公司</a>&nbsp;&nbsp;
	  <a href="<!--{$cpfile}-->?c=shiptype" target='main'>配送方式</a>
    </li>
  </ul>
  <!--{/if}-->

  <!--{if $mod eq 'user'}-->
  <div class="switchable-trigger" onClick="menu('label_1');"><i id='label_1_css' class="moo-icon-2"></i><h3>会员管理</h3></div>
  <ul class="switchable-panel" id='label_1'>
    <li>
	  <a href="<!--{$cpfile}-->?c=setting&a=user" target='main'>会员设置</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=usergroup" target='main'>会员组设置</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=user" target='main'>会员列表</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=money" target='main'>现金记录</a>
	</li>
  </ul>
  <div class="switchable-trigger" onClick="menu('label_2');"><i id='label_2_css' class="moo-icon-2"></i><h3>评论管理</h3></div>
  <ul class="switchable-panel" id='label_2'>
    <li>
	  <a href="<!--{$cpfile}-->?c=comment&table=article" target='main'>文章评论</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=comment&table=product" target='main'>产品评论</a>
	</li>
  </ul>
  <div class="switchable-trigger" onClick="menu('label_3');"><i id='label_3_css' class="moo-icon-2"></i><h3>系统留言</h3></div>
  <ul class="switchable-panel" id='label_3'>
    <li>
	  <a href="<!--{$cpfile}-->?c=guestbook" target='main'>留言列表</a>
	</li>
  </ul>
  <!--{/if}-->

  <!--{if $mod eq 'seo'}-->
  <div class="switchable-trigger" onClick="menu('label_1');"><i id='label_1_css' class="moo-icon-2"></i><h3>站点优化</h3></div>
  <ul class="switchable-panel" id='label_1'>
	<li>
	  <a href="<!--{$cpfile}-->?c=setting&a=rewrite" target='main'>站点伪静态设置</a>
    </li>
	<li>
	  <a href="<!--{$cpfile}-->?c=relatedlink" target='main'>关联链接设置</a>
	</li>
  </ul>
  <div class="switchable-trigger" onClick="menu('label_3');"><i id='label_3_css' class="moo-icon-2"></i><h3>邮件营销</h3></div>
  <ul class="switchable-panel" id='label_3' style="display:;">
    <li>
	  <a href="<!--{$cpfile}-->?c=setting&a=mail" target='main'>邮箱设置</a>&nbsp;&nbsp;
	  <a href="oesop_onlinechat.php" target='main'>群发邮件</a>
    </li>
    <li>
	  <a href="<!--{$cpfile}-->?c=mailtpl" target='main'>邮件模板设置</a>
    </li>
    <li>
	  <a href="oesop_setting.php?action=upload" target='main'>指定邮箱地址发送</a>
	</li>
    <li>
	  <a href="oesop_setting.php?action=upload" target='main'>邮件发送记录</a>
	</li>
  </ul>
  <div class="switchable-trigger" onClick="menu('label_4');"><i id='label_4_css' class="moo-icon-2"></i><h3>手机短信营销</h3></div>
  <ul class="switchable-panel" id='label_4' style="display:;">
    <li>
	  <a href="<!--{$cpfile}-->?c=setting&a=sms" target='main'>短信接口设置</a>
    </li>
    <li>
	  <a href="oesop_setting.php?action=upload" target='main'>群发短信</a>
    </li>
    <li>
	  <a href="oesop_setting.php?action=upload" target='main'>指定手机号码发送</a>
	</li>
    <li>
	  <a href="oesop_setting.php?action=upload" target='main'>短信发送记录</a>
	</li>
  </ul>
  <!--{/if}-->

  <!--{if $mod eq 'skin'}-->
  <div class="switchable-trigger" onClick="menu('label_1');"><i id='label_1_css' class="moo-icon-2"></i><h3>主题模板</h3></div>
  <ul class="switchable-panel" id='label_1'>
    <li>
	  <a href="<!--{$cpfile}-->?c=skin" target='main'>设置模板</a>
	</li>
	<li>
	  <a href="<!--{$cpfile}-->?c=setting&a=index_style" target='main'>首页配置</a>
    </li>
	<li>
	  <a href="<!--{$cpfile}-->?c=setting&a=main_style" target='main'>界面配置</a>
	</li>
  </ul>

  <div class="switchable-trigger" onClick="menu('label_2');"><i id='label_2_css' class="moo-icon-2"></i><h3>模板管理</h3></div>
  <ul class="switchable-panel" id='label_2' style="display:;">
    <li><a href="<!--{$cpfile}-->?c=templet">模板文件</a></li>
  </ul>
  <!--{/if}-->

  <!--{if $mod eq 'app'}-->
  <div class="switchable-trigger" onClick="menu('label_1');"><i id='label_1_css' class="moo-icon-2"></i><h3>扩展应用</h3></div>
  <ul class="switchable-panel" id='label_1'>
	<li>
	  <a href="<!--{$cpfile}-->?c=log" target='main'>系统日志</a>&nbsp;&nbsp;
	  <a href="<!--{$cpfile}-->?c=setting&a=clearcompiled">清除编译文件</a>
    </li>
	<li>
	  <a href='<!--{$cpfile}-->?c=setting&a=updatecache'>一键更新数据缓存</a>
	</li>
  </ul>

  <div class="switchable-trigger" onClick="menu('label_2');"><i id='label_2_css' class="moo-icon-2"></i><h3>插件中心</h3></div>
  <ul class="switchable-panel" id='label_2' style="display:;">
    <li><a href="<!--{$cpfile}-->?c=plugin" target='main'>插件列表</a></li>
	<!--{assign var='plugin_data' value=XHook::doAction('adm_sidebar_ext')}-->
  </ul>
  <!--{/if}-->

  
  <!--{if $mod eq 'content'}-->

  <div class="switchable-trigger" onClick="menu('label_1');"><i id='label_1_css' class="moo-icon-2"></i><h3>栏目管理</h3></div>
  <ul class="switchable-panel" id='label_1' style="display:;">
    <li><a href="<!--{$cpfile}-->?c=category">栏目设置</a> <a href="<!--{$cpfile}-->?c=module">模块类型</a> </li>
  </ul>

  <!--{if !empty($category)}-->
  <!--{foreach $category as $volist}-->

  <!--{if $volist.modalias=='about'}-->
  <div class="switchable-trigger" onClick="menu('model_<!--{$volist.catid}-->');"><i id='model_<!--{$volist.catid}-->_css' class="moo-icon-2"></i><h3><!--{$volist.catname}--></h3></div>
  <ul class="switchable-panel" id='model_<!--{$volist.catid}-->'>
    <!--{if !empty($volist.child)}-->
	<!--{foreach $volist.child as $mychild}-->
    <li>&nbsp;&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=about&a=edit&catid=<!--{$mychild.catid}-->&id=<!--{$mychild.abid}-->"><!--{$mychild.catname}--></a></li>
	<!--{/foreach}-->
	<!--{/if}-->
  </ul>
  <!--{else}-->
  <div class="switchable-trigger" onClick="menu('model_<!--{$volist.catid}-->');"><i id='model_<!--{$volist.catid}-->_css' class="moo-icon-2"></i><h3><!--{$volist.catname}--></h3></div>
  <ul class="switchable-panel" id='model_<!--{$volist.catid}-->'>
    <li><a href="<!--{$cpfile}-->?c=modattr&smodule=<!--{$volist.modalias}-->&streeid=<!--{$volist.catid}-->">模块字段</a> <a href="<!--{$cpfile}-->?c=modattr&a=add&smodule=<!--{$volist.modalias}-->&streeid=<!--{$volist.catid}-->">添加字段</a></li>
    <li><a href="<!--{$cpfile}-->?c=<!--{$volist.modalias}-->&tid=<!--{$volist.catid}-->">内容列表</a> <a href="<!--{$cpfile}-->?c=<!--{$volist.modalias}-->&a=add&tid=<!--{$volist.catid}-->">添加内容</a></li>
  </ul>
  <!--{/if}-->
  <!--{/foreach}-->
  <!--{/if}-->


  <!--{/if}-->


  <!--{if $mod eq 'oa'}-->
  <div class="switchable-trigger" onClick="menu('label_1');"><i id='label_1_css' class="moo-icon-2"></i><h3>订单管理</h3></div>
  <ul class="switchable-panel" id='label_1'>
    <li>
	  <a href="<!--{$cpfile}-->?c=order" target='main'>订单列表</a> <a href="<!--{$cpfile}-->?c=order&a=add" target='main'>添加订单</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=order&sview=1" target='main'>未处理订单</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=order&sview=2" target='main'>已付款待发货</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=order&sview=3" target='main'>已发货订单</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=order&sview=4" target='main'>已完成订单</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=order&sview=5" target='main'>已退款订单</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=order&sview=6" target='main'>已退货订单</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=order&sview=7" target='main'>已作废订单</a>
	</li>
  </ul>

  <div class="switchable-trigger" onClick="menu('label_2');"><i id='label_2_css' class="moo-icon-2"></i><h3>单据管理</h3></div>
  <ul class="switchable-panel" id='label_2'>
    <li>
	  <a href="<!--{$cpfile}-->?c=payment" target='main'>收款单</a> <a href="<!--{$cpfile}-->?c=refund" target='main'>退款单</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=delivery&stype=delivery" target='main'>发货单</a> <a href="<!--{$cpfile}-->?c=delivery&stype=return" target='main'>退货单</a>
	</li>
  </ul>

  <div class="switchable-trigger" onClick="menu('label_3');"><i id='label_3_css' class="moo-icon-2"></i><h3>财务管理</h3></div>
  <ul class="switchable-panel" id='label_3'>
    <li>
	  <a href="<!--{$cpfile}-->?c=account" target='main'>帐户设置</a> <a href="<!--{$cpfile}-->?c=paramter" target='main'>财务参数</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=finance" target='main'>财务收支</a>
	</li>
    <li>
	  <a href="<!--{$cpfile}-->?c=invoice&a=applist" target='main'>待开票订单</a> <a href="<!--{$cpfile}-->?c=invoice" target='main'>已开票订单</a>
	</li>
  </ul>
  <!--{/if}-->

</div>
</body>
</html>
<script language="javascript">
function menu(id) {
	if ($("#"+id).css("display") == "none") {
		$("#"+id).css("display","block");
		$("#"+id+'_css').removeClass('moo-icon-1');
		$("#"+id+'_css').addClass('moo-icon-2');
	} else {
		$("#"+id).css("display","none");
		$("#"+id+'_css').removeClass('moo-icon-2');
		$("#"+id+'_css').addClass('moo-icon-1');
	}
}
</script>
