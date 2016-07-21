<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>客户统计</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{if $fromtype != 'jdbox'}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
<!--{/if}-->
<script language="javascript">
$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            title: {
                text: '统计客户人数',
                x: -20 //center
            },
            subtitle: {
                text: '',
                x: -20
            },
            xAxis: {
                categories: [<!--{foreach name=flag from=$data item=volist}-->'<!--{$volist.createtime}-->'<!--{if !$smarty.foreach.flag.last}-->,<!--{/if}--><!--{/foreach}-->]
            },
            yAxis: {
                title: {
                    text: '人数'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y;
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            series: [{
                name: '日期：注册人数',
                data: [<!--{foreach name=flag from=$data item=volist}--><!--{$volist.access_count}--><!--{if !$smarty.foreach.flag.last}-->,<!--{/if}--><!--{/foreach}-->]
            }]
        });
    });
    
});
</script>
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<style type="text/css">
.wait{ color:#0066FF}
.right{ color:#00CC33}
.wrong{ color:#FF3333}
</style>

<div class="main-wrap">
  <div class="form-div">
    <form action="" method="post" id="selectForm" name="selectForm">
    开始日期&nbsp;&nbsp;
<!--    <input name="start_date" value="{$start_date}" style="width:80px;" readonly="readonly" onfocus="selDate(this, '%Y-%m-%d');" />
-->    <input type="text" class="reg_input Wdate" id="d123" value="<!--{$start_date}-->" name="start_date" readonly="true"  onfocus="WdatePicker({isShowWeek:true,onpicked:function() {$dp.$('d123_1').value=$dp.cal.getP('W','W');$dp.$('d123_2').value=$dp.cal.getP('W','WW');}})" />
    结束日期&nbsp;&nbsp;
<!--    <input name="end_date" value="{$end_date}" style="width:80px;" readonly="readonly" onfocus="selDate(this, '%Y-%m-%d');" />
-->     <input type="text" class="reg_input Wdate" id="d124" value="<!--{$end_date}-->" name="end_date" readonly="true"  onfocus="WdatePicker({isShowWeek:true,onpicked:function() {$dp.$('d124_1').value=$dp.cal.getP('W','W');$dp.$('d124_2').value=$dp.cal.getP('W','WW');}})" />

    <input type="submit" name="submit" value="查询" class="button" />
     总人数&nbsp;&nbsp;:<!--{$countnum}-->
    </form>
</div>
	<script src="<!--{$urlpath}-->tpl/static/js/highcharts/highcharts.js"></script>
    <script src="<!--{$urlpath}-->tpl/static/js/highcharts/modules/exporting.js"></script>
  <div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
</div>
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
</body>
</html>