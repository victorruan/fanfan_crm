/*
	[OESOP] (C)2012-2099 OE Development team Inc.
	$Id: admincp.js 2013-02-06 $
*/
/**
 * $Id    : jquery for ajax更改状态值
 * @params: url   发送URL
 * @params: imgid 标签ID
 * @params: id    ID
*/
function fetch_ajax(imgid,id){
	var requesturl = document.URL;
	var filename = requesturl.split("&")[0];
	var img_on  = _ROOT_PATH + "tpl/static/images/yes.gif";
	var img_off = _ROOT_PATH + "tpl/static/images/no.gif";
    var type  = $("#attr_"+imgid+id).val();
	if(type == imgid+"close"){
		$("#"+imgid+id).attr("src",img_off);
		$("#attr_"+imgid+id).val(imgid+"open");
		$.ajax({
			type: "POST",
			url: filename,
			data: "a=update&type="+type+"&id="+id+"&rnd="+new Date().toString(),
	        dataType : "text",
			success: function(data) {}
		});
	}else{
		$("#"+imgid+id).attr("src",img_on);
		$("#attr_"+imgid+id).val(imgid+"close");
		$.ajax({
			type: "POST",
			url: filename,
			data: "a=update&type="+type+"&id="+id+"&rnd="+new Date().toString(),
	        dataType : "text",
			success: function(data) {}
		});
	}
}

function dc() {
  var elements = new Array();
  for (var i = 0; i < arguments.length; i++) {
    var element = arguments[i];
    if (typeof element == 'string') element = document.getElementById(element);
    if (arguments.length == 1) return element;
    elements.push(element);
  }
  return elements;
}

/* 随机数 */
function get_rndnum(n) {
	var chars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
	var res = "";
	for(var i = 0; i < n ; i ++) {
		var id = Math.ceil(Math.random()*35);
		res += chars[id];
	}
	return res;
}

/* menu */
function Menuon(ID) {
	try{dc('Tab'+ID).className='tab_on';}catch(e){}
}

/* close msg */
function closemsg() {
	try{dc('msgbox').innerHTML = '';dc('msgbox').style.display = 'none';}catch(e){}
}

/* dmsg */
function dmsg(str, id, s, t) {
	var t = t ? t : 5000;
	var s = s ? true : false;
	try{if(s){window.scrollTo(0,0);}dc('d'+id).innerHTML = '<img src="'+_ROOT_PATH+'tpl/static/images/check_error.gif" width="12" height="12" align="absmiddle"/> '+str+sound('tip');$(id).focus();}catch(e){}
	window.setTimeout(function(){dc('d'+id).innerHTML = '';}, t);
}

/* sound */
function sound(file) {
	return '<div style="float:left;"><embed src="'+_ROOT_PATH+'tpl/static/images/'+file+'.swf" quality="high" type="application/x-shockwave-flash" height="0" width="0" hidden="true"/></div>';
}

/* 信息全选控制 */
function checkAll(e, itemName){
  var aa = document.getElementsByName(itemName);
  for (var i=0; i<aa.length; i++)
   aa[i].checked = e.checked;
}

function checkItem(e, allName){
  var all = document.getElementsByName(allName)[0];
  if(!e.checked) all.checked = false;
  else{
    var aa = document.getElementsByName(e.name);
    for (var i=0; i<aa.length; i++)
     if(!aa[i].checked) return;
    all.checked = true;
  }
}

/* CSS背景控制 鼠标经过效果 */
function overColor(Obj) {
	var elements=Obj.childNodes;
	for(var i=0;i<elements.length;i++){
		elements[i].className="hback_o"
		Obj.bgColor="";
	}
	
}

/* 鼠标离开效果 */
function outColor(Obj){
	var elements=Obj.childNodes;
	for(var i=0;i<elements.length;i++){
		elements[i].className="hback";
		Obj.bgColor="";
	}
}

