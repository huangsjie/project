var Treeview = function () {
    var MenuTree = $('#menu_tree');
    /**
     * 取消全部选中-刷新树
     */
    var remove_menu_tree = function(){
        MenuTree.find("a").removeAttr("role_menu_id")
        MenuTree.find("a").removeAttr("status")
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
            console.log(data.selected);
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
        }else{
            MenuTree.jstree("uncheck_all"); //取消全部选中
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
        var idArr = [];
        var nodes = MenuTree.jstree("get_checked");
        $.each(nodes, function (i, n) {
            var id = $("#"+n).find('a').attr("menu");
            if(typeof id !== "undefined"){
                idArr.push(id);
            }
        });
        return idArr.join(',');
    }

    /**
     * 保存 改变后的结果 带上 role id
     */
    var save_menu_role_change = function () {
        $(".role_menu_save").on('click',function(){
            console.log(get_menu_id())
        })
    }

    return {
        init: function () {
            menu_tree();
            checked_menu_tree();
            get_checked_role_menu();
            save_menu_role_change();
        }
    };
}();

jQuery(document).ready(function() {
    Treeview.init();
});