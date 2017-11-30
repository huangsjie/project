var processBatch = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var processBatchShow = function () {
        var datatable = $('.process_batch_ajax').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: '/system/processBatch/getProcessBatchDataList'
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
                    console.log(row)
                    return row.rowIndex+1;
                }},
                {field: "batch_number", title: "加工批次号", width: 100},
                {field: "manageBatch", title: "管理批次号", width: 100},
                {field: "create_time", title: "创建时间", sortable: 'asc', width: 150},
                {
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

        /*$('#m_form_tea_garden').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.tea_garden_id = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.tea_garden_id !== 'undefined' ? query.tea_garden_id : '');*/


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
                batchNumber:{required: true,},
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
        }else{
            $(".processBatchEdit .modal-title").text("批次新增")
            $(".processBatchEdit [name='save']").val('add');
        }
        $(".processBatchEdit [name='id']").val('')
        $(".processBatchEdit [name='name']").val('')
        $(".processBatchEdit [name='description']").val('');
        $(".processBatchEdit .form-control-feedback").remove()
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
                            console.log(result.data)
                            $("#process_batch_edit_form [name='id']").val(result.data.id)
                            $("#process_batch_edit_form [name='batchNumber']").val(result.data.batchNumber)
                            $("#process_batch_edit_form [name='manageBatchId']").val(result.data.manageBatchId)
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

    return {
        init: function () {
            addProcessBatch();
            editProcessBatchItem();
            delProcessBatchItem();
            processBatchShow();
            processBatchForm();
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