var Sampling = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var samplingShow = function () {
        console.log("11111111");
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
                {field: "sampling_number", title: "取样基数", width: 60},
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

        $('#m_form_tea_grade_level').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.tea_grade = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.tea_grade !== 'undefined' ? query.tea_grade : '');

        $('#m_form_sampling_type').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.garden_type = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.garden_type !== 'undefined' ? query.garden_type : '');

        $('#cultivarType').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.cultivar_id = $(this).val();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.cultivar_id !== 'undefined' ? query.cultivar_id : '');
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
                name: {
                    required: true,
                    nameCheck:true
                },
                teaGrade:{required: true,},
                gardenType:{required: true,},
                area:{required: true,},
                acreage:{required: true,},
                ageLimit:{required: true,number:true},
            },

            submitHandler: function (form){
                blockUiOpen('.SamplingEdit .modal-content');
                request(
                    "saveSampling",
                    "post",
                    $("#sampling_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.SamplingEdit .modal-content',1,".close-parent",0);
                            ToastrMsg(result.data,"success","topRight");
                            ;
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
            $(".SamplingEdit .modal-title").text("茶园编辑")
            $(".SamplingEdit [name='save']").val('edit')
        }else{
            $(".SamplingEdit .modal-title").text("茶园新增")
            $(".SamplingEdit [name='save']").val('add');
        }
        $(".SamplingEdit [name='id']").val('')
        $(".SamplingEdit [name='name']").val('')
        $(".SamplingEdit [name='description']").val('');
        $(".SamplingEdit .form-control-feedback").remove()
        $(".SamplingEdit div").removeClass("has-danger")
        $(".SamplingEdit div").removeClass("has-success")
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
                            $("#sampling_edit_form [name='id']").val(result.data.id)
                            $("#sampling_edit_form [name='name']").val(result.data.name)
                            $("#sampling_edit_form [name='teaGrade']").val(result.data.teaGrade)
                            $("#sampling_edit_form [name='gardenType']").val(result.data.gardenType)
                            $("#sampling_edit_form [name='area']").val(result.data.area)
                            $("#sampling_edit_form [name='acreage']").val(result.data.acreage)
                            $("#sampling_edit_form [name='ageLimit']").val(result.data.ageLimit)
                            $("#sampling_edit_form [name='sortId']").val(result.data.sortId)
                            $("#sampling_edit_form [name='description']").val(result.data.description)
                        }else{
                            ToastrMsg(result.data,"error","topRight");
                        }
                    })
            }
        })
    }


    /**
     * 删除角色
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

    return {
        init: function () {
            samplingShow();
            addSampling();
            editSamplingItem()
            delSamplingItem()
            SamplingInfoForm();
        }
    };
}();
jQuery(document).ready(function () {
    console.log(123)
    Sampling.init();
});