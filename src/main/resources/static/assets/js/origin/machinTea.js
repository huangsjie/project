var MachinTea = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var status = {
        1: {'title': '启用', 'class': ' m-badge--success'},
        0: {'title': '未知', 'class': ' m-badge--warning'},
        2: {'title': '禁用', 'class': ' m-badge--danger'}
    };
    /**
     * 获取列表数据
     */
    var getMachinTeaDataList = function () {
        var option = {
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getMachinTeaDataList'
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
        var datatable = $('.machin_tea_list').mDatatable(option);
        var query = datatable.getDataSourceQuery();
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
            datatable.destroy();
            datatable = $('.machin_tea_list').mDatatable(option);
        });
        // $('#dicTeaGra').on('change', function () {
        //     var query = datatable.getDataSourceQuery();
        //     query.dicTeaGra = $(this).val();
        //     datatable.setDataSourceQuery(query);
        //     datatable.load();
        // }).val(typeof query.dicTeaGra !== 'undefined' ? query.dicTeaGra : '');

        $('.select_selectpicker').selectpicker();
    };



    /**
     * 新增与编辑表单验证
     * 加工设置
     */
    var MachinTeaEditForm = function () {
        $( "#machin_tea_edit_form" ).validate({
            rules: {
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
                blockUiOpen('.MachinTeaEdit .modal-content');
                request(
                    "saveOrUpdateMachinTea",
                    "post",
                    $("#machin_set_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            blockUiClose('.MachinTeaEditModal .modal-content',1,".close-parent",0);
                            ToastrMsg(result.data,"success","topRight");
                            $('.datatableRoload').click()
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
    var editMachinTeaItem = function () {
        $("#machin_tea_list").on("click", ".editMachinTeaItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "editMachinTeaItem",
                    'get',
                    {id:id},
                    function (result) {
                        console.log(result)
                        if(result.message){
                            $(".MachinTeaEditModal [name='id']").val(result.data.id)
                            $(".MachinTeaEditModal [name='dicMacType']").val(result.data.dicMacType)
                            $(".MachinTeaEditModal [name='dicTeaAttr']").val(result.data.dicTeaAttr)
                            $(".MachinTeaEditModal [name='dicMacPro']").val(result.data.dicMacPro)
                            $(".MachinTeaEditModal [name='dicTeaType']").val(result.data.dicTeaType)
                            $(".MachinTeaEditModal [name='durationType']").val(result.data.durationType)
                            $(".MachinTeaEditModal [name='beginDuration']").val(result.data.beginDuration)
                            $(".MachinTeaEditModal [name='endDuration']").val(result.data.endDuration)
                            $(".MachinTeaEditModal [name='temperature']").val(result.data.temperature)
                            $(".MachinTeaEditModal [name='humidity']").val(result.data.humidity)
                            $(".MachinTeaEditModal [name='macLoss']").val(result.data.macLoss)
                            $(".MachinTeaEditModal [name='description']").val(result.data.description)
                            $(".MachinTeaEditModal [name='status']").val(result.data.status)
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
    var delMachinTeaItem = function () {
        $("#machin_tea_list").on("click", ".delMachinTeaItem", function () {
            blockUiOpen('#machin_tea_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delMachinTeaItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#machin_tea_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#machin_tea_list');
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
            $(".MachinTeaEditModal .modal-title").text("编辑记录")
            $(".MachinTeaEditModal [name='save']").val('edit')
        }else{
            $(".MachinTeaEditModal .modal-title").text("新增记录")
            $(".MachinTeaEditModal [name='save']").val('add');
        }
        $(".MachinTeaEditModal [name='id']").val("")
        $(".MachinTeaEditModal [name='dicMacType']").val("")
        $(".MachinTeaEditModal [name='dicTeaAttr']").val("")
        $(".MachinTeaEditModal [name='dicMacPro']").val("")
        $(".MachinTeaEditModal [name='dicTeaType']").val("")
        $(".MachinTeaEditModal [name='durationType']").val("")
        $(".MachinTeaEditModal [name='beginDuration']").val("")
        $(".MachinTeaEditModal [name='endDuration']").val("")
        $(".MachinTeaEditModal [name='temperature']").val("")
        $(".MachinTeaEditModal [name='humidity']").val("")
        $(".MachinTeaEditModal [name='macLoss']").val("")
        $(".MachinTeaEditModal [name='description']").val("")
        $(".MachinTeaEditModal [name='status']").val(2)
        $('.status_switch').bootstrapSwitch('state',false);
        $(".MachinTeaEditModal .form-control-feedback").remove()
        $(".MachinTeaEditModal div").removeClass("has-danger")
        $(".MachinTeaEditModal div").removeClass("has-success")
    }

    /**
     * 新增重置表单初始值
     */
    var addMachinTeaItem = function () {
        $(".addMachinTeaItem").on('click',function(){
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
            getMachinTeaDataList();
            editMachinTeaItem();
            MachinTeaEditForm();
            addMachinTeaItem();
            delMachinTeaItem();
        }
    };
}();
jQuery(document).ready(function () {
    $('.status_switch').bootstrapSwitch();
    MachinTea.init();
    $('.status_switch').on('switchChange.bootstrapSwitch', function (event,state) {
        if(state==true){
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(1)
        }else{
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(2)
        }
    });
});