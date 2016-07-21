<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>首页</title>
<link type="text/css" rel="stylesheet" href="<!--{$cppath}-->css/admin.css" media="screen" />
</head>
<body>
<div class="main-wrap">
<div class="path">
  <p>当前位置：管理首页<span></span></p>
</div>
<div class="main-cont">
  <h3 class="title">系统信息</h3>
  <div class="box">
    <div class="btn-group clear">
	  <p>系统版本：<!--{$copyright_version}--><!--{$copyright_release}--></p>
	  <a class="btn-general" href="http://blog.phpcoo.com/" target="_blank"><span>关注OEsop官方</span></a>
	  <a class="btn-general" href="http://bbs.phpcoo.com/" target="_blank"><span>技术论坛</span></a>
	  <a class="btn-general" href="http://www.phpcoo.com/contact" target="_blank"><span>联系客服</span></a>
	  <a class="btn-general" href="mailto:phpcoo@qq.com"><span>意见反馈</span></a>
	</div>
  </div>
  <h3 class="title">官方最新动态</h3>
  <div class="box">
    <ul class="news-item" id="news">
	  <script language="javascript" src="http://www.phpcoo.com/data/include/oesop.php"></script>
	</ul>
  </div>
		
  <h3 class="title">系统基本数据</h3>
  <div class="box">
    <ul class="group-item">
	  <li>新闻资讯数：<span><!--{$info_count}--></span></li>
	  <li>产品展示数：<span><!--{$product_count}--></span></li>
	  <li>成功案例数：<span><!--{$case_count}--></span></li>
	</ul>
	<ul class="group-item">
	  <li>解决方案数：<span><!--{$solution_count}--></span></li>
	  <li>资源下载数：<span><!--{$download_count}--></span></li>
	  <li>客户留言数：<span><!--{$guestbook_count}--></span></li>
	</ul>
  </div>
</div>
<div style="clear:both;"></div>
</div>
</body>
</html>
