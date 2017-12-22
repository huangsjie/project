var Harvest = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var status = {
        1: {'title': '上午', 'class': ' m-badge--warning'},
        2: {'title': '下午', 'class': ' m-badge--success'}
    };
    /**
     * 获取列表数据
     */
    var getHarvestDataList = function () {
        var option = {
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getHarvestDataList'
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
                field: "nameArea",
                title: "采摘茶园",
                width: 100
            },{
                field: "macTypeName",
                title: "采摘时间",
                width: 100,
                template: function (row) {
                    return '<span class="m-badge ' + status[row.pickTime].class + ' m-badge--wide">' + status[row.pickTime].title + '</span>';
                }
            },{
                field: "operatorId",
                title: "采摘人",
                width: 100
            }, {
                field: "dicName",
                title: "采摘标准",
                width: 100
            },{
                field: "dicCultiName",
                title: "品种",
                width: 100
            },{
                field: "recQuantity",
                title: "数量",
                width: 100,
                template: function (row) {
                    return row.recQuantity+" 斤";
                }
            },{
                field: "createName",
                title: "记录人",
                width: 100
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
        }
        var datatable = $('.harvest_list').mDatatable(option);
        var query = datatable.getDataSourceQuery();
        $('#productId').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.productId = $(this).val();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.productId !== 'undefined' ? query.productId : '');
        $('#m_form_search').on('keyup', function (e) {
            var query = datatable.getDataSourceQuery();
            query.generalSearch = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(query.generalSearch);
        $('#dicMacType').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.dicMacType = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.dicMacType !== 'undefined' ? query.dicMacType : '');
        $('#dicTeaAttr').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.dicTeaAttr = $(this).val();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.dicTeaAttr !== 'undefined' ? query.dicTeaAttr : '');
        $('#dicMacPro').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.dicMacPro = $(this).val();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.dicMacPro !== 'undefined' ? query.dicMacPro : '');

        $('.datatableRoload').on('click', function () {
            location.reload()
        });
        $('.select_selectpicker').selectpicker();
    };


    /**
     * 新增与编辑表单验证
     * 加工设置
     */
    var HarvestEditForm = function () {
        $( "#harvest_edit_form" ).validate({
            rules: {
                teaGardenId: {required: true},
                pickNumber: {required: true},
                dicStandard: {required: true},
                recQuantity: { required: true},
                pickTime: {required: true},
                operatorId: {required:true,nameCheck:true},
                pickArea: {required: true}
            },
            submitHandler: function (form){
                blockUiOpen('.HarvestEditModal .modal-content');
                console.log($("#harvest_edit_form").serialize())
                request(
                    "saveOrUpdateHarvest",
                    "post",
                    $("#harvest_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            blockUiClose('.HarvestEditModal .modal-content',1,".close-parent",0);
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
    var editHarvestItem = function () {
        $("#harvest_list").on("click", ".editHarvestItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "editHarvestItem",
                    'get',
                    {id:id},
                    function (result) {
                        console.log(result)
                        if(result.message){
                            $(".HarvestEditModal [name='id']").val(result.data.id)
                            $(".HarvestEditModal [name='teaGardenId']").val(result.data.tea_garden_id).attr("disabled",true)
                            $(".HarvestEditModal [name='pickNumber']").html("<option> "+result.data.batch_number+"</option>").attr("disabled",true)
                            $(".HarvestEditModal [name='dicStandard']").val(result.data.dic_standard)
                            $(".HarvestEditModal [name='recQuantity']").val(result.data.rec_quantity)
                            $(".HarvestEditModal #createUser").val(result.data.chinese_name)
                            $(".HarvestEditModal [name='pickTime'][value='"+result.data.pick_time+"']").click()
                            $(".HarvestEditModal [name='operatorId']").val(result.data.operator_id)
                            $(".HarvestEditModal [name='description']").val(result.data.description)
                            $(".HarvestEditModal [name='pickBatchNo']").val(result.data.pick_batch_no).attr("disabled",true)
                            var str=result.data.pick_area;
                            var arr=str.split(',');
                            $('#pickArea').selectpicker('val', arr);
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
    var delHarvestItem = function () {
        $("#harvest_list").on("click", ".delHarvestItem", function () {
            blockUiOpen('#harvest_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delHarvestItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#harvest_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#harvest_list');
                        }
                    })
            }
        })
    }
    /**
     * 获取管理批次
     */
    var getTeaGardenBatch = function(){
        $(".HarvestEditModal .teaGardenId").on("change",function () {
            var teaGardenId = $(".HarvestEditModal .teaGardenId").val(),html = "";
            blockUiOpen('.HarvestEditModal .modal-content');
            request(
                "/system/teaLog/getTeaGardenBatch",
                'get',
                {teaGardenId:teaGardenId},
                function (result) {
                    if(result.message){
                        if (result.data.length > 0){
                            $.each(result.data, function (i, n) {
                                html += "<option value="+n.id+" > "+n.batch_number+" </option>";
                            });
                        }
                        $(".HarvestEditModal #pickNumber").html(html);
                        blockUiClose('.HarvestEditModal .modal-content',0,".close-parent",0);
                    }else{
                        $("#pickNumber").html('');
                        ToastrMsg(result.data,"error","topRight",'.HarvestEditModal .modal-content');
                    }
                })
        })
    }

    /**
     *
     */
    var pickNumberChange = function () {
        function getPickBatchNo(){
            var pickNumber = $("#pickNumber option:selected").text().split("-");
            blockUiOpen('.HarvestEditModal .modal-content');
            request(
                "/system/manageBatch/getMsuData",
                'get',
                {pickNumber:pickNumber},
                function (result) {
                    if(result.message){
                        $("#pickBatchNo").val(pickNumber[0]+pickNumber[1]+"-"+result.data)
                        blockUiClose('.HarvestEditModal .modal-content',0,".close-parent",0);
                    }else{
                        ToastrMsg(result.data,"error","topRight",'.HarvestEditModal .modal-content');
                    }
                })
        }
        $("#pickNumber").on("change",function () {
            getPickBatchNo()
        })
        $(".HarvestEditModal .la-hand-o-up").on("click",function () {
            getPickBatchNo()
        })
    }
    /**
     * 重置表单
     */
    var removeValue = function(type){
        if(type == 'edit'){
            $(".HarvestEditModal .modal-title").text("编辑采摘")
            $(".HarvestEditModal [name='save']").val('edit')
            $(".reset-btn").addClass("m--hide");
        }else{
            $(".HarvestEditModal .modal-title").text("新增采摘")
            $(".HarvestEditModal [name='save']").val('add');
            $(".reset-btn").removeClass("m--hide");
        }
        $(".HarvestEditModal [name='id']").val("")
        $(".HarvestEditModal [name='teaGardenId']").val("").attr("disabled",false)
        $(".HarvestEditModal [name='pickBatchNo']").val("").attr("disabled",false)
        $(".HarvestEditModal [name='pickNumber']").html("<option> 全部</option>").attr("disabled",false)
        $(".HarvestEditModal [name='dicStandard']").val("")
        $(".HarvestEditModal [name='recQuantity']").val("")
        $(".HarvestEditModal [name='pickTime'][value='1']").click()
        $(".HarvestEditModal [name='operatorId']").val("")
        $(".HarvestEditModal [name='description']").val("")
        $(".HarvestEditModal .form-control-feedback").remove()

        // $("#pickArea").empty();
        // $('#pickArea').append(options);
      //  $('#pickArea').selectpicker('render');
        $('#pickArea').selectpicker('refresh');

        $(".HarvestEditModal div").removeClass("has-danger")
        $(".HarvestEditModal div").removeClass("has-success")
    }

    /**
     * 新增重置表单初始值
     */
    var addHarvestItem = function () {
        $(".addHarvestItem").on('click',function(){
            removeValue('add')
        })
    }

    /**
     * bootstrap datetimepicker 插件
     * 输入时间请先了解单个参数
     */
    var datetimepickerSelect = function () {
        $('.datetimepicker_select').datetimepicker({
            todayHighlight: false,
            autoclose: true,
            startView: 4,
            minView: 4,
            sideBySide: false,
            pickerPosition: 'bottom-left',
            format: 'yyyy'
        });

        $('.begin_time').datetimepicker({
            todayHighlight: false,
            autoclose: true,
            sideBySide: false,
            pickerPosition: 'top-left',
            format: 'yyyy-mm-dd hh:mm:ss'
        });
    }

    return {
        init: function () {
            getHarvestDataList();
            editHarvestItem();
            HarvestEditForm();
            addHarvestItem();
            delHarvestItem();
            getTeaGardenBatch();
            pickNumberChange();
        }
    };
}();
jQuery(document).ready(function () {
    Harvest.init();
    $('.m_selectpicker').selectpicker();
});