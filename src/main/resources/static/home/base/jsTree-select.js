var ApmJstreeUtil = {
	/**
	 * @param  render-渲染id，saveFiled-存储的input id，showField-展示的input id，
	 * picker-下拉div的id
	 */
	bindJstree : function(obj) { //输入对象
		//初始化下拉隐藏域的弹出位置和宽高
		var picker = $('#' + obj['picker']);
		picker.addClass('apm-tree-picker');
		picker.css('width', obj['width']);
		picker.css('height', obj['height']);
		var inputDiv = $('#' + obj['showField']);
		var top = inputDiv.offset().top + inputDiv.outerHeight(); //获取偏移位置
		var left = inputDiv.offset().left;
		picker.css('top', top); //设置绝对位置
		picker.css('left', left);
		
		var treeObj = $('#' + obj['render']);
		treeObj.css("text-align", "left");
		
		var deleteIcon = inputDiv.find("i"); //通过find查找子元素
		var inputShow = inputDiv.find("input");
		var saveInput = $('#' + obj['saveField']);
		
		//默认查询框，可以外部自定义，从而覆盖该触发方式
		if (obj['searchField'] && $('#' + obj['searchField'])) {
			var searchFieldObj = $('#' + obj['searchField']);
			var to = false;
			searchFieldObj.keyup(function() { //绑定按键事件，也可以绑定特定按键
				if (to) {
					clearTimeout(to);
				}
				to = setTimeout(function() {
					var v = searchFieldObj.val();
					treeObj.jstree(true).search(v);
				}, 250);
			});
		}
		
		//将选择值显示在输入input和隐藏input
		treeObj.on("changed.jstree", function(e, data) {
			if (data && data.selected.length > 0) {
				$('#' + obj['saveField']).val(data.selected.join(","));
				var i, j, r = [];
			    for(i = 0, j = data.selected.length; i < j; i++) {
			       r.push(data.instance.get_node(data.selected[i]).text);
			    }
			    deleteIcon.show();
			    inputShow.val(r.join(","));
			} else {
				deleteIcon.hide();
				inputShow.val("");
				
				
				                                saveInput.val("");
			}
		});
		
		// 绑定load时间，初始化数据显示
		treeObj.on("loaded.jstree", function(e, data) {
			treeObj.jstree("open_all");  //展开全部
			var saveValue = $('#' + obj['saveField']).val();
			var checkNodeIds = saveValue.split(",");			
			if (!saveValue || !checkNodeIds || checkNodeIds.length === 0) {
				deleteIcon.hide();
				return ;
			}
			var r = [];
			treeObj.find("li").each(function() {
				for (var i = 0; i < checkNodeIds.length; i++) {
					if ($(this).attr("id") == checkNodeIds[i]) { //如果节点的ID等于checkNodeIds[i]，表示要选中
						r.push(data.instance.get_node(checkNodeIds[i]).text);
						treeObj.jstree("select_node", $(this)); //选中的节点，不是check_node
						//$(this).children("a").addClass("jstree-clicked");
						break;
					}
				}
			})
			deleteIcon.show();
			inputShow.val(r.join(","));
		});
		
		//隐藏和展示绑定
		inputDiv.on('click', function() {
			picker.show();
		});
		$('body').click(function(evt) {
			if ($(evt.target).parents('#' + obj['showField']).length == 0
			 		&& $(evt.target).parents('#' + obj['picker']).length == 0 //判断鼠标点击的上层是否是#jstree_div
					&& evt.target.id != obj['showField']
					&& evt.target.id != obj['picker']
					&& evt.target.className.indexOf("jstree") == -1) { //防止点击展开节点前面值为true
				picker.hide();
			}
		});
		//清空按钮
		deleteIcon.on('click', function() {
			ApmJstreeUtil.deselectJstree(obj);
			deleteIcon.hide();
		});
	},
	
	/**
	 * 清楚被选中的项
	 * @param render-渲染id，saveFiled-存储的input id，showField-展示的input id，
	 * picker-下拉div的id
	 */
	deselectJstree : function(obj) {
		var treeObj = $('#' + obj['render']);
		var saveField = $('#' + obj['saveField']);
		var checkNodeIds = saveField.val().split(",");			
		if (!checkNodeIds || checkNodeIds.length === 0) {
			return ;
		}
		treeObj.find("li").each(function() {
			for (var i = 0; i < checkNodeIds.length; i++) {
				if ($(this).attr("id") == checkNodeIds[i]) {
					treeObj.jstree("deselect_node", $(this)); //取消选中的节点
					break;
				}
			}
		})
		
	saveInput.val("");
	}
};



	var treeData = null;
	request(
		"jsTreeSelect",
		"get",
		{id:"1"},
		function (result) {
            treeData = result.data;
        }
	);

jQuery(document).ready(function () {
	//树主体初始化
	$('#jstree_div').jstree({
		"core" : {
			"multiple" : false, // 允许多选
			'animation' : false,
			'data' : treeData,
		},
		'expand_selected_onload' : true, //选中项蓝色底显示
		'checkbox' : {
			// 禁用级联选中
			'three_state' : false,
			'cascade' : 'undetermined' //有三个选项，up, down, undetermined; 使用前需要先禁用three_state
		},
		'plugins' : ['checkbox', 'search']  //如果使用checkbox效率会降低, 'wholerow'会把线隐藏掉
	});
	//绑定到自定义的组件上
	ApmJstreeUtil.bindJstree({
		render : 'jstree_div',
		showField : 'department',
		saveField : 'rdepartment',
		picker : 'jstree_around',
		searchField : 'search_input',
		width : 250,
		height : 300
	});
})
