var Quality = function () {
    var status = {
        0: {'title':'未检', 'class':'m-badge--warning'},
        1: {'title':'合格', 'class':'m-badge--success'},
        2: {'title':'不合格', 'class':'m-badge--danger'}
    };
    var actionsTemplate = $("#actionsTemplate").html();
    var QualityShow = function () {
        var option = {
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getQualityDataList'
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
                {field: "productName", title: "产品名称", width: 120},
                {field: "batchNumber", title: "加工批次", width: 120},
                {field: "orderNo", title: "取样号", width: 120},
                {
                    field: "qualityStatus",
                    title: "质检", width: 60,
                    template: function (row) {
                        return '<span class="m-badge ' + status[row.qualityStatus].class + ' m-badge--wide">' + status[row.qualityStatus].title + '</span>';
                    }
                },
                {field: "qualityUser", title: "质检人", width: 60},
                {
                    field: "verifyQuality",
                    title: "复检", width: 60,
                    template: function (row) {
                        return '<span class="m-badge ' + status[row.verifyQuality].class + ' m-badge--wide">' + status[row.verifyQuality].title + '</span>';
                    }
                },
                {field: "verifyUser", title: "复检人", width: 60},
                {field: "qualityTime", title: "质检时间",sortable: 'asc', width: 150},
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
        var datatable = $('.quality_list').mDatatable(option);

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

        $('#samplingId').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.samplingId = $(this).val();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.samplingId !== 'undefined' ? query.samplingId : '');
        $('.datatableRoload').on('click', function () {
            location.reload()
        });
        $('.select_selectpicker').selectpicker();
    };


    /**
     * 新增与编辑
     */
    var QualityInfoForm = function () {
        $( "#Quality_edit_form" ).validate({
            rules: {
                processBatchId: {required: true},// nameCheck:true
                QualityBase:{required: true,digits:true,maxlength:3},
                QualityNumber:{required: true,digits:true,maxlength:3},
                operatorId:{required: true, nameCheck:true},
                orderNo:{required: true,alphanumerical:true},
                QualityTime:{required: true,date:true}
            },

            submitHandler: function (form){
                blockUiOpen('.qualityEditModal .modal-content');
                request(
                    "saveOrUpdateQuality",
                    "post",
                    $("#Quality_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.qualityEditModal .modal-content',1,".close-parent",0);
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
            $(".qualityEditModal .modal-title").text("质检编辑")
            $(".qualityEditModal [name='save']").val('edit')
        }else{
            $(".qualityEditModal .modal-title").text("质检新增")
            $(".qualityEditModal [name='save']").val('add');
        }
        $(".qualityEditModal [name='id']").val('');
        $(".qualityEditModal [name='name']").val('');
        $(".qualityEditModal [name='dicTeaGrade']").val('');
        $(".qualityEditModal #productId").val('');
        $(".qualityEditModal [name='productId']").val('');
        $(".qualityEditModal #machinStatus").val('');
        $(".qualityEditModal [name='machinStatus']").val('');
        $(".qualityEditModal #machinEnd").val('');
        $(".qualityEditModal [name='machinEnd']").val('');
        $(".qualityEditModal [name='orderNo']").val('');
        $(".qualityEditModal [name='QualityTime']").val('');
        $(".qualityEditModal [name='description']").val('');
        $(".qualityEditModal [name='QualityBase']").val('');
        $(".qualityEditModal [name='QualityNumber']").val('');
        $(".qualityEditModal [name='operatorId']").val('');
        $(".qualityEditModal .form-control-feedback").remove();
        $(".qualityEditModal div").removeClass("has-danger")
        $(".qualityEditModal div").removeClass("has-success")
    }

    /**
     * 新增茶园信息
     */
    var addQuality = function () {
        $(".addQuality").on('click',function(){
            removeValue('add')
        })
    }

    /**
     * 获取角色信息,并移除上一轮错误信息
     */
    var editQualityItem = function () {
        $("#quality_list").on("click", ".editQualityItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getQualityItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            console.log(result);
                            //showMachinTeaData(result.data.processBatchId,'.qualityEditModal .modal-content')
                            $(".qualityEditModal #productId").val(result.data.productName);
                            $(".qualityEditModal [name='productId']").val(result.data.productId);
                            $(".qualityEditModal #machinStatus").val(result.data.machinStatus);
                            $(".qualityEditModal [name='machinStatus']").val(result.data.machinStatus);
                            $(".qualityEditModal #machinEnd").val(result.data.machinEnd);
                            $(".qualityEditModal [name='machinEnd']").val(result.data.machinEnd);
                            $(".qualityEditModal [name='processBatchId']").val(result.data.processBatchId);
                            $(".qualityEditModal [name='orderNo']").val(result.data.orderNo);
                            $(".qualityEditModal [name='QualityTime']").val(result.data.QualityTime);

                            $(".qualityEditModal [name='id']").val(result.data.id)
                            $(".qualityEditModal [name='name']").val(result.data.name)
                            $(".qualityEditModal [name='teaGrade']").val(result.data.teaGrade)
                            $(".qualityEditModal [name='dicTeaGrade']").val(result.data.dicTeaGrade)
                            $(".qualityEditModal [name='QualityTime']").val(result.data.QualityTime)
                            $(".qualityEditModal [name='QualityNumber']").val(result.data.QualityNumber)
                            $(".qualityEditModal [name='QualityBase']").val(result.data.QualityBase)
                            $(".qualityEditModal [name='operatorId']").val(result.data.operatorId)
                            $(".qualityEditModal [name='description']").val(result.data.description)
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
        $(".qualityEditModal .processBatchId").on("change",function () {
            var processBatchId = $(".qualityEditModal .processBatchId").val();
            blockUiOpen('.qualityEditModal .modal-content');
            showMachinTeaData(processBatchId,'.qualityEditModal .modal-content')
        })
    }


    /**
     * 删除
     */
    var delQualityItem = function () {
        $("#quality_list ").on("click", ".delQualityItem", function () {
            blockUiOpen('#quality_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delQualityItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#quality_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#quality_list');
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
                    $(".qualityEditModal #productId").val(result.data.productName);
                    $(".qualityEditModal [name='productId']").val(result.data.productId);
                    $(".qualityEditModal #machinStatus").val(result.data.machinStatus);
                    $(".qualityEditModal [name='machinStatus']").val(result.data.machinStatus);
                    $(".qualityEditModal #machinEnd").val(result.data.machinEnd);
                    $(".qualityEditModal [name='machinEnd']").val(result.data.machinEnd);
                    $(".qualityEditModal [name='orderNo']").val(result.data.orderNo);
                    $(".qualityEditModal [name='QualityTime']").val(result.data.QualityTime);
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
        $('.QualityTime').datetimepicker({
            todayHighlight: false,
            autoclose: true,
            sideBySide: false,
            pickerPosition: 'button-left',
            format: 'yyyy-mm-dd hh:mm:ss'
        });
    }

    return {
        init: function () {
            QualityShow();
            addQuality();
            getMachinTeaData();
            editQualityItem();
            delQualityItem();
            QualityInfoForm();
            datetimepickerSelect();
        }
    };
}();
jQuery(document).ready(function () {
    Quality.init();
});