<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
<div data-options="region:'west',split:true" title="West" style="width:100px;">
<ul id="tree" class="easyui-tree"
			data-options="animate:true,lines:true">
			<li><span>My Documents</span>
				<ul>
					<li data-options="state:'closed'"><span>Photos</span>
						<ul>
							<li><span>Friend</span></li>
							<li><span>Wife</span></li>
							<li><span>Company</span></li>
						</ul></li>
					<li>index.html</li>
					<li>about.html</li>
					<li>welcome.html</li>
				</ul></li>
		</ul>
		</div>
<div data-options="region:'center'" class="easyui-tabs" id="tab">

		<div title="About">

			<div id="tb" style="padding: 5px; height: auto">
				<div style="margin-bottom: 5px">
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
			</div>
			<div style="height: 90%; width: 95; font-size: 13px;">
				<table border="0px" height="100%" width="100% style="vertical-align:top;">
					<tr height="50px">
						<td colspan="2">用例编号：<br> <input type="text"
							style="width: 95%;" value=123></td>
						<td>用例描述：<br> <input type="text" style="width: 95%;"></td>
						<td rowspan="3" style="vertical-align: top;">预置条件：<br> <textarea
								style="width: 95%; height: 90%; resize: none;"></textarea></td>
					</tr>
					<tr height="50px">
						<td style="vertical-align: top; width: 15%">编写者：<br> <input
							type="text" style="width: 90%;">
						</td>
						<td style="vertical-align: top; width: 15%">用例类型：<br> <select
							id="cc" class="easyui-combobox" name="dept" data-options="panelHeight:'auto',editable:'false'" style="width: 90%;">
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
						</select>
						</td>
						<td rowspan="2">测试指导：<br> <textarea
								style="width: 95%; height: 80%; resize: none;"></textarea></td>
					</tr>
					<tr height="50px">
						<td style="vertical-align: top; width: 5%">测试模块：<br> <input
							type="text" style="width: 90%;">
						</td>
						<td style="vertical-align: top; width: 5%">用例级别：<br> <select
							id="cc" class="easyui-combobox" data-options="panelHeight:'auto'" name="dept" style="width: 90%;">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
						</select>
					</tr>
					<tr>
						<td colspan="2" height="50px">测试项目<br> <input
							type="text" style="width: 95%;"></td>
						<td rowspan="2">测试步骤：<br> <textarea
								style="width: 95%; height: 80%; resize: none;"></textarea></td>
						<td rowspan="2">预期结果：<br> <textarea
								style="width: 95%; height: 80%; resize: none;"></textarea></td>
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
							<div style="width: 100%; height: 100%;">
								<button class="easyui-linkbutton">保 存</button>
								<button class="easyui-linkbutton">取 消</button>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
</div>
	</div>
</body>
</html>