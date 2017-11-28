var TeaGardenManage = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var teaGardenManageShow = function () {
        var datatable = $('.tea_garden_manage_ajax').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getTeaGardenLogList'
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
                field: "teaGardenId",
                title: "茶园",
                width: 100
            }, {
                field: "farmTypeId",
                title: "农事类型",
                width: 100
            }, {
                field: "farmDesc",
                title: "农事描述",
                width: 100
            }, {
                field: "operatorId",
                title: "实施人",
                width: 100
            }, {
                field: "createTime",
                title: "创建时间",
                sortable: 'asc',
                width: 150
            }, {
                field: "status",
                title: "状态",
                sortable: 'asc',
                width: 60,
                template: function (row) {
                    var status = {

                        //0: {'title': '未知', 'class': ' m-badge--info'},
                        1: {'title': '启用', 'class': ' m-badge--success'},
                        2: {'title': '禁用', 'class': ' m-badge--danger'}
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
                    return actionsTemplate.replace(/#rowId#/g, row.id);
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
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.status !== 'undefined' ? query.status : '');
       /* $('#m_form_status').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.status = $(this).val();
            datatable.setDataSourceQuery(query);
            datatable.load();

        }).val(typeof query.status !== 'undefined' ? query.status : '');*/

        $('.select_selectpicker').selectpicker();
    };


    /**
     * RoleEdit 表单验证
     * 新增与编辑
     */
    var teaGardenManageForm = function () {
        $( "#tea_garden_manage_edit_form" ).validate({
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
                blockUiOpen('.teaGardenLogEdit .modal-content');
                request(
                    "saveTeaGardenLog",
                    "post",
                    $("#tea_garden_manage_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.teaGardenLogEdit .modal-content',1,".close-parent",0);
                            ToastrMsg(result.data,"success","topRight");
                            //blockUiOpen('.rolesEdit .modal-content',result.data);
                            //blockUiClose('.rolesEdit .modal-content',1,".close-parent",2000);
                        }else{
                            // 失败不关闭窗口
                            //blockUiOpen('.rolesEdit .modal-content',result.data);
                            //blockUiClose('.rolesEdit .modal-content','','',2000);
                            ToastrMsg(result.data,"error","topRight");
                        }

                    }
                )
            }
        });
    }
    /**
     * 获取角色信息,并移除上一轮错误信息
     */
    var editTeaGardenLogItem = function () {
        $("#tea_garden_manage_list").on("click", ".editTeaGardenLogItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getTeaGardenLogItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            $("#tea_garden_manage_edit_form [name='id']").val(result.data.id)
                            $("#tea_garden_manage_edit_form [name='name']").val(result.data.name)
                            $("#tea_garden_manage_edit_form [name='area']").val(result.data.area)
                            $("#tea_garden_manage_edit_form [name='description']").val(result.data.description)
                        }
                    })
            }
        })
    }
    /**
     * 删除角色
     */
    var delTeaGardenItem = function () {
        $("#tea_garden_manage_list ").on("click", ".delTeaGardenItem", function () {
            blockUiOpen('#tea_garden_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delTeaGardenLogItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(!result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#tea_garden_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#tea_garden_list');
                        }
                    })
            }
        })
    }

    /**
     * 重置表单
     */
    var removeValue = function(type){
        if(type == 'edit'){
            $(".teaGardenLogEdit .modal-title").text("管理记录编辑")
            $(".teaGardenLogEdit [name='save']").val('edit')
        }else{
            $(".teaGardenLogEdit .modal-title").text("茶园新增")
            $(".teaGardenLogEdit [name='save']").val('add');
        }
        $(".teaGardenLogEdit [name='id']").val('')
        $(".teaGardenLogEdit [name='name']").val('')
        $(".teaGardenLogEdit [name='description']").val('');
        $(".teaGardenLogEdit .form-control-feedback").remove()
        $(".teaGardenLogEdit div").removeClass("has-danger")
        $(".teaGardenLogEdit div").removeClass("has-success")
    }

    /**
     * 取消编辑时 重置表单初始值为 add 类型
     */
    var addTeaGardenLog = function () {
        $(".addTeaGardenLog").on('click',function(){
            removeValue('add')
        })
    }

    return {
        init: function () {
            editTeaGardenLogItem()
            teaGardenManageShow();
            teaGardenManageForm();
        }
    };
}();



jQuery(document).ready(function () {
    TeaGardenManage.init();

    $('#m_datetimepicker_3').datetimepicker({
        todayHighlight: false,
        autoclose: true,
        startView: 4,
        minView: 4,
        autoclose: true,
        sideBySide: false,
        pickerPosition: 'bottom-left',
        format: 'yyyy'
    });
});