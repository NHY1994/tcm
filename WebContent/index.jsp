<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">

<script type="text/javascript"
	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<title>Insert title here</title>

<style>
</style>
<script>
	var x;
	$(document).ready(function() {
		//$('#datagrid1').datagrid({
		//url : '/TCM/testcase'
		//})
		//$('#tcm').css('display','block');
		//$('#case').css('display','none');
	});
	$(function() {
		$('#optest').bind('click', function() {
			//$('#center').detach()
			$('#dlg').dialog('close');
			$("#opentest").dialog('open');
			//$('#center').panel({
			//	href : 'test.jsp'
			//});
		});
	});
	$(function() {
		$('#creplan').bind('click', function() {
			//$('#center').detach()
			$('#dlg').dialog('close');
			$("#createplan").dialog('open');
		});
	});

	$(function() {

		$('#mm1').menu({
			onClick : function(item) {
				var item = item.name;
				alert(item);
				$('#center').panel({
					href : 'case.jsp?item=' + item
				});
			}
		});

		/* $('#testcase').bind('click', function() {
			$('#dlg').dialog('close');
			//$('#center').detach();
			alert($("#testcase").linkbutton("item"));
			$('#center').panel({
				href : 'case.jsp'
			});
		}); */
	});
</script>
</head>
<body class="easyui-layout"
	style="font-family: Arial, Verdana, Sans-serif;">
	<!-- 导航菜单 -->
	<div
		style="height: 100px; background: rgb(255, 255, 255); overflow: hidden;"
		data-options="region:'north'">
		<div>
			<%
				HttpSession session2 = request.getSession();
			%>
			<img id="pic" src="logo.png" style="height: 50px">&nbsp;&nbsp;&nbsp;欢迎你:<%=session2.getAttribute("username")%>
		</div>
		<div class="easyui-panel"
			style="padding: 5px; margin-top: 10px; width: 100%;">
			<a href="#" id="optest" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-search'">打开计划</a> <a href="#"
				id="creplan" class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon-add'">创建计划</a> <a href="#"
				id="testcase" class="easyui-menubutton"
				data-options="menu:'#mm1',plain:true,iconCls:'icon-edit'">用例库</a> <a
				href="#" id="testcase" class="easyui-menubutton"
				data-options="menu:'#mm2',plain:true,iconCls:'icon-bug'">故障管理</a> <a
				href="#" id="testcase" class="easyui-linkbutton"
				data-options="menu:'#mm',plain:true,iconCls:'icon-large-chart'">测试报表</a>
		</div>
		<div id="mm1" style="width: auto;" class="easyui-menu">
			<div data-options="name:'Lopscoop-Web'">Lopscoop-Web</div>
			<div data-options="name:'Lopscoop-APP'">Lopscoop-APP</div>
			<div data-options="name:'Lopscoop-Manager'">Lopscoop-Manager</div>
		</div>
		<div id="mm2" style="width: auto;" class="easyui-menu">
			<div data-options="name:'bugmanage'">故障管理</div>
			<div data-options="name:'SubmitBug'">提交故障</div>
		</div>
	</div>
	<!-- 导航菜单 -->
	<!-- 打开计划 start -->
	<div id="opentest" closed="true" class="easyui-dialog" title="打开计划"
		style="width: 700px; height: 500px;"modal:true">
		<div style="width: 100%; padding: 0px">
			<table class="easyui-datagrid" id="datagrid-opentest"
				style="height: auto; margin: 10px;"
				data-options="singleSelect:true,collapsible:true,method:'get',fit:false,border:true,fitColumns:true,url:'/TCM/selectplan',toolbar:'#tb1'">
				<thead>
					<tr>
						<th data-options="field:'hidden',width:80" hidden="true">ID</th>
						<th data-options="field:'id',width:80" sortable="true">ID</th>
						<th data-options="field:'project',width:100" sortable="true">测试项目</th>
						<th data-options="field:'star_timetoString',width:100"
							sortable="true">开始时间</th>
						<th data-options="field:'end_timetoString',width:100" sortable="true">结束时间</th>
						<th data-options="field:'status',width:100" sortable="true">状态</th>
						<th data-options="field:'software_version',width:100" sortable="true">软件版本</th>
						<th data-options="field:'plan_version',width:100"
							sortable="true">计划版本</th>
					</tr>
				</thead>
			</table>
			<div id="tb1" style="padding: 5px; height: auto">
				<div>
					<input type="text" class="easyui-textbox" id="searchtest"> <a href="#"
						class="easyui-linkbutton" iconCls="icon-search" id="search">搜索</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 打开计划 end -->

	<!-- 创建计划Start -->
	<div id="createplan" closed="true" class="easyui-dialog" title="创建计划"
		style="width: 700px; height: 500px;" data-options="modal:true">

		<table style="height: 100%; width: 100%; font-size: 13px" border="0px">
			<tr style="height: 50px">
				<td width="33%">测试项目：<br> <select id="project"
					class="easyui-combobox" name="dept" style="width: 98%;"
					data-options="editable:false">
						<option value="1">请选择...</option>
						<option value="2">Lopscoop-PcWeb</option>
						<option value="3">Lopscoop-MobWeb</option>
						<option value="4">Lopscoop-MobApp</option>
						<option value="5">invirlink-PcWeb</option>
				</select>
				</td>
				<td width="33%">软件版本：<br> <input id="sv"
					class="easyui-textbox" style="width: 98%"></td>
				<td width="33%">测试计划版本：<br> <select id="pv"
					class="easyui-combobox" name="dept" style="width: 98%;"
					data-options="editable:false">
						<option value="1">请选择...</option>
						<option value="2">B01</option>
						<option value="3">B02</option>
						<option value="4">B03</option>
						<option value="5">B04</option>
				</select></td>
			</tr>
			<tr style="height: 50px">
				<td colspan="3">本次测试计划编号： <input id="testversion" type="text"
					style="width: 80%">
				</td>
			</tr>
			<tr style="height: 50px">
				<td colspan="3">测试用例级别：<input type="checkbox" name="case"
					value="A" />A <input type="checkbox" name="case" value="B" />B <input
					type="checkbox" name="case" value="C" />C
				</td>
			</tr>
			<tr>
				<td colspan="3" style="height: 50px">
					<div style="width: 50%; float: left;">
						开始时间：<input id="stdate" type="text" class="easyui-datebox"
							required="required" data-options="editable:false">
					</div>
					<div style="width: 50%; float: right;">
						结束时间：<input id="enddate" type="text" class="easyui-datebox"
							required="required" data-options="editable:false">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">备注：<br> <textarea
						style="width: 99%; height: 90%; resize: none;" id="note"></textarea>
				</td>
			</tr>
			<tr style="height: 50px">
				<td colspan="3"><input type="button" id="create"
					class="easyui-linkbutton" value="创建"
					style="width: 100px; height: 30px; float: right; margin-right: 10px">
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//opentest dialog
		
		
		
		$('#search').bind('click', function() {
			$('#datagrid-opentest').datagrid({
				url:'/TCM/selectplan?selectPlan='+$('#searchtest').val()
			});	
			});
			$('#datagrid-opentest').datagrid({
				onDblClickRow : function(index, field, value) {
					var row = $('#datagrid-opentest').datagrid('getSelected');
					if (row) {
						alert('Item ID:' + row.id);
					}
					$('#center').panel({
							href : 'test.jsp'
						});
				}
			});
			//opentest dialog

			function change() {
				var project = $('#project').combobox('getText');
				var pv = $('#pv').combobox('getText');
				var sv = $("#sv").val();
				$("#testversion").val(project + "-v" + sv + "-" + pv);
				//alert(val)
			}
			$("#project").combobox({
				onChange : function(newValue, oldValue) {
					change()
				}
			});
			$("#pv").combobox({
				onChange : function(newValue, oldValue) {
					change()
				}
			});
			$("#sv").textbox({
				onChange : function(value) {
					change()
				}
			});
			$("#create").click(function() {
				var case_level = new Array();
				$('input[name="case"]:checked').each(function() {
					case_level.push($(this).val());//向数组中添加元素  
				});
				var idstr = case_level.join(',');//将数组元素连接起来以构建一个字符串  
				alert(idstr);
				$.post("/TCM/creatpaln", {
					test_project : $('#project').combobox('getText'),
					software_version : $("#sv").val(),
					plan_version : $('#pv').combobox('getText'),
					testversion : $("#testversion").val(),
					case_level : idstr,
					star_time : $('#stdate').datebox('getValue'),
					end_time : $('#enddate').datebox('getValue'),
					note : $("#note").val()
				}, function(data, status) {
					if (status == 'success') {
						$.messager.alert('提示', '创建成功');
						$("#createplan").dialog('close');

					} else
						alert("Error")
				});
			});
		})
	</script>
	<!-- 创建计划End -->
	<!-- 存储计划编号 -->
	<input type="hidden" name="planid" value="10010">
	<input type="hidden" name="par" value="">
	<!--  <div class="easyui-layout" href="west.jsp" style="width:100%;height:100%;"></div>-->
	<!--  <div data-options="region:'west',split:true" href="west.jsp" title="West" style="width:100px;"></div>-->
	<div
		data-options="region:'center',fit:false,border:false,href:'test.jsp'"
		style="padding: 0px; border: 0px; height: auto" id="center"></div>
</body>
</html>