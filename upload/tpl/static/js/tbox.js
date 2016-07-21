/*
	[OESOP] (C)2012-2099 OE Development team Inc.
	$Id: tbox.js 2013-02-06 $
*/
/*--------------- thickbox操作 Start-------------------*/
/**
 * 获取当前文件名
*/
function get_curl() {
	var curl = document.URL;
	var filename = curl.split("?")[0];
	return filename;
}
/**
 * 关闭 thickbox窗口
*/
function tbox_close(){
	window.parent.tb_remove();
}
/**
 * 关闭thickbox并刷新父页
*/
function tbox_close_reload(){
	window.parent.tb_remove();
	window.parent.location.reload();
}
/**
 * 弹出会员查询窗口
 * @param:: string title 标题
 * @param:: string inputid document输入框
 * @param:: string tipid 用户名提示框
*/
function tbox_get_user(title, inputid, tipid) {
	if(typeof(tipid) == 'undefined') {
		tipid = '';
	}
	var filename = get_curl();
	var url = filename + "?c=user&a=search&inputid="+inputid+"&tipid="+tipid+"&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=680&height=400";
	tb_show(title, url, false);
}

/**
 * 弹出EOSOP版本信息窗口
 * @param:: string title 标题
 * @param:: string inputid document输入框
 * @param:: string tipid 用户名提示框
*/
function tbox_get_copyright(title) {
	if(typeof(tipid) == 'undefined') {
		tipid = '';
	}
	var filename = get_curl();
	var url = filename + "?c=setting&a=copyright&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=680&height=400";
	tb_show(title, url, false);
}

/**
 * 弹出产品查询窗口
 * @param:: string title 标题
 * @param:: string sortid 当前排序
*/
function tbox_get_goods(title, sortid) {
	var filename = get_curl();
	var url = filename + "?c=product&a=search&sortid="+sortid+"&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=680&height=400";
	tb_show(title, url, false);
}

/**
 * 弹出产品查询窗口
 * @param:: string title 标题
 * @param:: string sortid 当前排序
*/
function tbox_get_quoted(title, sortid) {
	var filename = get_curl();
	var url = filename + "?c=quoted&a=search&sortid="+sortid+"&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=680&height=400";
	tb_show(title, url, false);
}

/**
 * 弹出添加订单收款单据
 * @param:: string title 标题
 * @param:: int orderid 订单编号
*/
function tbox_addpayment(title, orderid) {
	var filename = get_curl();
	var url = filename + "?c=payment&a=add&orderid="+orderid+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=750&height=400";
	tb_show(title, url, false);
}

/**
 * 弹出询价单操作记录
 * @param:: string title 标题
 * @param:: int orderid 订单编号
*/
function tbox_quotedlog(title, quotedid) {
	var filename = get_curl();
	var url = filename + "?c=quoted&a=quotedlog&id="+quotedid+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=750&height=400";
	tb_show(title, url, false);
}

/**
 * 弹出查看付款单信息
 * @param:: string title 标题
 * @param:: int id 付款单ID
*/
function tbox_viewpayment(title, id) {
	var filename = get_curl();
	var url = filename + "?c=payment&a=view&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=600&height=300";
	tb_show(title, url, false);
}

/**
 * 弹出添加退款单据页面
 * @param:: string title 标题
 * @param:: int orderid 订单编号
*/
function tbox_addrefund(title, orderid) {
	var filename = get_curl();
	var url = filename + "?c=refund&a=add&orderid="+orderid+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=750&height=400";
	tb_show(title, url, false);
}

/**
 * 弹出查看退款单信息
 * @param:: string title 标题
 * @param:: int id 付款单ID
*/
function tbox_viewrefund(title, id) {
	var filename = get_curl();
	var url = filename + "?c=refund&a=view&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=600&height=300";
	tb_show(title, url, false);
}

/**
 * 弹出添加发货单页面
 * @param:: string title 标题
 * @param:: int orderid 订单编号
*/
function tbox_adddelivery(title, orderid) {
	var filename = get_curl();
	var url = filename + "?c=delivery&a=delivery&orderid="+orderid+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=750&height=400";
	tb_show(title, url, false);
}

