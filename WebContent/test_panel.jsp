<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div id="dlg" closed="true" class="easyui-dialog" title="执行用例"
		style="width: 900px; height: 600px; padding: 0px">
		<div class="easyui-tabs" data-options="tabWidth:100,plain:true"
			style="width: auto; height: 100%; border: none;">
			<div title="用例执行" style="padding: 10px">
				<div style="float: left; padding-top: 5px;">
					<a href="#" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon-add'">提交故障</a>
				</div>
				<div
					style="text-align: right; border: 1px !important; border-color: black;">
					执行时间：<input type="text">
					创建时间：<input type="text">
					 <select id="casestatues" name="state"
						style="width: 15%; height: 23px; margin: 5px; border-color: #95B8E7; border-radius: 5px; outline: none; cursor: pointer;">
						<option value="1" title="该用例未执行">NoRun</option>
						<option value="2" title="该用例测试通过">Pass</option>
						<option value="3" title="该用例不适用本次测试">N/A</option>
						<option value="4" title="本次测试因环境等原因暂时无法执行">Block</option>
					</select> <img alt="" src="image/left.jpg"
						style="height: 25px; width: 25px; vertical-align: middle; cursor: pointer; margin: 5px">
					<input readonly="readonly" type="text" value="3/10"
						style="width: 50px; margin: 5px; text-align: center;"> <img
						alt="" src="image/right.jpg"
						style="height: 25px; width: 25px; vertical-align: middle; cursor: pointer; margin: 5px">
					<br />
					<hr style="background-color: #95B8E7; border: 0px; height: 1px;">
				</div>
				<div style="height: 90%; width: 95">
					<table border="0px" height="100%" width="100% style="vertical-align:top;">
						<tr height="50px">
							<td colspan="2">用例编号：<br> <input type="text"
								style="width: 95%;"></td>
							<td>用例描述：<br> <input type="text" style="width: 95%;"></td>
							<td rowspan="3" style="vertical-align: top;">预置条件：<br>
								<textarea style="width: 95%; height: 90%; resize: none;"></textarea></td>
						</tr>
						<tr height="50px">
							<td style="vertical-align: top; width: 15%">编写者：<br> <input
								type="text" style="width: 90%;">
							</td>
							<td style="vertical-align: top; width: 15%">关联用例：<br>
				
								<div>
									<input type="text" id="tip"
										style="width: 90%; position: relative;"
										onclick="javascript:$('#p').css('display','block')">
									<div id="p"
										style="border: 1px; border-color: #95B8E7; border-style: solid; background-color: white; width: 200px; height: 100px;; position: absolute;; outline: none; display: none; z-index: 100000">
										<div style="text-align: right; cursor: pointer;"
											onclick="$('#p').css('display','none')">关闭</div>
										<ui>lalal
										</ul>
									</div>
								</div>
							</td>
							<td rowspan="2">测试指导：<br> <textarea
									style="width: 95%; height: 80%; resize: none;"></textarea></td>
						</tr>
						<tr height="50px">
							<td style="vertical-align: top; width: 5%">测试模块：<br> <input
								type="text" style="width: 90%;">
							</td>
							<td style="vertical-align: top; width: 5%">用例级别：<br> <input
								type="text" style="width: 90%;">
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
							<td style="vertical-align: top; height: 100px" colspan="2">附件下载：<br>
								<table class="easyui-datagrid" id="datagrid"
									style="width: 95%; height: 75%; margin: 0px; border-color: black;"
									data-options="singleSelect:true,collapsible:true,method:'get'">
									<thead>
										<tr>
											<th data-options="field:'itemid'">Item ID</th>
											<th data-options="field:'productid'">Product</th>
										</tr>
									</thead>
								</table></td>
						</tr>
						<tr>
							<td colspan="4">
								<div style="width: 100%; height: 100%;">
									<div style="height: 100%; width: 60%; float: left;">
										测试结果<br>
										<textarea style="height: 40%; width: 96%; resize: none"></textarea>
										<br>备注<br> <input type="text" style="width: 96%">
									</div>
									<div style="height: 100%; width: 40%; float: left;">
										用例执行附件列表<br>
										<table class="easyui-datagrid" id="datagrid"
											style="width: 98%; height: 45%; margin: 0px; border-color: black;"
											data-options="singleSelect:true,collapsible:true,method:'get'">
											<thead>
												<tr>
													<th data-options="field:'itemid'">Item ID</th>
													<th data-options="field:'productid'">Product</th>
												</tr>
											</thead>
										</table>
										<br>
										<button style="width: 20%; outline: none;"
											class="easyui-linkbutton">上传</button>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div title="执行历史" style="padding: 0px">
				<table class="easyui-datagrid" id="datagrid"
					style="width: auto; height: auto; margin: 0px;"
					data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get',fitColumns:true,fit:true">
					<thead>
						<tr>
							<th data-options="field:'itemid',width:80">Item ID</th>
							<th data-options="field:'productid',width:100">Product</th>
						</tr>
					</thead>
				</table>
				 <div id="tooltip" class="easyui-tooltip" style="height: 100px;width: 100px"></div>
			</div>
		</div>
	</div>
</body>
</html>