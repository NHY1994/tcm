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
<script type="text/javascript" src="tcm.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var h = document.documentElement.clientHeight - 60;
		//$("#com").css("height", h);
		//alert(h);

	});
</script>
<title>Insert title here</title>
</head>
<body class="easyui-layout">
	<h2>Basic Layout</h2>
	<div data-options="region:'north'" style="height: 50px"></div>
	<div data-options="region:'west',split:true" title="West"
		style="width: 100px;"></div>
	<div data-options="region:'center'" id="tab" style="width: 100%;">
		<div id="tabs" class="easyui-tabs"
			data-options="border:false,fit:true">
			<div title="About">
				<div class="easyui-pagination" style="height: 30px"
					data-options="total:2"></div>
				<table class="easyui-datagrid" style="width: 100%"
					data-options="url:'datagrid_data1.json',method:'get',border:false,singleSelect:true,fitColumns:true">
					<thead>
						<tr>
							<th data-options="field:'itemid'" width="80">Item ID</th>
							<th data-options="field:'productid'" width="100">Product ID</th>
							<th data-options="field:'listprice',align:'right'" width="80">List
								Price</th>
							<th data-options="field:'unitcost',align:'right'" width="80">Unit
								Cost</th>
							<th data-options="field:'attr1'" width="150">Attribute</th>
							<th data-options="field:'status',align:'center'" width="60">Status</th>
						</tr>
					</thead>
				</table>
				<div class="easyui-pagination" style="height: 30px"
					data-options="total:2"></div>
			</div>

		</div>
	</div>
</body>
</html>