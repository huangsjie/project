var TeaGardenInfo = function () {
    var teaGardenInfoShow = function () {
        var datatable = $('.tea_garden_info_ajax').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: '/system/origin/getTeaGardenDataList'
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
                field: "area",
                title: "区域",
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
                    return '\
						<a href="" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill editTeaGardenItem"  title="编辑" item="'+row.id+'" data-toggle="modal" data-target=".teaGardenInfoEdit">\
							<i class="la la-edit"></i>\
						</a>\
						<a class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill delTeaGardenItem" title="删除" item="'+row.id+'" >\
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
            query.status = $(this).val();
            //console.log(query.status);
            datatable.setDataSourceQuery(query);
            datatable.load();

        }).val(typeof query.Status !== 'undefined' ? query.Status : '');

        $('#m_form_status').selectpicker();
    };


    /**
     * RoleEdit 表单验证
     * 新增与编辑
     */
    var teaGardenInfoForm = function () {
        $( "#tea_garden_edit_form" ).validate({
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
                blockUiOpen('.teaGardenInfoEdit .modal-content');
                request(
                    "saveTeaGardenInfo",
                    "post",
                    $("#tea_garden_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.teaGardenInfoEdit .modal-content',1,".close-parent",0);
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

    return {
        init: function () {
            teaGardenInfoShow();
            teaGardenInfoForm();
        }
    };
}();

/**
 * 重置表单
 */
function removeValue(type){
    if(type == 'edit'){
        $(".teaGardenInfoEdit .modal-title").text("茶园编辑")
        $(".teaGardenInfoEdit [name='save']").val('edit')
    }else{
        $(".teaGardenInfoEdit .modal-title").text("茶园新增")
        $(".teaGardenInfoEdit [name='save']").val('add');
    }
    $(".teaGardenInfoEdit [name='id']").val('')
    $(".teaGardenInfoEdit [name='name']").val('')
    $(".teaGardenInfoEdit [name='description']").val('');
    $(".teaGardenInfoEdit .form-control-feedback").remove()
    $(".teaGardenInfoEdit div").removeClass("has-danger")
    $(".teaGardenInfoEdit div").removeClass("has-success")
}

jQuery(document).ready(function () {
    /**
     * 获取角色信息,并移除上一轮错误信息
     */
    $("#tea_garden_list").on("click", ".editTeaGardenItem", function () {
        removeValue('edit')
        var id = $(this).attr("item");
        if(id != ""){
            request(
                "getTeaGardenItem",
                'get',
                {id:id},
                function (result) {
                    if(result.message){
                        $("#tea_garden_edit_form [name='id']").val(result.data.id)
                        $("#tea_garden_edit_form [name='name']").val(result.data.name)
                        $("#tea_garden_edit_form [name='area']").val(result.data.area)
                        $("#tea_garden_edit_form [name='description']").val(result.data.description)
                    }


            })
        }
    })

    /**
     * 删除角色
     */
    $("#tea_garden_list ").on("click", ".delTeaGardenItem", function () {
        blockUiOpen('#tea_garden_list');
        var self = $(this);
        var id = self.attr("item");
        if(id != ""){
            request(
                "delTeaGardenItem",
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

    /**
     * 取消编辑时 重置表单初始值为 add 类型
     */
    $(".close-parent").on('click',function(){
        removeValue('add')
    })
    TeaGardenInfo.init();
});