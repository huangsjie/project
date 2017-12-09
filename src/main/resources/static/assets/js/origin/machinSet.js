var MachinSet = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var status = {
        1: {'title': '启用', 'class': ' m-badge--success'},
        0: {'title': '未知', 'class': ' m-badge--warning'},
        2: {'title': '禁用', 'class': ' m-badge--danger'}
    };
    /**
     * 获取列表数据
     */
    var getMachinSetDataList = function () {
        var option = {
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getMachinSetDataList'
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
            },{
                field: "productName",
                title: "产品名称",
                width: 100
            },{
                field: "macTypeName",
                title: "类型",
                width: 60
            },{
                field: "teaAttrName",
                title: "茶系",
                width: 60
            }, {
                field: "macProName",
                title: "工序",
                width: 60
            },{
                field: "mac_loss",
                title: "损耗",
                width: 60,
                template: function (row) {
                    return row.mac_loss+" %∑";
                }
            },{
                field: "temperature",
                title: "温度",
                width: 60,
                template: function (row) {
                    return row.temperature+" &#8451;";
                }
            },{
                field: "humidity",
                title: "湿度",
                width: 60,
                template: function (row) {
                    return row.humidity+" %RH";
                }
            },{
                field: "status",
                title: "状态",
                width: 60,
                template: function (row) {
                    return '<span class="m-badge ' + status[row.status].class + ' m-badge--wide">' + status[row.status].title + '</span>';
                }
            },{
                field: "create_time",
                title: "创建时间",
                width: 150,
                sortable: 'desc'
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
        var datatable = $('.machin_set_list').mDatatable(option);
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
    var machinSetEditForm = function () {
        $( "#machin_set_edit_form" ).validate({
            rules: {
                productId: {required: true},
                dicMacType: {required: true},
                dicTeaAttr: {required: true},
                dicMacPro: { required: true},
                durationType: {required: true},
                beginDuration: {digits:true,maxlength:2},
                endDuration: {required: true,digits:true,maxlength:2},
                temperature: {digits:true,maxlength:3},
                humidity: {digits:true,maxlength:2},
                macLoss: {digits:true,maxlength:2},
                description: {nameCheck:true}
            },
            submitHandler: function (form){
                blockUiOpen('.machinSetEdit .modal-content');
                request(
                    "saveOrUpdateMachinSet",
                    "post",
                    $("#machin_set_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            blockUiClose('.machinSetEditModal .modal-content',1,".close-parent",0);
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
    var editMachinSetItem = function () {
        $("#machin_set_list").on("click", ".editMachinSetItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "editMachinSetItem",
                    'get',
                    {id:id},
                    function (result) {
                        console.log(result)
                        if(result.message){
                            $(".machinSetEditModal [name='id']").val(result.data.id)
                            $(".machinSetEditModal [name='dicMacType']").val(result.data.dicMacType)
                            $(".machinSetEditModal [name='dicTeaAttr']").val(result.data.dicTeaAttr)
                            $(".machinSetEditModal [name='dicMacPro']").val(result.data.dicMacPro)
                            $(".machinSetEditModal [name='productId']").val(result.data.productId)
                            $(".machinSetEditModal [name='dicTeaType']").val(result.data.dicTeaType)
                            $(".machinSetEditModal [name='durationType'][value='"+result.data.durationType+"']").click()
                            $(".machinSetEditModal [name='beginDuration']").val(result.data.beginDuration)
                            $(".machinSetEditModal [name='endDuration']").val(result.data.endDuration)
                            $(".machinSetEditModal [name='temperature']").val(result.data.temperature)
                            $(".machinSetEditModal [name='humidity']").val(result.data.humidity)
                            $(".machinSetEditModal [name='macLoss']").val(result.data.macLoss)
                            $(".machinSetEditModal [name='description']").val(result.data.description)
                            $(".machinSetEditModal [name='status']").val(result.data.status)
                            if(result.data.status == 1){
                                $('.status_switch').bootstrapSwitch('state',true);
                            }else{
                                $('.status_switch').bootstrapSwitch('state',false);
                            }
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
    var delMachinSetItem = function () {
        $("#machin_set_list").on("click", ".delMachinSetItem", function () {
            blockUiOpen('#machin_set_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delMachinSetItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#machin_set_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#machin_set_list');
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
            $(".machinSetEditModal .modal-title").text("编辑工序")
            $(".machinSetEditModal [name='save']").val('edit')
            $(".reset-btn").addClass("m--hide");
        }else{
            $(".machinSetEditModal .modal-title").text("新增工序")
            $(".machinSetEditModal [name='save']").val('add');
            $(".reset-btn").removeClass("m--hide");
        }
        $(".machinSetEditModal [name='id']").val("")
        $(".machinSetEditModal [name='dicMacType']").val("")
        $(".machinSetEditModal [name='dicTeaAttr']").val("")
        $(".machinSetEditModal [name='dicMacPro']").val("")
        $(".machinSetEditModal [name='productId']").val("")
        $(".machinSetEditModal [name='beginDuration']").val("")
        $(".machinSetEditModal [name='endDuration']").val("")
        $(".machinSetEditModal [name='temperature']").val("")
        $(".machinSetEditModal [name='humidity']").val("")
        $(".machinSetEditModal [name='macLoss']").val("")
        $(".machinSetEditModal [name='description']").val("")
        $(".machinSetEditModal [name='status']").val(2)
        $('.status_switch').bootstrapSwitch('state',false);
        $(".machinSetEditModal .form-control-feedback").remove()
        $(".machinSetEditModal div").removeClass("has-danger")
        $(".machinSetEditModal div").removeClass("has-success")
    }

    /**
     * 新增重置表单初始值
     */
    var addMachinSetItem = function () {
        $(".addMachinSetItem").on('click',function(){
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
            getMachinSetDataList();
            editMachinSetItem();
            machinSetEditForm();
            addMachinSetItem();
            delMachinSetItem();
        }
    };
}();
jQuery(document).ready(function () {
    $('.status_switch').bootstrapSwitch();
    MachinSet.init();
    $('.status_switch').on('switchChange.bootstrapSwitch', function (event,state) {
        if(state==true){
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(1)
        }else{
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(2)
        }
    });
});