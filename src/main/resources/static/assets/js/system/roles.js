var Roles = function () {
    var rolesListShow = function () {
        var datatable = $('.roles_list_ajax').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: '/system/roles/getRolesDataList'
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
            filterable: false,
            pagination: true,
            columns: [{
                title: "#",
                width: 40,
                template: function (row) {
                    return row.rowIndex+1;
                }
            }, {
                field: "name",
                title: "名称",
                width: 100
            }, {
                field: "description",
                title: "描述",
                width: 100
            }, {
                field: "createTime",
                title: "创建时间",
                sortable: 'asc',
                width: 150
            }, {
                field: "type",
                title: "类型",
                sortable: 'asc',
                width: 60,
                template: function (row) {
                    var status = {
                        1: {'title': '1', 'class': 'm-badge--brand'},
                        2: {'title': '2', 'class': ' m-badge--metal'},
                        3: {'title': '3', 'class': ' m-badge--primary'},
                        4: {'title': '4', 'class': ' m-badge--success'},
                        5: {'title': '5', 'class': ' m-badge--info'},
                        6: {'title': '6', 'class': ' m-badge--danger'},
                        7: {'title': '7', 'class': ' m-badge--warning'}
                    };
                    return '<span class="m-badge ' + status[row.type].class + ' m-badge--wide">' + status[row.type].title + '</span>';
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
						<a href="" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill editRoleItem" title="编辑" item="'+row.id+'" data-toggle="modal" data-target=".rolesEdit">\
							<i class="la la-edit"></i>\
						</a>\
						<a class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill delRoleItem" title="删除" item="'+row.id+'" >\
							<i class="la la-trash"></i>\
						</a>\
					';
                }
            }]
        });

        var query = datatable.getDataSourceQuery();

        $('#m_form_search').on('change', function (e) {
            var query = datatable.getDataSourceQuery();
            query.generalSearch = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(query.generalSearch);

        $('#m_form_status').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.Status = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.Status !== 'undefined' ? query.Status : '');

        $('#m_form_type').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.Type = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.Type !== 'undefined' ? query.Type : '');

        $('#m_form_status, #m_form_type').selectpicker();
    };

    /**
     * RoleEdit 表单验证
     * 新增与编辑
     */
    var rolesForm = function () {
        $( "#role_edit_form" ).validate({
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
                blockUiOpen('.rolesEdit .modal-content');
                request(
                    "saveRole",
                    "post",
                    $("#role_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiOpen('.rolesEdit .modal-content',result.data);
                            blockUiClose('.rolesEdit .modal-content',1,".close-parent",2000);
                        }else{
                            // 失败不关闭窗口
                            blockUiOpen('.rolesEdit .modal-content',result.data);
                            blockUiClose('.rolesEdit .modal-content','','',2000);
                        }
                    }
                )
            }
        });
    }

    return {
        init: function () {
            rolesListShow();
            rolesForm();
        }
    };
}();

/**
 * 重置表单
 */
function removeValue(type){
    if(type == 'edit'){
        $(".rolesEdit .modal-title").text("角色编辑")
        $(".rolesEdit [name='save']").val('edit')
    }else{
        $(".rolesEdit .modal-title").text("角色新增")
        $(".rolesEdit [name='save']").val('add');
    }
    $(".rolesEdit [name='id']").val('')
    $(".rolesEdit [name='name']").val('')
    $(".rolesEdit [name='description']").val('');
    $(".rolesEdit .form-control-feedback").remove()
    $(".rolesEdit div").removeClass("has-danger")
    $(".rolesEdit div").removeClass("has-success")
}

jQuery(document).ready(function () {
    /**
     * 获取角色信息,并移除上一轮错误信息
     */
    $("#roles_list ").on("click", ".editRoleItem", function () {
        removeValue('edit')
        var id = $(this).attr("item");
        if(id != ""){
            request(
                "getRoleItem",
                'get',
                {id:id},
                function (result) {
                    if(result.message){
                        $("#role_edit_form [name='id']").val(result.data.id)
                        $("#role_edit_form [name='name']").val(result.data.name)
                        $("#role_edit_form [name='description']").val(result.data.description)
                    }

            })
        }
    })

    /**
     * 删除角色
     */
    $("#roles_list ").on("click", ".delRoleItem", function () {
        blockUiOpen('#roles_list');
        var self = $(this);
        var id = self.attr("item");
        if(id != ""){
            request(
                "delRoleItem",
                'get',
                {id:id},
                function (result) {
                    if(result.message){
                        blockUiOpen('#roles_list',result.data);
                        self.parents("tr").remove();
                        blockUiClose('#roles_list','','',2000);
                    }else{
                        blockUiOpen('#roles_list',result.data);
                        blockUiClose('#roles_list','','',2000);
                    }
                })
            }
    })

    /**
     * 取消编辑时 重置表单初始值为 add 类型
     */
    $(".close-parent").on('click',function(){
        removeValue('add')
    })
    Roles.init();
});