/**
 * 弹出查看发货单信息
 * @param:: string title 标题
 * @param:: int id 发货单ID
*/
function tbox_viewdelivery(title, id) {
	var filename = get_curl();
	var url = filename + "?c=delivery&a=viewdelivery&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=650&height=350";
	tb_show(title, url, false);
}

/**
 * 弹出添加退货单页面
 * @param:: string title 标题
 * @param:: int orderid 订单编号
*/
function tbox_addreturn(title, orderid) {
	var filename = get_curl();
	var url = filename + "?c=delivery&a=return&orderid="+orderid+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=750&height=400";
	tb_show(title, url, false);
}

/**
 * 弹出查看退货单信息
 * @param:: string title 标题
 * @param:: int id 发货单ID
*/
function tbox_viewreturn(title, id) {
	var filename = get_curl();
	var url = filename + "?c=delivery&a=viewreturn&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=650&height=350";
	tb_show(title, url, false);
}

/**
 * 弹出申请开发票
 * @param:: string title 标题
 * @param:: int id 订单编号
*/
function tbox_appinvoice(title, id) {
	var filename = get_curl();
	var url = filename + "?c=order&a=appinvoice&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=650&height=350";
	tb_show(title, url, false);
}


/**
 * 弹出发送邮件页面
 * @param:: string title 标题
 * @param:: int id 订单编号
*/
function tbox_sendemail(title) {
	var filename = get_curl();
	var url = filename + "?c=marketing&a=sendemail&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=650&height=350";
	tb_show(title, url, false);
}

/**
 * 弹出审核失败页面
 * @param:: string title 标题
 * @param:: int id 订单编号
*/
function tbox_failure(title, id) {
	var filename = get_curl();
	var url = filename + "?c=quoted&a=failure&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=650&height=350";
	tb_show(title, url, false);
}
/**
 * 弹出审核成功页面
 * @param:: string title 标题
 * @param:: int id 订单编号
*/
function tbox_success(title, id) {
	var filename = get_curl();
	var url = filename + "?c=quoted&a=success&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=650&height=350";
	tb_show(title, url, false);
}
/**
 * 弹出审核邮件发送页面
 * @param:: string title 标题
 * @param:: int id 订单编号
*/
function tbox_examineemail(title, id) {
	var filename = get_curl();
	var url = filename + "?c=quoted&a=examineemail&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=650&height=350";
	tb_show(title, url, false);
}
/**
 * 弹出开发票页面
 * @param:: string title 标题
 * @param:: int id 订单编号
*/
function tbox_openinvoice(title, id) {
	var filename = get_curl();
	var url = filename + "?c=invoice&a=open&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=750&height=450";
	tb_show(title, url, false);
}

/**
 * 弹出查看发票信息
 * @param:: string title 标题
 * @param:: int id 发票ID
*/
function tbox_viewinvoice(title, id) {
	var filename = get_curl();
	var url = filename + "?c=invoice&a=view&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=700&height=380";
	tb_show(title, url, false);
}

/**
 * 弹出查看收支明细
 * @param:: string title 标题
 * @param:: int id 
*/
function tbox_viewfinance(title, id) {
	var filename = get_curl();
	var url = filename + "?c=finance&a=view&id="+id+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=650&height=350";
	tb_show(title, url, false);
}


/**
 * 弹出添加现金记录窗口
 * @param:: string title 标题
 * @param:: int userid 会员ID
*/
function tbox_addmoney(title, userid) {
	var filename = get_curl();
	var url = filename + "?c=money&a=add&userid="+userid+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=650&height=280";
	tb_show(title, url, false);
}

/**
 * 弹出选择模板页
 * @param:: string title 标题
 * @param:: int inputid 接收框
*/
function tbox_templet(title, inputid) {
	var filename = get_curl();
	var url = filename + "?c=templet&a=select&inputid="+inputid+"&fromtype=jdbox&r="+get_rndnum(6);
	url = url + "&keepThis=true&TB_iframe=true&width=700&height=400";
	tb_show(title, url, false);
}
/*--------------- thickbox操作 End -------------------*/