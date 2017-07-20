<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="tcm.js"></script>
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
			$('#tcm').css('display','none');
			$('#case').css('display','block');
		});
	});
	$(function() {
		$('#ref').bind('click', function() {
			
		});
	});
</script>
</head>
<body class="easyui-layout">
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
				data-options="plain:true,iconCls:'icon-cancel'">Cancel</a> <a
				href="#" id="ref" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-reload'">Refresh</a> <a
				href="#" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-search'">Search</a> <a
				href="#" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-help'"> </a>
		</div>
	</div>
	<!-- 导航菜单 -->
	div data-options="region:'south',split:true" style="height:50px;"></div>
        <div data-options="region:'west',split:true" title="West" style="width:100px;"></div>
        <div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">

        </div>
    </div>
</body>
</html>