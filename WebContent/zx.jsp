<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="tcm2.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<div style="padding: 5px; height: auto">
						<div style="margin-bottom: 5px">
							<a href="#" class="easyui-linkbutton" iconCls="icon-add"
								plain="true"></a> <a href="#" class="easyui-linkbutton"
								iconCls="icon-edit" plain="true"></a> <a href="#"
								class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
							<a href="#" class="easyui-linkbutton" iconCls="icon-cut"
								plain="true"></a> <a href="#" class="easyui-linkbutton"
								iconCls="icon-remove" plain="true" onclick="hide()"></a>
						</div>
						<div id="tools">
							Date From: <input class="easyui-datebox" style="width: 80px">
							To: <input class="easyui-datebox" style="width: 80px">
							Language: <input class="easyui-combobox" style="width: 100px"
								valueField="id" textField="text"> <a href="#"
								class="easyui-linkbutton" iconCls="icon-search">Search</a>
						</div>
					</div>
					<div class="easyui-pagination" data-options="total:2"></div>
					<div style="width: 100%">
						<table class="easyui-datagrid" id="datagrid"
							style="height: auto;"
							data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get',fit:false,border:true,fitColumns:true">
							<thead>
								<tr>
									<th data-options="field:'itemid',width:80">Item ID</th>
									<th data-options="field:'productid',width:100">Product</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="easyui-pagination" data-options="total:2"></div>
</body>
</html>