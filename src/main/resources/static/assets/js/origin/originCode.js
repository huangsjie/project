var originCode = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var status = {
        0: {'title': '未生成', 'class': ' m-badge--warning'},
        1: {'title': '已生成', 'class': ' m-badge--success'}
    };
    /**
     * 获取列表数据
     */
    var getOriginCodeDataList = function () {
        console.log(1)
        var option = {
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getOriginCodeDataList'
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
            columns: [{title: "#", width: 40, template: function (row) {
                        return row.rowIndex + 1;
                        }
                    },{
                        field: "origin_batch_id",
                        title: "溯源批次",
                        width: 120
                    }
                    /*,{
                        field: "origin_set_name",
                        title: "溯源组",
                        width: 60
                    }*/
                    , {
                        field: "create_status",
                        title: "编码生成", width: 60,
                        template: function (row) {
                            return '<span class="m-badge ' + status[row.create_status].class + ' m-badge--wide">' + status[row.create_status].title + '</span>';
                        }
                    }, {
                        field: "create_time",
                        title: "创建时间",
                        width: 150,
                        sortable: 'desc'
                    },{
                        field: "Actions",
                        width: 150,
                        title: "操作",
                        sortable: false,
                        overflow: 'visible',
                        template: function (row) {
                            return actionsTemplate.replace(/#rowId#/g, row.id);
                        }
                    }]
        }
        var datatable = $('.origin_code_list').mDatatable(option);
        var query = datatable.getDataSourceQuery();
        $('#originBatchId').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.originBatchId = $(this).val();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.originBatchId !== 'undefined' ? query.originBatchId : '');

        $('#m_form_search').on('keyup', function (e) {
            var query = datatable.getDataSourceQuery();
            query.generalSearch = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(query.generalSearch);
        $('.datatableRoload').on('click', function () {
            location.reload()
        });
        $('.select_selectpicker').selectpicker();
    };
    /**
     * 新增与编辑表单验证
     * 加工设置
     */
    var originCodeEditForm = function () {
        $( "#origin_batch_form" ).validate({
            rules: {
                batchNum: {required: true,alphanumerical:true},
                description: {nameCheck:true,maxlength:200}
            },
            submitHandler: function (form){
                blockUiOpen('.originCodeEditModal .modal-content');
                request(
                    "saveOrUpdateoriginCode",
                    "post",
                    $("#origin_batch_form").serialize(),
                    function(result){
                        if(result.message){
                            blockUiClose('#origin_batch_form .modal-content',1,".close-parent",0);
                            ToastrMsg(result.data,"success","topRight");
                            location.reload()
                        }else{
                            ToastrMsg(result.data,"error","topRight");
                        }
                    }
                )
            }
        });
    }

    /**
     * 获取所编辑的数据
     */
    var editOriginCodeItem = function () {
        $("#origin_batch_list").on("click", ".editOriginCodeItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "editOriginCodeItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            $("#origin_batch_form [name='id']").val(result.data.id)
                            $("#origin_batch_form [name='batchNum']").val(result.data.batchNum)
                            $("#origin_batch_form [name='description']").val(result.data.description)
                        }else{
                            ToastrMsg(result.data,"error","topRight");
                        }
                    })
            }
        })
    }
    /**
     * 删除单条数据
     */
    var delOriginCodeItem = function () {
        $("#origin_batch_list").on("click", ".delOriginCodeItem", function () {
            blockUiOpen('#origin_code_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delOriginCodeItem",
                    'post',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#origin_batch_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#origin_batch_list');
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
            $(".originCodeEditModal .modal-title").text("编辑")
            $(".originCodeEditModal [name='save']").val('edit')
            $(".originCodeEditModal [name='batchNum']").attr("disabled",true)
        }else{
            $(".originCodeEditModal .modal-title").text("新增")
            $(".originCodeEditModal [name='save']").val('add');
            $(".originCodeEditModal [name='batchNum']").attr("disabled",false);
        }
        $(".originCodeEditModal [name='id']").val("")
        $(".originCodeEditModal [name='batchNum']").val("")
        $(".originCodeEditModal [name='description']").val("")
        $(".originCodeEditModal .form-control-feedback").remove()
        $(".originCodeEditModal div").removeClass("has-danger")
        $(".originCodeEditModal div").removeClass("has-success")
    }

    /**
     * 新增重置表单初始值
     */
    var addOriginCodeItem = function () {
        $(".addOriginCodeItem").on('click',function(){
            removeValue('add')
        })
    }

    return {
        init: function () {
            getOriginCodeDataList();
            editOriginCodeItem();
            originCodeEditForm();
            addOriginCodeItem();
            delOriginCodeItem();
        }
    };
}();
jQuery(document).ready(function () {
    console.log("log")
    originCode.init();
});