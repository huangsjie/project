var PageRole = function () {
    var MenuTree = $('#menu_tree');
    var status = {
        9: {'title': 'Pending', 'class': 'm-badge--brand'},
        9: {'title': 'Delivered', 'class': ' m-badge--metal'},
        9: {'title': 'Canceled', 'class': ' m-badge--primary'},
        1: {'title': '启用', 'class': ' m-badge--success'},
        0: {'title': '未知', 'class': ' m-badge--info'},
        2: {'title': '禁用', 'class': ' m-badge--danger'},
        3: {'title': '暂无', 'class': ' m-badge--warning'}
    };
    /**
     * 获取当前角色的可用菜单
     * MenuTree.data('jstree', false).empty(); 清空树
     * MenuTree.jstree("destroy"); 销毁树
     */
    var getRoleMenu = function () {
        $(".m-widget4__item").on('click', '[type=\'radio\']', function () {
            MenuTree.jstree("destroy");
            var id = $(this).val();
            if(id != ''){
                request(
                    'getRoleMenuDataList',
                    'get',
                    {id: id},
                    function (result) {
                        if (result.message) {
                            createMenuTree(result.data)
                        }else{
                            ToastrMsg(result.data,"warning","topRight");
                        }
                    }
                )
            }
        })
    }

    /**
     * 选中角色对应的菜单树 checkbox
     * 菜单为启用状态时 选中 如果当前节点为父节点，默认不管
     * @param roleMenu
     * @returns {number}
     */
    var createMenuTree = function (roleMenu) {
        MenuTree.jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                },
                "check_callback" : true,
                'data' : roleMenu
            },

            "plugins" : ["types","stats" ]
        });

    }
    /**
     * 保存 改变后的结果 带上 role id
     */
    var savePageRoleChange = function () {
        $(".role_menu_save").on('click',function(){
            var param = get_menu_id();
            if(typeof param !== 'undefined' && param != '[]'){
                request('saveRoleMenu','post',{param:param},function (result) {
                    if(result.message){
                        ToastrMsg(result.data,"success","topRight");
                    }else{
                        ToastrMsg(result.data,"warning","topRight");
                    }
                })
            }else{
                ToastrMsg('  请选择 要赋予该角色的菜单,或者未修改过该项.',"error","topRight");
            }
        })
    }

    return {
        init: function () {
            getRoleMenu();
        }
    };
}();

jQuery(document).ready(function() {
    PageRole.init();
    /**
     * 选中第一个 radio
     */
    $(".first-radio").click()
});