<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="testcase.caseinfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
</head>
<body>
<%caseinfo user=(caseinfo)request.getAttribute("caseinfo"); %>
<div title="编辑用例" data-options="fit:false">

			<div id="tb" style="padding: 5px; height: 100%;bottom: 0px" data-options="fit:false">
				<div>
					<a href="#" class="easyui-linkbutton" iconCls="icon-add"
						plain="true"></a> <a href="#" class="easyui-linkbutton"
						iconCls="icon-edit" plain="true"></a> <a href="#"
						class="easyui-linkbutton" iconCls="icon-save" plain="true"></a> <a
						href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
					<a href="#" class="easyui-linkbutton" iconCls="icon-remove"
						plain="true" onclick="hide()"></a>
				</div>
				<div id="tools">
					Date From: <input class="easyui-datebox" style="width: 80px">
					To: <input class="easyui-datebox" style="width: 80px">
					Language: <input class="easyui-combobox" style="width: 100px"
						valueField="id" textField="text"> <a href="#"
						class="easyui-linkbutton" iconCls="icon-search">Search</a>
				</div>
				<div style="height: 300px;margin-bottom: 0px" data-options="fit:true">
				<table border="0px" height="100%" style="vertical-align:top;width:70%;border: 1px;">
					<tr height="50px">
						<td colspan="2">用例编号：<br> <input type="text"
							style="width: 95%;" id="id" value="<%=user.getId()%>"></td>
						<td>用例描述：<br> <input type="text" id="descript" style="width: 95%;" value="<%=user.getDescript()%>"></td>
						<td rowspan="3" style="vertical-align: top;">预置条件：<br> <textarea
								style="width: 95%; height: 90%; resize: none;" id="precondition"><%=user.getPrecondition()%></textarea></td>
					</tr>
					<tr height="50px">
						<td style="vertical-align: top; width: 15%">编写者：<br> <input
							type="text" style="width: 90%;" value="<%=user.getCreate_user()%>">
						</td>
						<td style="vertical-align: top; width: 15%">用例类型：<br> <select
							id="cc" class="easyui-combobox" name="dept" data-options="panelHeight:'auto',editable:false" style="width: 90%;">
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
						</select>
						</td>
						<td rowspan="2">测试指导：<br> <textarea
								style="width: 95%; height: 80%; resize: none;" id="test_guidance"><%=user.getTest_guidance()%></textarea></td>
					</tr>
					<tr height="50px">
						<td style="vertical-align: top; width: 5%">测试模块：<br> <input
							type="text" style="width: 90%;" id="test_module" value="<%=user.getTest_module()%>">
						</td>
						<td style="vertical-align: top; width: 5%">用例级别：<br> <select
							id="level" class="easyui-combobox" data-options="panelHeight:'auto',editable:false" name="dept" style="width: 90%;">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
						</select>
					</tr>
					<tr>
						<td colspan="2" height="50px">测试项目<br> <input
							type="text" style="width: 95%;" id="test_project" value="<%=user.getTest_project()%>"></td>
						<td rowspan="2">测试步骤：<br> <textarea
								style="width: 95%; height: 80%; resize: none;" id="test_step"><%=user.getTest_step()%></textarea></td>
						<td rowspan="2">预期结果：<br> <textarea
								style="width: 95%; height: 80%; resize: none;" id="expected_results"><%=user.getExpected_results()%></textarea></td>
					</tr>
					<tr>
						<td style="vertical-align: top; height: 100px" colspan="2">附件上传：<br>
							<div style="margin-bottom: 20px">
								<input class="easyui-filebox" name="file1"
									data-options="prompt:'Choose a file...'" style="width: 95%">
							</div>
							<div>
								<a href="#" class="easyui-linkbutton" style="width: 95%">Upload</a>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<div style="width: 100%; height: auto%;">
								<button class="easyui-linkbutton" id="save">更 新</button>
								<button class="easyui-linkbutton">取 消</button>
							</div>
						</td>
					</tr>
				</table>
				</div>
			</div>
				
			</div>
			
			 <script type="text/javascript">
	$(document).ready(function() {
		
		//alert('<%=request.getParameter("item")%>'+"456");
		$("#save").click(function(){
			$.messager.progress({
				title:'请稍等',
				text:'加载中...'
			});
		$.ajax({
			  type: 'POST',
			  url: "/TCM/UpDataCase",
			  data: {
				  id:$("#id").val(),
				  descript:$("#descript").val(),
				  test_module:$("#test_module").val(),
				  level:$("#level").val(),
				  test_guidance:$("#test_guidance").val(),
				  precondition:$("#precondition").val(),
				  test_project:$("#test_project").val(),
				  test_step:$("#test_step").val(),
				  expected_results:$("#expected_results").val(),
			  },
			  success: function(data,status){
				  $.messager.progress('close');
	 		      alert(data);},
			});
		});
	})
	</script>
	
</body>
</html>