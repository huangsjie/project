var Treeview = function () {
    var MenuTree = $('#menu_tree');
    /**
     * 取消全部选中-刷新树
     */
    var remove_menu_tree = function(){
        MenuTree.jstree("uncheck_all"); //取消全部选中
        MenuTree.find("a").removeAttr("role_menu_id").removeAttr("status").removeClass("is_change").addClass("is_default")
    }
    /**
     * 菜单树初始化
     */
    var menu_tree = function () {
        MenuTree.jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                }
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder"
                },
                "file" : {
                    "icon" : "fa fa-file"
                }
            },
            "plugins": ["checkbox","types"]
        });
        MenuTree.on("changed.jstree", function (e, data) {
            if((typeof data.event !== 'undefined' && data.event.type == 'click') && (data.action == 'select_node' || data.action == 'deselect_node')){
                if(data.action == 'select_node' && data.selected.length >= 1){
                    $.each(data.selected, function (i, n) {
                        if(n != '' && n.indexOf('j1_') < 0){
                            var node = MenuTree.jstree("get_node", n);
                            var menuId = node.a_attr.id,aclass = $("#"+menuId).attr("class");
                            if(aclass.indexOf("is_default") >= 0){
                                $("#"+menuId).removeClass("is_default").addClass("is_change");
                            }
                        }
                    });
                } else if (data.action == 'deselect_node' && data.selected.length == 1) {
                    $.each(data.node.children, function (i, n) {
                        var node = MenuTree.jstree("get_node", n);
                        var menuId = node.a_attr.id,aclass = $("#"+menuId).attr("class");
                        console.log(aclass)
                        if(aclass.indexOf("is_change") >= 0){
                            $("#"+menuId).removeClass("is_change").addClass("is_default");
                        }
                    });
                    var menuId = data.node.a_attr.id,aclass = $("#"+menuId).attr("class");
                    if(aclass.indexOf("is_change") >= 0){
                        $("#"+menuId).removeClass("is_change").addClass("is_default");
                    }
                }
            }
        });
    }

    /**
     * 选中角色对应的菜单树 checkbox
     * @param roleMenu
     * @returns {number}
     */
    var checked_menu_tree = function (roleMenu) {
        remove_menu_tree()
        if(roleMenu != ""){
            $.each(roleMenu, function (i, n) {
                if(n.id != null){
                    var node = MenuTree.jstree("get_node", n.id);
                    $("#"+node.a_attr.id).attr("status",n.roleMenuStatus)
                    $("#"+node.a_attr.id).attr("role_menu_id",n.roleMenuId)
                    MenuTree.jstree().select_node(node);
                }
            });
        }
    }

    /**
     * 获取当前角色的 可用菜单
     */
    var get_checked_role_menu = function () {
        $(".m-widget4__item").on('click', '[type=\'radio\']', function () {
            var id = $(this).val();
            request(
                'getRoleMenuDataList',
                'get',
                {id: id},
                function (result) {
                    if (result.message) {
                        checked_menu_tree(result.data)
                    }
                })
        })
    }
    /**
     * 获取JsTree checked 值 使用get_checked方法
     * @returns {string}
     */
    var get_menu_id = function () {
        var paramArr = [];
        var nodes = MenuTree.jstree("get_checked");
        $.each(nodes, function (i, n) {
            var node = MenuTree.jstree("get_node", n);
            if(node.id.indexOf("j1_") < 0){
                var id = node.id,
                    parent = node.parent.indexOf("j1_") >=0 ? "" : node.parent,
                    a_id   = node.a_attr.id,
                    self = $("#"+a_id),
                    status = self.attr("status"),
                    aclass = self.attr("class"),
                    role_menu_id = self.attr("role_menu_id");
                if(node.text !== 'Dashboard' && aclass.indexOf("is_change") >= 0 && typeof id !== "undefined"){
                    /**
                     * 参数为 undefined 时 补齐参数，防止报错
                     * @type {{menu_id, role_id: (*|jQuery), status: *, parent_id: *, role_menu_id: *}}
                     */
                    var itemArr = {
                        'menu_id':id,
                        'role_id':$(".radio_role input[type='radio']:checked").val(),
                        'status': typeof status !== "undefined" ? status : 0,
                        'parent_id': parent !== "" ? parent : 0,
                        'role_menu_id': typeof role_menu_id !== "undefined" ? role_menu_id : 0};
                    paramArr.push(itemArr);
                }
            }
        });
        return JSON.stringify(paramArr);
    }

    /**
     * 保存 改变后的结果 带上 role id
     */
    var save_menu_role_change = function () {
        $(".role_menu_save").on('click',function(){
            var param = get_menu_id();
            if(param !== ''){
                console.log(param)
                request('saveRoleMenu','post',{param:param},function (result) {
                    console.log(result);
                })
            }else{
                alertMsgShow('.m-form #danger_msg', 'danger', '  请选择 要赋予该角色的菜单,或者未修改过该项.');
            }
        })
    }

    return {
        init: function () {
            menu_tree();
            get_checked_role_menu();
            save_menu_role_change();
        }
    };
}();

jQuery(document).ready(function() {
    Treeview.init();
});