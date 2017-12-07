var Sampling = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var samplingShow = function () {
        var option = {
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getSamplingDataList'
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
                {field: "name", title: "产品名称", width: 100},
                {field: "batch_number", title: "加工批次", width: 120},
                {field: "dicName", title: "等级", width: 60},
                {field: "order_no", title: "取样号", width: 120},
                {field: "sampling_base", title: "取样基数", width: 60},
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
        }
        var datatable = $('.sampling_list').mDatatable(option);

        var query = datatable.getDataSourceQuery();

        $('#m_form_search').on('keyup', function (e) {
            var query = datatable.getDataSourceQuery();
            query.generalSearch = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(query.generalSearch);

        $('#productId').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.productId = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.productId !== 'undefined' ? query.productId : '');

        $('#processBatchId').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.processBatchId = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.processBatchId !== 'undefined' ? query.processBatchId : '');

        $('#dicTeaGrade').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.dicTeaGrade = $(this).val();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.dicTeaGrade !== 'undefined' ? query.dicTeaGrade : '');
        $('.datatableRoload').on('click', function () {
            location.reload()
        });
        $('.select_selectpicker').selectpicker();
    };


    /**
     * 新增与编辑
     */
    var SamplingInfoForm = function () {
        $( "#sampling_edit_form" ).validate({
            rules: {
                processBatchId: {required: true},// nameCheck:true
                samplingBase:{required: true,digits:true,maxlength:3},
                samplingNumber:{required: true,digits:true,maxlength:3},
                operatorId:{required: true, nameCheck:true},
                orderNo:{required: true,alphanumerical:true},
                samplingTime:{required: true,date:true}
            },

            submitHandler: function (form){
                blockUiOpen('.samplingEditModal .modal-content');
                request(
                    "saveOrUpdateSampling",
                    "post",
                    $("#sampling_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.samplingEditModal .modal-content',1,".close-parent",0);
                            ToastrMsg(result.data,"success","topRight");
                            location.reload();
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
            $(".samplingEditModal .modal-title").text("取样编辑")
            $(".samplingEditModal [name='save']").val('edit')

        }else{
            $(".samplingEditModal .modal-title").text("取样新增")
            $(".samplingEditModal [name='save']").val('add');
        }
        $(".samplingEditModal [name='id']").val('');
        $(".samplingEditModal [name='name']").val('');
        $(".samplingEditModal [name='dicTeaGrade']").val('');
        $(".samplingEditModal #productId").val('');
        $(".samplingEditModal [name='productId']").val('');
        $(".samplingEditModal #machinStatus").val('');
        $(".samplingEditModal [name='machinStatus']").val('');
        $(".samplingEditModal #machinEnd").val('');
        $(".samplingEditModal [name='machinEnd']").val('');
        $(".samplingEditModal [name='orderNo']").val('');
        $(".samplingEditModal [name='samplingTime']").val('');
        $(".samplingEditModal [name='description']").val('');
        $(".samplingEditModal [name='samplingBase']").val('');
        $(".samplingEditModal [name='samplingNumber']").val('');
        $(".samplingEditModal [name='operatorId']").val('');
        $(".samplingEditModal .form-control-feedback").remove();
        $(".samplingEditModal div").removeClass("has-danger")
        $(".samplingEditModal div").removeClass("has-success")
    }

    /**
     * 新增茶园信息
     */
    var addSampling = function () {
        $(".addSampling").on('click',function(){
            removeValue('add')
        })
    }

    /**
     * 获取角色信息,并移除上一轮错误信息
     */
    var editSamplingItem = function () {
        $("#sampling_list").on("click", ".editSamplingItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getSamplingItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            console.log(result);
                            //showMachinTeaData(result.data.processBatchId,'.samplingEditModal .modal-content')
                            $(".samplingEditModal #productId").val(result.data.productName);
                            $(".samplingEditModal [name='productId']").val(result.data.productId);
                            $(".samplingEditModal #machinStatus").val(result.data.machinStatus);
                            $(".samplingEditModal [name='machinStatus']").val(result.data.machinStatus);
                            $(".samplingEditModal #machinEnd").val(result.data.machinEnd);
                            $(".samplingEditModal [name='machinEnd']").val(result.data.machinEnd);
                            $(".samplingEditModal [name='processBatchId']").val(result.data.processBatchId);
                            $(".samplingEditModal [name='orderNo']").val(result.data.orderNo);
                            $(".samplingEditModal [name='samplingTime']").val(result.data.samplingTime);

                            $(".samplingEditModal [name='id']").val(result.data.id)
                            $(".samplingEditModal [name='name']").val(result.data.name)
                            $(".samplingEditModal [name='teaGrade']").val(result.data.teaGrade)
                            $(".samplingEditModal [name='dicTeaGrade']").val(result.data.dicTeaGrade)
                            $(".samplingEditModal [name='samplingTime']").val(result.data.samplingTime)
                            $(".samplingEditModal [name='samplingNumber']").val(result.data.samplingNumber)
                            $(".samplingEditModal [name='samplingBase']").val(result.data.samplingBase)
                            $(".samplingEditModal [name='operatorId']").val(result.data.operatorId)
                            $(".samplingEditModal [name='description']").val(result.data.description)
                        }else{
                            ToastrMsg(result.data,"error","topRight");
                        }
                    })
            }
        })
    }

    /**
     * 触发茶叶加工明文信息
     */
    var getMachinTeaData = function(){
        $(".samplingEditModal .processBatchId").on("change",function () {
            var processBatchId = $(".samplingEditModal .processBatchId").val();
            blockUiOpen('.samplingEditModal .modal-content');
            showMachinTeaData(processBatchId,'.samplingEditModal .modal-content')
        })
    }


    /**
     * 删除
     */
    var delSamplingItem = function () {
        $("#sampling_list ").on("click", ".delSamplingItem", function () {
            blockUiOpen('#sampling_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delSamplingItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#sampling_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#sampling_list');
                        }
                    })
            }
        })
    }
    /**
     * 显示茶叶加工明文信息
     */
    var showMachinTeaData = function (processBatchId,closeBlockAttr) {
        request(
            "getMachinTeaData",
            'get',
            {processBatchId:processBatchId},
            function (result) {
                if(result.message){
                    $(".samplingEditModal #productId").val(result.data.productName);
                    $(".samplingEditModal [name='productId']").val(result.data.productId);
                    $(".samplingEditModal #machinStatus").val(result.data.machinStatus);
                    $(".samplingEditModal [name='machinStatus']").val(result.data.machinStatus);
                    $(".samplingEditModal #machinEnd").val(result.data.machinEnd);
                    $(".samplingEditModal [name='machinEnd']").val(result.data.machinEnd);
                    $(".samplingEditModal [name='orderNo']").val(result.data.orderNo);
                    $(".samplingEditModal [name='samplingTime']").val(result.data.samplingTime);
                    blockUiClose(closeBlockAttr,0,".close-parent",0);
                }else{
                    removeValue('add');
                    ToastrMsg(result.data,"danger","topRight",closeBlockAttr);
                }
            })
    }

    /**
     * bootstrap datetimepicker 插件
     * 输入时间请先了解单个参数
     */
    var datetimepickerSelect = function () {
        $('.samplingTime').datetimepicker({
            todayHighlight: false,
            autoclose: true,
            sideBySide: false,
            pickerPosition: 'button-left',
            format: 'yyyy-mm-dd hh:mm:ss'
        });
    }

    return {
        init: function () {
            samplingShow();
            addSampling();
            getMachinTeaData();
            editSamplingItem();
            delSamplingItem();
            SamplingInfoForm();
            datetimepickerSelect();
        }
    };
}();
jQuery(document).ready(function () {
    Sampling.init();
});