var processBatch = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var processBatchShow = function () {
        var option = {
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getProcessBatchDataList'
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
            columns: [
                {title: "#", width: 40, template: function (row) {
                    return row.rowIndex+1;
                }},
                {field: "batch_number", title: "加工批次", width: 150},
                {field: "manageBatchNumber", title: "鲜叶批次号", width: 150},
                {field: "create_time", title: "创建时间", sortable: 'asc', width: 150},
                {
                    field: "Actions",
                    width: 100,
                    title: "操作",
                    sortable: false,
                    overflow: 'visible',
                    template: function (row) {
                        return actionsTemplate.replace(/#rowId#/g, row.id);
                    }
                }]
        }
        var datatable = $('.process_batch_ajax').mDatatable(option);

        var query = datatable.getDataSourceQuery();

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
     * 信息表单验证
     * 新增与编辑
     */
    var processBatchForm = function () {
        $( "#process_batch_edit_form" ).validate({
            rules: {
                manageBatchId:{required: true,},
                batchNumber:{required: true},
            },
            submitHandler: function (form){
                blockUiOpen('.processBatchEdit .modal-content');
                request(
                    "saveProcessBatch",
                    "post",
                    $("#process_batch_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.processBatchEdit .modal-content',1,".close-parent",0);
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
     * 重置表单
     */
    var removeValue = function(type){
        if(type == 'edit'){
            $(".processBatchEdit .modal-title").text("批次编辑")
            $(".processBatchEdit [name='save']").val('edit')
            $(".reset-btn").addClass("m--hide");
        }else{
            $(".processBatchEdit .modal-title").text("批次新增")
            $(".processBatchEdit [name='save']").val('add');
            $(".reset-btn").removeClass("m--hide");
        }
        $(".processBatchEdit [name='id']").val('')
        $(".processBatchEdit [name='manageBatchId']").val('').attr("disabled",false);
        $(".processBatchEdit [name='productId']").val('').attr("disabled",false);
        $(".processBatchEdit [name='batchNumber']").val('').attr("disabled",false);
        $(".processBatchEdit .form-control-feedback").remove()
        $('.status_switch').bootstrapSwitch('state',false);
        $(".processBatchEdit div").removeClass("has-danger")
        $(".processBatchEdit div").removeClass("has-success")
    }

    /**
     * 新增茶园信息
     */
    var addProcessBatch = function () {
        $(".addProcessBatch").on('click',function(){
            removeValue('add')
        })
    }

    /**
     * 获取角色信息,并移除上一轮错误信息
     */
    var editProcessBatchItem = function () {
        $("#process_batch_list").on("click", ".editProcessBatchItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getProcessBatchItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            $(".processBatchEdit [name='id']").val(result.data.id)
                            $(".processBatchEdit [name='batchNumber']").val(result.data.batchNumber).attr("disabled",true);
                            $(".processBatchEdit [name='manageBatchId']").val(result.data.manageBatchId).attr("disabled",true);
                            $(".processBatchEdit [name='status']").val(result.data.status)
                            $(".processBatchEdit [name='productId']").val(result.data.productId).attr("disabled",true);
                            if(result.data.status == 1){
                                $('.status_switch').bootstrapSwitch('state',true);
                            }else{
                                $('.status_switch').bootstrapSwitch('state',false);
                            }
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#process_batch_list');
                        }
                    })
            }
        })
    }


    /**
     * 删除
     */
    var delProcessBatchItem = function () {
        $("#process_batch_list ").on("click", ".delProcessBatchItem", function () {
            blockUiOpen('#process_batch_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delProcessBatchItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#process_batch_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#process_batch_list');
                        }
                    })
            }
        })
    }

    /**
     * 获取加工批次数据
     */
    var getMsuData = function () {
        $(".processBatchEdit .la-hand-o-up").on("click",function () {
            var manageBatchId = $("#manageBatchId option:selected").val(),
                managerbatch  = $("#manageBatchId option:selected").text().split("-"),
                save    = $(".processBatchEdit [name='save']").val();
            if (manageBatchId != "" && save == "add"){
                request(
                    "getMsuData",
                    'get',
                    {},
                    function (result) {
                        if(result.message){
                            $("#batchNumber").val(managerbatch[0]+"-"+managerbatch[1]+"-"+result.data)
                        }else{
                            ToastrMsg('获取失败,请稍后再试.',"error","topRight",'#modalBloukUi');
                        }
                    })
            }else{
                if (save == "edit"){
                    return false;
                }else {
                    ToastrMsg("请选择管理批次.", "warning", "topRight", '#manage_batch_list');
                }
            }
        })
    }

    return {
        init: function () {
            addProcessBatch();
            editProcessBatchItem();
            delProcessBatchItem();
            processBatchShow();
            processBatchForm();
            getMsuData();
        }
    };
}();



jQuery(document).ready(function () {
    processBatch.init();
    $('.status_switch').bootstrapSwitch();
    $('.status_switch').on('switchChange.bootstrapSwitch', function (event,state) {
        if(state==true){
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(1)
        }else{
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(2)
        }
    });
});