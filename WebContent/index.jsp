<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
	
	<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<title>Insert title here</title>

<style>
</style>
<script>
var x;
	$(document).ready(function() {
		//$('#tcm').css('display','block');
		//$('#case').css('display','none');
	 });
	$(function() {
		$('#cancel').bind('click', function() {
			//$('#center').detach()
			$('#dlg').dialog('close');
			$("#opentest").dialog('open');
			$('#center').panel({
			    href:'test.jsp'
			});
		});
	});
	$(function() {
		$('#testcase').bind('click', function() {
			$('#dlg').dialog('close')
			//$('#center').detach();
			$('#center').panel({
			    href:'case.jsp'
			});
		});
	});
</script>
</head>
<body class="easyui-layout" style="font-family: Arial,Verdana,Sans-serif;">
	<!-- 导航菜单 -->
	<div
		style="height: 100px; background: rgb(255, 255, 255); overflow: hidden;"
		data-options="region:'north'">
		<div>
			<img id="pic" src="logo.png" style="height: 50px">
		</div>
		<div class="easyui-panel"
			style="padding: 5px; margin-top: 10px; width: 100%;">
			<a href="#" id="cancel" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-search'">打开计划</a> <a
				href="#" id="ref" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-add'">创建计划</a> <a
				href="#" id="testcase" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-edit'">用例库</a>
		</div>
	</div>
	<!-- 导航菜单 -->
	<!-- 打开计划 start -->
	<div id="opentest" closed="true" class="easyui-dialog" title="打开计划"
		style="width: 700px; height: 500px; padding: 5px" data-options="modal:true">
		<input class="easyui-searchbox" data-options="prompt:'Please Input Value',searcher:doSearch" style="width:70%;"></input>
	<script>
		function doSearch(value){
			alert('You input: ' + value);
		}
	</script>
	<div style="width: 100%;margin-top: 10px">
		<table class="easyui-datagrid" id="datagrid" style="height: auto; margin: 10px;"
			data-options="singleSelect:true,collapsible:true,method:'get',fit:false,border:true,fitColumns:true">
			<thead>
				<tr>
				<th data-options="field:'hidden',width:80" hidden="true">ID</th>
					<th data-options="field:'id',width:80" sortable="true">用例编号</th>
					<th data-options="field:'status',width:100" sortable="true">执行状态</th>
					<th data-options="field:'implement_user',width:100" sortable="true">执行者</th>
					<th data-options="field:'level',width:100" sortable="true">用例等级</th>
					<th data-options="field:'test_module',width:100" sortable="true">测试模块</th>
					<th data-options="field:'test_step',width:100" sortable="true">测试步骤</th>
					<th data-options="field:'expected_results',width:100" sortable="true">预期结果</th>
					<th data-options="field:'implement_time',width:100" sortable="true">执行时间</th>
				</tr>
			</thead>
		</table>
		</div>
		</div>
	<!-- 打开计划 end -->
	<!--  <div class="easyui-layout" href="west.jsp" style="width:100%;height:100%;"></div>-->
        <!--  <div data-options="region:'west',split:true" href="west.jsp" title="West" style="width:100px;"></div>-->
        	<div data-options="region:'center',fit:false,border:false,href:'test.jsp'" style="padding: 0px;border:0px;height: auto" id="center"></div>
</body>
</html>