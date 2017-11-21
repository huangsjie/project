var MenuPage = function () {
    var MenuTree = $('#menu_tree');
    // 菜单树初始化
    var createTree = function (roleMenu) {
        MenuTree.jstree({
            "core" : {
                "multiple": false,
                "themes" : {
                    "responsive": false
                },
                "check_callback" : true,
                'data' : roleMenu
            },
            "plugins" : ["types","stats"]
        });

        // 展开节点
        MenuTree.on("loaded.jstree", function (event, data) {
            // 展开所有节点
            MenuTree.jstree('open_all');
            // 展开指定节点
            //data.instance.open_node(1);     // 单个节点 （1 是顶层的id）
            //data.instance.open_node([1, 10]); // 多个节点 (展开多个几点只有在一次性装载后所有节点后才可行）
        });
    }
    //表单验证初始化
    var menuForm = function () {
        $( "#menu_edit_form" ).validate({
            rules: {
                name: {
                    required: true,
                    nameCheck:true
                },
                url: {
                    required: true,
                    urlCheck: true
                },
                sortId: {
                    required: true,
                    digits: true
                },
                parentId: {
                    required: true
                },
                iconClass: {
                    required: true,
                    iconCheck: true
                },
                type: {
                    required: true
                },
                description: {
                    required: true,
                    minlength: 5,
                    maxlength: 100
                }
            },
            invalidHandler: function(event, validator) {
                //alertMsgShow('.m-form #danger_msg', 'danger', ' 编辑菜单请选中左侧 菜单Tree 要编辑的菜单. 新增请直接填写.');
                ToastrMsg(' 编辑菜单请选中左侧 菜单Tree 要编辑的菜单. 新增请直接填写.',"warning","topRight");
            },

            submitHandler: function (form){
                request(
                    "saveMenu",
                    "post",
                    $("#menu_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            //alertMsgShow('.m-form #success_msg', 'success', result.data);
                            ToastrMsg(result.data,"success","topRight");
                        }else{
                            //alertMsgShow('.m-form #warning_msg', 'warning', result.data);
                            ToastrMsg(result.data,"error","topRight");
                        }
                    }
                )
            }
        });
    }
    var getMenuData = function () {
        //获取选中菜单的数据
        $("#menu_tree").on("click","a",function(){
            request(
                "getMenuData",
                "get",
                {"id":$(this).attr("menu")},
                function(result){
                    if(result.message){
                        $("[name='name']").val(result.data.name)
                        $("[name='url']").val(result.data.url)
                        $("[name='sortId']").val(result.data.sortId)
                        $("[name='iconClass']").val(result.data.iconClass)
                        $("[name='type']").find("option[value="+result.data.type+"]").attr("selected",true);
                        $("[name='parentId']").find("option[value="+result.data.parentId+"]").attr("selected",true);
                        $("[name='description']").val(result.data.description)
                        $("[name='save']").val('edit')
                        $("[name='id']").val(result.data.id)
                        $(".menu_save").text("更新")
                        $(".reset-btn").removeClass("m--hide");
                    }else{
                        var alert = $('.m-form #danger_msg');
                        alert.find("#danger_content").text("编辑菜单请选中左侧 菜单Tree 要编辑的菜单.")
                        alert.removeClass('m--hide').show();
                        mApp.scrollTo(alert, -200);
                    }
                }
            )
        })
    }
    /**
     * 获取菜单树
     */
    var getMenuList = function () {
        request(
            "getMenuList",
            "get",
            "",
            function(result){
                if(result.message){
                    createTree(result.data)
                }else{
                    console.log(result.data)
                }
            }
        )
    }

    //重置 编辑区域
    var resetForm = function () {
        $(".reset-btn").on("click",function(){
            $(".menu_save").text("确定")
            $("[name='save']").val('add')
            $("[name='id']").val("")
            $(this).addClass("m--hide")
        })
    }
    return {
        init: function() {
            getMenuList();
            resetForm();
            menuForm();
            getMenuData();
        }
    };
}();

jQuery(document).ready(function() {
    MenuPage.init();
});