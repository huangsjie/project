var User = function () {
    var userListShow = function () {
        var datatable = $('.user_list_ajax').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: '/system/user/getUserDataList'
                    }
                },
                pageSize: 10,
                saveState: {
                    cookie: true,
                    webstorage: true
                }
            },
            layout: {
                theme: 'default', // datatable theme
                class: '',        // custom wrapper class
                scroll: false,    // 启用滚动条
                footer: false     // 页脚启用,隐藏
            },
            sortable: true,
            filterable: true,
            pagination: true,
            columns: [{
                title: "#",
                width: 40,
                template: function (row) {
                    return row.rowIndex+1;
                }
            }, {
                field: "account",
                title: "账号",
                width: 100
            }, {
                field: "chineseName",
                title: "中文名",
                width: 100
            }, {
                field: "mobile",
                title: "电话",
                width: 150
            }, {
                field: "email",
                title: "邮箱",
                width: 150
            }, {
                field: "userType",
                title: "用户类型",
                width: 150,
                template: function (row) {
                    var status = {
                        1: {'title': '管理员','class': 'm-badge--info'},
                        2: {'title': '用户','class': ' m-badge--metal'},
                        3: {'title': '会员','class': ' m-badge--primary'},
                        4: {'title': '商户','class': ' m-badge--info'},
                        5: {'title': '激活','class': ' m-badge--success'},
                        6: {'title': '禁用','class': ' m-badge--danger'},
                        7: {'title': '未激活','class': ' m-badge--warning'},
                    };
                    return '<span class="m-badge ' + status[row.userType].class + ' m-badge--wide">' + status[row.userType].title + '</span>';
                }
            }, {
                field: "status",
                title: "状态",
                width: 60,
                template: function (row) {
                    var status = {
                        6: {'title': '1', 'class': 'm-badge--brand'},
                        6: {'title': '2', 'class': ' m-badge--metal'},
                        6: {'title': '3', 'class': ' m-badge--primary'},
                        6: {'title': '5', 'class': ' m-badge--info'},
                        1: {'title': '激活', 'class': ' m-badge--success'},
                        2: {'title': '禁用', 'class': ' m-badge--danger'},
                        0: {'title': '未激活', 'class': ' m-badge--warning'}
                    };
                    return '<span class="m-badge ' + status[row.status].class + ' m-badge--wide">' + status[row.status].title + '</span>';
                }
            },{
                field: "Actions",
                width: 100,
                title: "操作",
                sortable: false,
                overflow: 'visible',
                template: function (row) {
                    var dropup = (row.getIndex() - row.getIndex()) <= 4 ? 'dropup' : '';
                    return '\
						<a href="" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill editUserItem" title="编辑" item="'+row.id+'" data-toggle="modal" data-target=".userEdit">\
							<i class="la la-edit"></i>\
						</a>\
						<a class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill delUserItem" title="删除" item="'+row.id+'" >\
							<i class="la la-trash"></i>\
						</a>\
					';
                }
            }]
        });

        var query = datatable.getDataSourceQuery();
        $('#m_form_search').on('keyup', function (e) {
            var query = datatable.getDataSourceQuery();
            query.generalSearch = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(query.generalSearch);

        $('#m_form_status').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.status = $(this).val().toLowerCase();
            console.log(query)
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.status !== 'undefined' ? query.status : '');

        $('#m_form_type').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.userType = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.userType !== 'undefined' ? query.userType : '');

        $('#m_form_status, #m_form_type').selectpicker();
    };

    /**
     * UserEdit 表单验证
     * 新增与编辑
     */
    var userForm = function () {
        $( "#user_edit_form" ).validate({
            rules: {
                name: {
                    required: true,
                    nameCheck:true
                },
                description: {
                    required: true,
                    nameCheck:true,
                    minlength: 3,
                    maxlength: 100
                }
            },
            submitHandler: function (form){
                blockUiOpen('.userEdit .modal-content');
                request(
                    "saveUser",
                    "post",
                    $("#user_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.userEdit .modal-content',1,".close-parent",0);
                            ToastrMsg(result.data,"success","topRight");
                        }else{
                            ToastrMsg(result.data,"error","topRight");
                        }
                    }
                )
            }
        });
    }

    /**
     * 获取用户信息,并移除上一轮错误信息
     */
    var editUserItem = function () {
        $("#user_list ").on("click", ".editUserItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getUserItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            $("#user_edit_form [name='id']").val(result.data.id)
                            $("#user_edit_form [name='name']").val(result.data.name)
                            $("#user_edit_form [name='description']").val(result.data.description)
                        }
                    })
            }
        })
    }

    /**
     * 删除用户
     */
    var delUserItem = function () {
        $("#user_list ").on("click", ".delUserItem", function () {
            blockUiOpen('#user_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delUserItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(!result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#user_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#user_list');
                        }
                    })
            }
        })
    }
    /**
     * 重置表单
     */
    var removeValue = function () {
        if(type == 'edit'){
            $(".userEdit .modal-title").text("角色编辑")
            $(".userEdit [name='save']").val('edit')
        }else{
            $(".userEdit .modal-title").text("角色新增")
            $(".userEdit [name='save']").val('add');
        }
        $(".userEdit [name='id']").val('')
        $(".userEdit [name='name']").val('')
        $(".userEdit [name='description']").val('');
        $(".userEdit .form-control-feedback").remove()
        $(".userEdit div").removeClass("has-danger")
        $(".userEdit div").removeClass("has-success")
    }

    /**
     * 取消编辑时 重置表单初始值为 add 类型
     */
    var closeParent = function () {
        $(".close-parent").on('click',function(){
            removeValue('add')
        })
    }

    return {
        init: function () {
            userForm();
            delUserItem();
            userListShow();
            editUserItem();
        }
    };
}();
jQuery(document).ready(function () {
    User.init();
    $('.status_switch').bootstrapSwitch();
    /**
     * 开关
     */
    $('.status_switch').on('switchChange.bootstrapSwitch', function (event,state) {
        if(state==true){
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(1)
        }else{
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(2)
        }
    });
});