function IsDigit(){
    return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
function IsDigit2(){
    return ((event.keyCode >= 48) && (event.keyCode <= 57) || (event.keyCode = 46));
}

/* 只能由汉字，字母，数字和下横线组合 */
function check_userstring(str){  
    var re1 = new RegExp("^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|_|[a-zA-Z0-9])*$");
	if(!re1.test(str)){
		return false;
	}else{
		return true;
	}
}

/* 判断字符长度，一个汉字为2个字符 */
function strlen(s){
	var l = 0;
	var a = s.split("");
	for (var i=0;i<a.length;i++){
		if (a[i].charCodeAt(0)<299){
			l++;
		}else{
			l+=2;
		}
	}
	return l;
}

/* 判断所选择数量 */
function check_count(id, my , num){
	var oEvent = document.getElementById('em_' + id + '_edit');
	var chks = oEvent.getElementsByTagName("INPUT");
	var count = 0;
	for(var i=0; i<chks.length; i++){
		if(chks[i].type=="checkbox"){
			if(chks[i].checked == true){
				count ++;
			}
			if(count > num){
				my.checked = false;
				alert('最多只能选择' + num + '项');
				return false;
			}
		}
	}
}


/**
  $Id: 检查Email是否合法
  retrun true,false
*/
function isEmail(str) {
	var re = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	return re.test(str);
}

function checktelephone(telephone) {
	var cellPhone=document.getElementById(telephone);
	
	var RegCellPhone = /^([0-9]{11})?$/;
	falg=cellPhone.value.search(RegCellPhone);
	if (falg==-1){
		return false;
	}else{
		return true;
	}
} 


/* 
  $Id:: ajax 检测Email是否合法和存在
  @params:: inputid 检测的input ID
  @params:: tipsid json显示结果位置
*/
function detect_email(inputid,tipsid){
	var email = $("#"+inputid).val();
	if(isEmail(email)){
		$.ajax({
			type: "POST",
			url: _ROOT_PATH + "data/ajax/checkemail.php",
			cache: false,
			data: { email: email,r:get_rndnum(8)},
			dataType: "json",
			beforeSend: function(XMLHttpRequest) {
				XMLHttpRequest.setRequestHeader("request_type","ajax");
			},
			success: function(data) {
				var json = eval(data);
				var msg = json[0].msg;
				if(msg==1){
					$("#"+tipsid).html("<font color='red'>对不起，Email格式不正确</font>");
				}else if(msg==2){
					$("#"+tipsid).html("<font color='red'>对不起，该Email已被注册</font>");
				}else{
					$("#"+tipsid).html("<font color='green'>恭喜你，该Email可以注册</font>");
				}
			},
			error: function() {

			}
		});
	} else {
		$("#"+tipsid).html("<font color='red'>Email格式不正确</font>");
	}
}

/* 
  $Id:: ajax 检测用户名是否合法和存在
  @params:: inputid 检测的input ID
  @params:: tipsid json显示结果位置
*/
function detect_username(inputid,tipsid){
	var username = $("#"+inputid).val();
	if(checkuserstr(username)){
		if(strlen(username)<4 || strlen(username)>16){
			$("#"+tipsid).html("<font color='red'>对不起，会员名称长度不正确！</font>");
		} else {
			$.ajax({
				type: "POST",
				url: _ROOT_PATH + "data/ajax/checkusername.php",
				cache: false,
				data: { username: username,r:get_rndnum(8)},
				dataType: "json",
				beforeSend: function(XMLHttpRequest) {
					XMLHttpRequest.setRequestHeader("request_type","ajax");
				},
				success: function(data) {
					var json = eval(data);
					var msg = json[0].msg;
					if(msg==1){
						$("#"+tipsid).html("<font color='red'>对不起，名称格式不正确！</font>");
					}else if(msg==2){
						$("#"+tipsid).html("<font color='red'>对不起，该名称已被系统禁止！</font>");
					}else if(msg == 3){
						$("#"+tipsid).html("<font color='red'>对不起，该名称已被注册！</font>");
					} else {
						$("#"+tipsid).html("<font color='green'>恭喜你，该名称可以注册</font>");
					}
				},
				error: function() {

				}
			});
		}
	} else {
		$("#"+tipsid).html("<font color='red'>对不起，名称格式不正确！</font>");
	}
}

/*--------------- 批量添加 Start ---------------------*/
function album_addtr(h,t,i){
	h.after(t);
	var l = i!=1?i:1;
	h.next('tr').find("input[type='text']").eq(l).focus();
}


/**
 * 批量添加订单物品清单
 * @param:: my
 * @param:: module
*/
function item_add(my) {
	$('#load_itemtips').html('正在为您努力加载中...');
	var requesturl = document.URL;
	var filename = requesturl.split("?")[0];
	//统计itemlist 个数
	var itemnum = $('.itemlist') ? $('.itemlist').length : 0;
	//当前最大排序
	var maxsort = parseInt($("input[name='itemmaxsort']").val());
	//ajax 排序 sort
	var sort = 0;
	if (maxsort>itemnum) {
		sort = maxsort;
	}
	else {
		sort = itemnum;
	}
	//URL
	var url = filename+'?c=ajax&a=add_goods&sort='+sort+"&rnd="+get_rndnum(8);
	var dom = $("tr.itemlist");
	var at = dom.length>0 ? dom.eq(dom.length-1) : $('#list-top');
    $.ajax({
    url : url, 
    type: "GET",
    success: function(data){
		item_addtr(at, data, 0);
		$('#load_itemtips').empty();
		//成功后itemmaxsort+1
		$("input[name='itemmaxsort']").val((maxsort+1));
    }
    });
	return false;
}

/**
 * 批量添加物品
 * @param:: my
 * @param:: module
*/
function quoted_add(my) {
	$('#load_itemtipss').html('正在为您努力加载中...');
	var requesturl = document.URL;
	var filename = requesturl.split("?")[0];
	//统计itemlist 个数
	var itemnum = $('.itemlists') ? $('.itemlists').length : 0;
	//当前最大排序
	var maxsort = parseInt($("input[name='itemmaxsorts']").val());
	//ajax 排序 sort
	var sort = 0;
	if (maxsort>itemnum) {
		sort = maxsort;
	}
	else {
		sort = itemnum;
	}
	//URL
	var url = filename+'?c=ajax&a=add_quoted&sort='+sort+"&rnd="+get_rndnum(8);
	var dom = $("tr.itemlists");
	var at = dom.length>0 ? dom.eq(dom.length-1) : $('#list-tops');
    $.ajax({
    url : url, 
    type: "GET",
    success: function(data){
		item_addtr(at, data, 0);
		$('#load_itemtipss').empty();
		//成功后itemmaxsort+1
		$("input[name='itemmaxsorts']").val((maxsort+1));
    }
    });
	return false;
}

/**
 * 删除报价列表
*/
function item_del_quoted(my, sortid) {
	//移除tr
	my.parent('td').parent('tr').remove();
	//统计itemlist 个数
	var itemnum = $('.itemlists') ? $('.itemlists').length : 0;
	//itemmaxsort最大值
	var maxsort = parseInt($("input[name='itemmaxsorts']").val());
	//如果没有列表 重置0
	if (itemnum == 0) {
		$("input[name='itemmaxsorts']").val(0);
	}
	//有列表
	else {
		//如果删除的ID是当前最大的ID，则itemmaxsort-1
		if(sortid == maxsort) {
			$("input[name='itemmaxsorts']").val((maxsort-1));
		}

	}
}

/**
 * 删除物品列表
*/
function item_del(my, sortid) {
	//移除tr
	my.parent('td').parent('tr').remove();
	//统计itemlist 个数
	var itemnum = $('.itemlist') ? $('.itemlist').length : 0;
	//itemmaxsort最大值
	var maxsort = parseInt($("input[name='itemmaxsort']").val());
	//如果没有列表 重置0
	if (itemnum == 0) {
		$("input[name='itemmaxsort']").val(0);
	}
	//有列表
	else {
		//如果删除的ID是当前最大的ID，则itemmaxsort-1
		if(sortid == maxsort) {
			$("input[name='itemmaxsort']").val((maxsort-1));
		}

	}
}

/**
 * 统计物品列表数量
*/
function item_countnums() {
	$("input[name='itemnum']").val(function(){return parseInt($(this).val())-1});
}
//focus
function item_addtr(h,t,i){
	h.after(t);
	var l = i!=1?i:1;
	//h.next('tr').find("input[type='text']").eq(l).focus();
}
/*--------------- 批量添加 End ---------------------*/

function addTabs(title, icon, url) {
	if(typeof(url) == 'undefined') {url = '';}
    
	if (window.parent.$('.easyui-tabs').tabs('exists', title)) {
		window.parent.$('.easyui-tabs').tabs('select', title);//判断是否打开过选项卡，已打开就选择
		var tab = window.parent.$('.easyui-tabs').tabs('getSelected'); //获取被选择的选项卡面板名称。
        //更新选项卡
        window.parent.$('.easyui-tabs').tabs('update', {
            tab:tab, 
            options:{
                title: title,
    			content: ' <iframe name="tabid1" id="tabid1" src="'+url+'" frameborder="0" style="width:100%; height:96%"></iframe>',
    			iconCls: 'icon-' + icon,
    			closable: true
            }   
        });
	}
	else {
		window.parent.$('.easyui-tabs').tabs('add', {
			title: title,
			content: ' <iframe name="tabid1" id="tabid1" src="'+url+'" frameborder="0" style="width:100%; height:96%"></iframe>',
			iconCls: 'icon-' + icon,
			closable: true
		});
	}
}
//价格转换为折扣
function pcdiscounts(op,bp,dis){
	var oprice=$("#"+op).val();
	var bprice=$("#"+bp).val();
	
	//var reg = /\D+/;
//	if(reg.test(bprice)) 
//	{
//		alert("请输入正确数字");
//		$("#"+dis).val('');
//		$("#"+bp).focus();
//		$("#"+bp).select();
//		return false;
//	}else{
		var discount;
		var value;
		value=(parseFloat(bprice)/parseFloat(oprice));
		discount=(parseFloat(value)).toFixed(2);
		$("#"+dis).val(discount);
	//}
}
//折扣为转换价格
function dcprice(op,bp,dis){
	var oprice=$("#"+op).val();
	var discount=$("#"+dis).val();
	var bprice;
	bprice=(parseFloat(discount)*parseFloat(oprice)).toFixed(2);
	$("#"+bp).val(bprice);
}

function bonddiscount(discount,stype){
	if(discount>0){
		if(stype=='quoted'){
			var itemmaxsorts=$("#itemmaxsorts").val();
			for(var i=1;i<(parseInt(itemmaxsorts)+1);i++){
				$("#sitem_discount_"+i).val(discount);
				dcprice("sitem_oprice_"+i,"sitem_price_"+i,"sitem_discount_"+i);
			}
		}else if(stype=='order'){
			var itemmaxsort=$("#itemmaxsort").val();
			for(var i=1;i<(parseInt(itemmaxsort)+1);i++){
				$("#item_discount_"+i).val(discount);
				dcprice("item_oprice_"+i,"item_price_"+i,"item_discount_"+i);
			}
		}
	}
}
//物流模糊搜索
$(function(){
		 $("#loginame").blur(function(){
			$('#suggestions').fadeOut();
		 }); 
		});	

function lookupdeliverycorp(event,inputString) {
	var filename = get_curl();
	if(inputString.length == 0) {
		$('#suggestions').fadeOut();
	} else {
	
	if(event.keyCode!=38 && event.keyCode!=40)
	{
		if(event.keyCode==13){
			$('#suggestions').fadeOut(); 
		}else{
		$.post(filename+"?c=deliverycorp&a=deliverycorp_search", {queryString: ""+inputString+""}, function(data) { 
		$('#suggestions').fadeIn(); 
		$('#suggestions').html(data);
			var i=0;
			var len;
			len=$(".isvaldeliverycorp").length;
				$("#loginame").keydown(function(event){ 
				
						if(event.keyCode == 38){
							if(i<=1){
								i=len+1;
							}
							i--;
							$(".title").removeClass('titles');
							var val=$(".isvaldeliverycorp").eq(i-1).html();
							$("#loginame").val(val);
							$(".isvaldeliverycorp").eq(i-1).addClass('titles');
							
						}else if (event.keyCode == 40){ 
							if(i>=len){
								i=0;
							}
							
							i++;
							$(".title").removeClass('titles');
							var val=$(".isvaldeliverycorp").eq(i-1).html();
							$("#loginame").val(val);
							$(".isvaldeliverycorp").eq(i-1).addClass('titles');
						} 
					
				}); 
			});
			}
		}
	}
}
function rmovedeliverycorp(val)
{
	$('#loginame').val(val);
}


//会员模糊搜索
var cssObj = { 'box-shadow' : '#888 5px 10px 10px', // Added when CSS3 is standard
		'-webkit-box-shadow' : '#888 5px 10px 10px', // Safari
		'-moz-box-shadow' : '#888 5px 10px 10px'}; // Firefox 3.5+
		$("#suggestions").css(cssObj);
		
		// Fade out the suggestions box when not active
		$(function(){
		 $("#entname").blur(function(){
			$('#suggestions').fadeOut();
		 }); 
		});	
function lookup(event,inputString) {
	var filename = get_curl();
	if(inputString.length == 0) {
		$('#suggestions').fadeOut();
	} else {
	
	if(event.keyCode!=38 && event.keyCode!=40)
	{
		if(event.keyCode==13){
			$('#suggestions').fadeOut(); 
		}else{
		$.post(filename+"?c=user&a=fuzzy_search", {queryString: ""+inputString+""}, function(data) { 
		$('#suggestions').fadeIn(); 
		$('#suggestions').html(data);
			var i=0;
			var len;
			len=$(".isval").length;
				$("#entname").keydown(function(event){ 
				
						if(event.keyCode == 38){
							if(i<=1){
								i=len+1;
							}
							i--;
							$(".title").removeClass('titles');
							var val=$(".isval").eq(i-1).html();
							$("#entname").val(val);
							$(".isval").eq(i-1).addClass('titles');
							
						}else if (event.keyCode == 40){ 
							if(i>=len){
								i=0;
							}
							
							i++;
							$(".title").removeClass('titles');
							var val=$(".isval").eq(i-1).html();
							$("#entname").val(val);
							$(".isval").eq(i-1).addClass('titles');
						} 
					
				}); 
			});
			}
		}
	}
}
function rmove(val)
{
	$('#entname').val(val);
}
//企业名称与所属企业
function entchange(value){
	if(value==1){
		$("#entnameinfo").show();
		$("#didinfo").hide();
	}else{
		$("#entnameinfo").hide();
		$("#didinfo").show();
	}
}
//显示与隐藏
function showDateil(src,n){
	var url = src.src;
	if(url.indexOf("menu_plus.gif")!=-1){
		//document.getElementById("item_"+n).style.display = "block";
		$("#item_"+n).show();
	
		src.src = url.replace("plus.gif","minus.gif");
	}else{
		document.getElementById("item_"+n).style.display = "none";
		src.src = url.replace("minus.gif","plus.gif");
	}
}


//AJAX  询价和订单 
function ajaxquotedadd(){

	var filename = get_curl();
	var ajaxid=$("#ajaxid").val();
	var ajaxname=$("#ajaxname").val();
	var itemmaxsorts=$("#itemmaxsorts").val();
	var goodsid = new Array(); 
	var quantity = new Array();
	var goodsprice = new Array();
	var goodsoprice = new Array();
	var gooddiscount = new Array();
	var goodsremarks = new Array();
	
	if(itemmaxsorts>0){
		for(var i=1;i<(parseInt(itemmaxsorts)+1);i++){
			goodsid.push($("#sitem_gid_"+i).val());
			goodsprice.push($("#sitem_price_"+i).val());
			goodsoprice.push($("#sitem_oprice_"+i).val());
			gooddiscount.push($("#sitem_discount_"+i).val());
			quantity.push($("#sitem_num_"+i).val());
			goodsremarks.push($("#sitem_remarks_"+i).val());
		}
		
	}else{
		alert("请插入询价物品");
		return;
	}
	if(!ajaxid || !ajaxname){
		alert("请选择用户");
		return false;
	}
	
	// var identification = window.prompt("业务员邮箱","请在此输入您的联系邮箱。"); 
//	 if(!identification){
//	 	return false;
//	 }
//	 //对电子邮件的验证
//     var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
//    if(!myreg.test(identification))
//     {
//	   alert('提示\n\n请输入有效的E_mail！');
//		return false;
//     }
	var datacontent={"ajaxname": ajaxname, "ajaxid": ajaxid,"goodsid": goodsid,"goodsprice": goodsprice,"goodsoprice": goodsoprice,"quantity": quantity,"goodsremarks": goodsremarks,"itemmaxsorts":itemmaxsorts,"discount":gooddiscount}; 
	if(confirm("确定提交吗？")){
	$.ajax({
			type:"POST",	   
			url :filename+"?c=guide&a=ajaxquotedadd",
			data:datacontent,
			dataType:"JSON",
			success: function(data,textStatus){
			data = eval(data);
			$.each(data, function(index,txt){
				if(txt['result']=='success'){
				    $(".itemlists").remove();
					$("#itemmaxsorts").val(0);
					alert("添加成功");
				}else if(txt['result']=='email'){
					alert("邮箱格式不正确");
				}else if(txt['result']=='goods'){
					alert("请选择询价物品");
				}else{
					alert("添加失败");
				}
			
			});  
			}
		});
	}
}
function ajaxorderadd(){
	
	var filename = get_curl();
	var ajaxid=$("#ajaxid").val();
	var ajaxname=$("#ajaxname").val();
	var itemmaxsort=$("#itemmaxsort").val();
	var goodsid = new Array(); 
	var quantity = new Array();
	var price = new Array();
	var oprice = new Array();
	var discount = new Array();
	var shipuser=$("#shipuser").val();
	var shipaddress=$("#shipaddress").val();
	var shipzipcode=$("#shipzipcode").val();
	var shipmobile=$("#shipmobile").val();
	
	
	var shiptelephone=$("#shiptelephone").val();
	var shipday=$("#shipday").val();
	var shipmemo=$("#shipmemo").val();
	var remark=$("#remark").val();
	var istax;
	var ischeck=$("input[name='istax']").eq(0).attr("checked");
	if(ischeck){
		istax=1;
	}else{
		istax=0;
	}
	
	var taxpayee=$("#taxpayee").val();
	var taxcontent=$("#taxcontent").val();
	var shipid=$("#shipid").val();
	var discountamount=$("#discountamount").val();
	
	if(itemmaxsort>0){
		for(var i=1;i<(parseInt(itemmaxsort)+1);i++){
			goodsid.push($("#item_gid_"+i).val());
			quantity.push($("#item_num_"+i).val());
			price.push($("#item_price_"+i).val());
			oprice.push($("#item_oprice_"+i).val());
			discount.push($("#item_discount_"+i).val());
		}
		
	}else{
		alert("请选取产品");
		return;
	}
	if(!ajaxid || !ajaxname){
		alert("请选择用户");
		return false;
	}
	
	var datacontent={"ajaxname": ajaxname, "cpid": ajaxid,"goodsid": goodsid,"quantity": quantity,"itemmaxsort":itemmaxsort,"shipuser": shipuser,"shipaddress": shipaddress,"shipzipcode": shipzipcode,"shipmobile": shipmobile,"shiptelephone": shiptelephone,"shipday": shipday,"shipmemo": shipmemo,"remark": remark,"istax": istax,"taxpayee": taxpayee,"taxcontent": taxcontent,"shipid": shipid,"discountamount":discountamount,"price":price,"oprice":oprice,"discount":discount}; 
	if(confirm("确定提交吗？")){
	$.ajax({
			type:"POST",	   
			url :filename+"?c=guide&a=ajaxordersaveadd",
			data:datacontent,
			dataType:"JSON",
			success: function(data,textStatus){
			data = eval(data);
			$.each(data, function(index,txt){
				if(txt['result']=='success'){
				    $(".itemlist").remove();
					$("#itemmaxsort").val(0);
					alert("添加成功");
					addTabs('管理'+txt['id'], 'shopping_cart_empty', filename+'?c=order&a=manage&id='+txt['id']);
				}else if(txt['result']=='shipuser'){
					alert("收货人不能为空");
				}else if(txt['result']=='shipaddress'){
					alert("收货地址不能为空");
				}else if(txt['result']=='shipmobile'){
					alert("收货人手机不能为空");
				}else if(txt['result']=='itemmaxsort'){
					alert("请添加订单清单");
				}else{
					alert("添加失败");
				}
			
			});  
			}
		});
	}
}

//提交验证（快速注册）
function tijiaozhuce(){
	if(confirm('确定要注册新用户吗？'))
	{
		var t = "";
		var v = "";
		
		t = "type";
			v = $("#"+t).val();
			if(v=="") {
				alert("请选择类型");
				$('#'+t).focus();
				return false;
			}
			
		t = "cpname";
		v = $("#"+t).val();
		if(v=="") {
			alert("客户名称不能为空");
			$('#'+t).focus();
			return false;
		}
		
		var typeid=$("#type").val();
		if(typeid==1){
			t = "entname";
			v = $("#"+t).val();
			if(v=="") {
				alert("企业类型企业名称不能为空");
				$('#'+t).focus();
				return false;
			}
		}
		t = "mobile";
		v = $("#"+t).val();
		if(v=="") {
			alert("手机号码不能为空");
			$('#'+t).focus();
			return false;
		}else{
		   var pass= checktelephone(t);
		   if(!pass){
				alert("手机号码不正确");
				$('#'+t).focus();
				return false;
		   }
		}
		
		t = "email";
		v = $("#"+t).val();
		if(v=="") {
			alert("邮箱不能为空");
			$('#'+t).focus();
			return false;
		}else{
		   var ispass= isEmail(v);
		   if(!ispass){
				alert("邮箱格式不正确");
				$('#'+t).focus();
				return false;
		   }
		}
		$('#search_forms').submit();
	}else{
		return false;
	} 
}
