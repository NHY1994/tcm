<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="west.js"></script>
<script type="text/javascript" src="../tcm.js"></script>
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
		
		</div>
		</div>
</body>
</html>