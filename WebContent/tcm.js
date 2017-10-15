$(document).ready(function(){
	$('#tree').tree({
		
		onContextMenu: function(e, node){
			e.preventDefault();
			if($('#tree').tree('isLeaf',node.target)){//判断是否是叶子节点  
				//alert(node.text);  // alert node text property when clicked
				$('#tt').tree('select', node.target);
				// display context menu
				$('#mm').menu('show', {
					left: e.pageX,
					top: e.pageY
				});
				$('#mm').menu({
				    onClick:function(item){
				        //...
				    	alert(item.text);
				    }
				});
			}
			
		},
		
		onClick: function(node){
			if($('#tree').tree('isLeaf',node.target)){//判断是否是叶子节点  
				alert(node.text);  // alert node text property when clicked
				
					if ($('#tab').tabs('exists', node.text)){
						$('#tab').tabs('select', node.text);
					} else {
						
						$.ajax({
							  type: 'get',
							  url: "/TCM/selectcreatcase",
							  data: {
								  id:node.text,
							  },
							  success: function(data,status){
								  $.messager.progress('close');
					 		      alert(data);
					 		     var content = "<div>"+data+"</div>";
									$('#tab').tabs('add',{
										title:node.text,
										content:'<iframe src="/TCM/selectcreatcase?id='+node.text+'" height="100%" width="100%" frameborder="0">123</div>',
										closable:true
									});},
					 		      
							});
						
						
					}
			}
			else
				alert(node.text+"---")
		}
	});
	$('#datagrid').datagrid({
		onDblClickRow:function(){
		var row = $('#datagrid').datagrid('getSelected');
		if (row){
			//alert('Item ID:'+row.itemid+"Price:"+row.productid);

			$("#dlg").dialog('open');
			$("#_easyui_textbox_input1").val('Item ID:'+row.itemid+"Price:"+row.productid);
		}
		$(".combobox-item").css("title","cds");
		}
		});
	$("#next").click(function(){
		var row = $('#datagrid').datagrid('getData').rows[1];
		var rowIndex = $('#datagrid').datagrid('getRowIndex', row);
		//var row = $('#datagrid').datagrid('getSelected');
		if (row){
			//alert('Item ID:'+row.itemid+"Price:"+row.productid);

			$("#dlg").dialog('open');
			$("#_easyui_textbox_input1").val(rowIndex+'-'+'Item ID:'+row.itemid+"Price:"+row.productid);
		}
	});

});
function hide(){
	if($('#tools').css('display')=='block')
	    $('#tools').hide();
	else
		$('#tools').show();
}
function loa(){
	alert("ms");
		$(".combobox-item").css('title','cds'); //这个是jquery代码 
}
