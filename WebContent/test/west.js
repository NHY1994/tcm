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
								var content = '<iframe scrolling="auto" frameborder="0" src="https://www.baidu.com/" style="width:100%;height:100%;"></iframe>';
								$('#tab').tabs('add',{
									title:node.text,
									content:content,
									closable:true
								});
							}
					}
				}
			});
		});