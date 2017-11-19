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
        getPageRoleList();
        // 加载完成后 800 毫秒点击第一个菜单
        setTimeout(function() {
            $("#menu_tree .first-item a").click()
        }, 800);

    }
    /**
     * 监听 JsTree 点击事件 获取权限数据
     * 此方法必须在 JsTree 加载完成后执行，否则点击事件监听不到
     */
    var getPageRoleList = function(){
        $("#menu_tree").on("click","a",function () {
            var menuId = $(this).parent("li").attr("id");
            var roleId = $(".radio_role input[type='radio']:checked").val();
            if(menuId != "" && roleId != ""){
                request(
                    'getPageRoleDataList',
                    'get',
                    {'menuId':menuId,'roleId':roleId,'status': 1},
                    function (result) {
                    if(result.message){
                        showPageRoleList(result.data)
                        //ToastrMsg(result.data,"success","topRight");
                    }else{
                        ToastrMsg(result.data,"warning","topRight");
                    }
                })
            }

            console.log()
        })
    }
    /**
     * 显示属性列表
     * @param dictionaryList
     */
    var showPageRoleList = function(pageRoleList){
        var _html = '';
        if(pageRoleList.length > 0){
            $.each(pageRoleList, function (i, n) {
                _html += "<tr><th scope=\"row\">"+n.sortId+"</th>";
                _html += "<td>"+n.name+"</td>";
                _html += "<td>"+n.value+"</td>";
                _html += '<td><span class="m-badge ' + status[n.status].class + ' m-badge--wide">' + status[n.status].title + '</span></td>';
                _html += '<td><a href="" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill editDictionaryItem" title="编辑" item="'+n.id+'" data-toggle="modal" data-target=".dictionaryEdit">\
                            <i class="la la-edit"></i></a>\
                            <a class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill delDictionaryItem" title="删除" item="'+n.id+'" >\
                            <i class="la la-trash"></i></a></td>';
                _html += "</tr>";
            });
        }
        if(_html == ""){
            _html = "<tr><th colspan='5' scope=\"row\" style='text-align:center'> 未找到相关属性信息！</th>";
        }
        $(".page_role_list").html(_html);
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