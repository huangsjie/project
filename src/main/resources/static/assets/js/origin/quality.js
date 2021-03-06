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
        $( "#quality_edit_form" ).validate({
            rules: {
                samplingId: {required: true},// nameCheck:true
                attestation:{required: true},
                // QualityNumber:{required: true,digits:true,maxlength:3},alphanumerical:true
                qualityUser:{required: true, nameCheck:true},
                verifyUser:{required: true, nameCheck:true},
                dicTeaGrade:{required: true},
                qualityTime:{required: true,date:true},
                verifyTime:{required: true,date:true},
                netContent:{required: true},
                teaCrumble:{required: true},
                waterContent:{required: true},
            },

            submitHandler: function (form){
                blockUiOpen('.qualityEditModal .modal-content');
                request(
                    "saveOrUpdateQuality",
                    "post",
                    $("#quality_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            blockUiClose('.qualityEditModal .modal-content',1,".close-parent",0);
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
     * 重置表单
     */
    var removeValue = function(type){
        if(type == 'edit'){
            $(".qualityEditModal .modal-title").text("质检编辑");
            $(".qualityEditModal [name='save']").val('edit');
            //$(".qualityEditModal #samplingId").attr("disabled",true)
            $(".qualityEditModal .qualityCheck input").attr("disabled",true);
            $(".qualityEditModal .verifyCheck").removeClass("m--hide");
            $(".qualityEditModal [name='verifyQuality']").attr("disabled",false);
            $(".qualityEditModal [name='verifyUser']").attr("disabled",false);
            $(".qualityEditModal [name='verifyTime']").attr("disabled",false);
            $(".reset-btn").addClass("m--hide");
        }else{
            $(".qualityEditModal .modal-title").text("质检新增");
            $(".qualityEditModal [name='save']").val('add');
            $(".qualityEditModal #samplingId").attr("disabled",false);
            $(".qualityEditModal .qualityCheck input").attr("disabled",false);
            $(".qualityEditModal .verifyCheck").addClass("m--hide");
            $(".qualityEditModal [name='verifyQuality']").attr("disabled",true);
            $(".qualityEditModal [name='verifyUser']").attr("disabled",true);
            $(".qualityEditModal [name='verifyTime']").attr("disabled",true);
            $(".reset-btn").removeClass("m--hide");
        }
        $(".qualityEditModal [name='id']").val('');
        $(".qualityEditModal #productName").val('');
        $(".qualityEditModal #machinStatus").val('');
        $(".qualityEditModal #machinEnd").val('');
        $(".qualityEditModal #samplingBase").val('');
        $(".qualityEditModal #samplingNumber").val('');
        $(".qualityEditModal #samplingTime").val('');
        $(".qualityEditModal #operatorId").val('');
        $(".qualityEditModal [name='qualityAroma']").val('');
        $(".qualityEditModal [name='qualityTaste']").val('');
        $(".qualityEditModal [name='qualityColour']").val('');
        $(".qualityEditModal [name='description']").val('');
        $(".qualityEditModal [name='qualityCable']").val('');
        $(".qualityEditModal [name='qualityColorLustre']").val('');
        $(".qualityEditModal [name='qualityCleanliness']").val('');
        $(".qualityEditModal [name='dicQualityType']").val('');
        $(".qualityEditModal [name='samplingId']").val('');
        $(".qualityEditModal [name='dicTeaGrade']").val('');
        $(".qualityEditModal [name='netContent']").val('');
        $(".qualityEditModal [name='teaCrumble']").val('');
        $(".qualityEditModal [name='waterContent']").val('');
        $(".qualityEditModal [name='qualityStatus']").attr("checked",false);//单选-质检
        $(".qualityEditModal [name='qualityUser']").val('');
        $(".qualityEditModal [name='qualityTime']").val('');
        $(".qualityEditModal [name='verifyQuality']").attr("checked",false);//单选-质检
        $(".qualityEditModal [name='verifyUser']").val('');
        $(".qualityEditModal [name='verifyTime']").val('');
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
     * 获取信息,并移除上一轮错误信息
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
                            console.log(result.data)
                            $(".qualityEditModal [name='id']").val(result.data.qid);
                            $(".qualityEditModal #productName").val(result.data.productName);
                            $(".qualityEditModal #machinStatus").val(result.data.machinStatus);
                            $(".qualityEditModal #machinEnd").val(result.data.machinEnd);
                            $(".qualityEditModal #samplingBase").val(result.data.samplingBase);
                            $(".qualityEditModal #samplingNumber").val(result.data.samplingNumber);
                            $(".qualityEditModal #samplingTime").val(result.data.samplingTime);
                            $(".qualityEditModal #operatorId").val(result.data.operatorId);
                            $(".qualityEditModal [name='dicTeaGrade']").val(result.data.dic_tea_grade);
                            $(".qualityEditModal [name='qualityAroma']").val(result.data.quality_aroma);
                            $(".qualityEditModal [name='qualityTaste']").val(result.data.quality_taste);
                            $(".qualityEditModal [name='qualityColour']").val(result.data.quality_colour);
                            $(".qualityEditModal [name='description']").val(result.data.description);
                            $(".qualityEditModal [name='qualityCable']").val(result.data.quality_cable);
                            $(".qualityEditModal [name='qualityColorLustre']").val(result.data.quality_color_lustre);
                            $(".qualityEditModal [name='qualityCleanliness']").val(result.data.quality_cleanliness);
                            $(".qualityEditModal [name='dicQualityType']").val(result.data.dic_quality_type);
                            $(".qualityEditModal [name='samplingId']").val(result.data.sampling_id);
                            $(".qualityEditModal [name='netContent']").val(result.data.net_content);
                            $(".qualityEditModal [name='teaCrumble']").val(result.data.tea_crumble);
                            $(".qualityEditModal [name='waterContent']").val(result.data.water_content);
                            $(".qualityEditModal [name='qualityStatus'][value='"+result.data.quality_status+"']").click();//单选-质检
                            $(".qualityEditModal [name='verifyQuality'][value='"+result.data.verify_quality+"']").click();//单选-质检
                            $(".qualityEditModal [name='qualityUser']").val(result.data.quality_user);
                            $(".qualityEditModal [name='qualityTime']").val(result.data.quality_time);
                            $(".qualityEditModal [name='verifyUser']").val(result.data.verify_user);
                            $(".qualityEditModal [name='verifyTime']").val(result.data.verify_time);
                        }else{
                            ToastrMsg(result.data,"error","topRight");
                        }
                    })
            }
        })
    }

    /**
     * 触发取样单号,获取取样数据
     */
    var getSamplingData = function(){
        $(".qualityEditModal .samplingId").on("change",function () {
            var samplingId = $(".qualityEditModal .samplingId").val();
            blockUiOpen('.qualityEditModal .modal-content');
            showSamplingData(samplingId,'.qualityEditModal .modal-content')
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
    var showSamplingData = function (samplingId,closeBlockAttr) {
        request(
            "getSamplingData",
            'get',
            {samplingId:samplingId},
            function (result) {
                if(result.message){
                    $(".qualityEditModal #productName").val(result.data.productName);
                    $(".qualityEditModal #machinStatus").val(result.data.machinStatus);
                    $(".qualityEditModal #machinEnd").val(result.data.machinEnd);
                    $(".qualityEditModal #samplingBase").val(result.data.samplingBase);
                    $(".qualityEditModal #samplingNumber").val(result.data.samplingNumber);
                    $(".qualityEditModal #samplingTime").val(result.data.samplingTime);
                    $(".qualityEditModal #operatorId").val(result.data.operatorId);
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
        $('.datetimeInput').datetimepicker({
            //endDate:new Date(),
            startDate:new Date(),
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
            getSamplingData();
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