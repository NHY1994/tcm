<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="tcm2.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<title>Insert title here</title>
</head>
<body style="margin: 0px">
	<%String testPlanid=request.getParameter("testPlanid"); %>
	<div id="tools" style="font-size: 13px;">
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
		plain="true" onclick="hide()"></a>
		Date From: <input class="easyui-datebox" style="width: 80px">
		To: <input class="easyui-datebox" style="width: 80px">
		Language: <input class="easyui-combobox" style="width: 100px"
			valueField="id" textField="text"> <a href="#"
			class="easyui-linkbutton" iconCls="icon-search">Search</a>
	</div>
		<table class="easyui-datagrid" id="test_center_data"
			style="height: auto; margin: 0px;"
			data-options="singleSelect:true,collapsible:true,method:'get',fit:true,border:true,fitColumns:true,toolbar:'#toolbar'">
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
	
	<script type="text/javascript">
	var row;
	var rowIndex;
	var data;
	var rowid;
	function open1(){
		$.post("/TCM/selectcase",
			    {
			      id:rowid
			    },
			    function(data,status){
			      var jsondatas=eval("("+data+")");
			      $.each(jsondatas.data,function(i,n){  
			    	  parent.$('#create_time').val(n.create_time);
			    	  parent.$('#test_module').val(n.test_module);
			    	  parent.$('#level').val(n.level);
			    	  parent.$('#precondition').val(n.precondition);
			    	  parent.$('#expected_results').val(n.expected_results);
			    	  parent.$('#test_attachment').val(n.test_attachment);
			    	  parent.$('#test_guidance').val(n.test_guidance);
			    	  parent.$('#implement_time').val(n.implement_time);
			    	  parent.$('#test_step').val(n.test_step);
			    	  parent.$('#attachment').val(n.attachment);
			    	  parent.$('#test_project').val(n.test_project);
			    	  parent.$('#actual_result').val(n.actual_result);
			    	  parent.$('#id').val(n.id);
			    	  parent.$('#create_user').val(n.create_user);
			    	  parent.$('#descript').val(n.descript);
			    	  parent.$('#plan_number').val(n.plan_number);
			    	  parent.$('#implement_user').val(n.implement_user);
			    	  }  
			    	  )  
			      parent.$.messager.progress('close');
			    });
	};
		$(document).ready(function() {
			//alert(parent.$("input:hidden[name='par']").val()+"789");
			parent.$("#next,#pre").click(function(){
				//alert($(this).attr("id"))
				  if($(this).attr("id")=="pre"){
					  if(rowIndex<=0){
						  rowIndex=1;
					  }
					    console.log($(this).attr("id")+"1");
						var row1=$('#test_center_data').datagrid('getData').rows[--rowIndex];
						console.log(rowIndex);
						rowid=row1.id;
						console.log(rowid);
						console.log("***"+rowIndex+1+'/'+data.rows.length);
						parent.$("#casenum").val(rowIndex+1+'/'+data.rows.length);
						//parent.$('#casenum').val('12/1')
                        //var casenum=window.parent.document.getElementById("casenum")
                        //casenum.value="123"
						open1();
				  }
				  else{
					  if(rowIndex>=data.rows.length-1){
						  rowIndex=data.rows.length-2;
					  }
					  console.log($(this).attr("id"));
					  var row1=$('#test_center_data').datagrid('getData').rows[++rowIndex];
						console.log(rowIndex);
						console.log(row1);
						console.log("***"+rowIndex+1+'/'+data.rows.length);
						parent.$("#casenum").val(rowIndex+1+'/'+data.rows.length);
						rowid=row1.id;
						console.log(rowid);
						open1();
				  }	  
			});
			
			$('#test_center_data').datagrid({
				url:'/TCM/testcase'+parent.$("input:hidden[name='par']").val(),
								onDblClickRow : function() {
									data=$('#test_center_data').datagrid('getData');
									console.log(data.rows.length);
									row = $('#test_center_data').datagrid('getSelected');
									rowid=row.id;
									rowIndex = $('#test_center_data').datagrid('getRowIndex', row);
									console.log("***"+rowIndex+1+'/'+data.rows.length);
									parent.$("#casenum").val(rowIndex+1+'/'+data.rows.length);
									if (row) {
										//parent.$("#dlg").dialog('open');
										parent.$("#dlg").dialog({
											//title:'123'
											onOpen:function (){
												open1();
											}
										});
										parent.$("#dlg").dialog('open');
										parent.$.messager.progress({
											title:'请稍等',
											text:'加载中...'
										});
										parent.$("#tip").val(
												'Item ID:' + row.id
														+ "Price:"
														+ row.implement_time);
									}
									$(".combobox-item").css("title", "cds");
								}
							});
					parent.$("#casestatues").change(function(){ 
						var selectValue = parent.$("#casestatues").val();
						$("#dlg").load("test #dlg",null,function(){alert("加载成功")});
						parent.$("#tip").val(selectValue);
						}); 
				});
		function hide() {
			if ($('#tools').css('display') == 'block')
				$('#tools').hide();
			else
				$('#tools').show();
		}
	</script>

</body>
</html>