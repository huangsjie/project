var originInfo = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var originInfoInfoShow = function () {
        var option = {
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getOriginInfoDataList'
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
                {field: "title", title: "标题", width: 150},
                {field: "batchNum", title: "溯源批次", width: 100},
                {field: "dicOriginName", title: "溯源类型", width: 60},
                {field: "status", title: "状态", width: 60},
                {field: "sortId", title: "排序", width: 60},
                {field: "description", title: "摘要", width: 200},
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
        var datatable = $('.origin_info_list').mDatatable(option);

        var query = datatable.getDataSourceQuery();

        $('#m_form_search').on('keyup', function (e) {
            var query = datatable.getDataSourceQuery();
            query.generalSearch = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(query.generalSearch);

        $('#originBatchId').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.originBatchId = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.originBatchId !== 'undefined' ? query.originBatchId : '');
        $('.datatableRoload').on('click', function () {
            location.reload()
        });
        $('.select_selectpicker').selectpicker();
    };


    /**
     * 茶园信息表单验证
     * 新增与编辑
     */
    var originInfoInfoForm = function () {
        $( "#origin_info_edit_form" ).validate({
            rules: {
                name: { required: true, nameCheck:true },
                teaGrade:{required: true,},
                gardenType:{required: true,},
                area:{required: true,},
                acreage:{required: true,},
                ageLimit:{required: true,number:true},
            },

            submitHandler: function (form){
                blockUiOpen('.originInfoEdit .modal-content');
                request(
                    "saveOrUpdateOriginInfo",
                    "post",
                    $("#tea_garden_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            blockUiClose('.originInfoEdit .modal-content',1,".close-parent",0);
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
            $(".originInfoEditModal .modal-title").text("编辑溯源信息")
            $(".originInfoEditModal [name='save']").val('edit')
            $(".originInfoEditModal .reset-btn").addClass("m--hide");
        }else{
            $(".originInfoEditModal .modal-title").text("新增溯源信息")
            $(".originInfoEditModal [name='save']").val('add');
            $(".originInfoEditModal .reset-btn").removeClass("m--hide");
        }
        $(".originInfoEditModal [name='id']").val('')
        $(".originInfoEditModal [name='name']").val('')
        $(".originInfoEditModal [name='description']").val('');
        $(".originInfoEditModal .form-control-feedback").remove()
        $(".originInfoEditModal div").removeClass("has-danger")
        $(".originInfoEditModal div").removeClass("has-success")
    }

    /**
     * 新增
     */
    var addOriginInfo = function () {
        $(".addOriginInfoItem").on('click',function(){
            removeValue('add')
        })
    }

    /**
     * 获取角色信息,并移除上一轮错误信息
     */
    var editOriginInfoItem = function () {
        $("#origin_info_list").on("click", ".editOriginInfoItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getOriginInfoItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            $("#tea_garden_edit_form [name='id']").val(result.data.id)
                            $("#tea_garden_edit_form [name='name']").val(result.data.name)
                            $("#tea_garden_edit_form [name='teaGrade']").val(result.data.teaGrade)
                            $("#tea_garden_edit_form [name='gardenType']").val(result.data.gardenType)
                            $("#tea_garden_edit_form [name='area']").val(result.data.area)
                            $("#tea_garden_edit_form [name='acreage']").val(result.data.acreage)
                            $("#tea_garden_edit_form [name='ageLimit']").val(result.data.ageLimit)
                            $("#tea_garden_edit_form [name='sortId']").val(result.data.sortId)
                            $("#tea_garden_edit_form [name='description']").val(result.data.description)
                        }else{
                            ToastrMsg(result.data,"error","topRight");
                        }
                    })
            }
        })
    }


    /**
     * 删除
     */
    var delOriginInfoItem = function () {
        $("#origin_info_list ").on("click", ".delOriginInfoItem", function () {
            blockUiOpen('#origin_info_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delOriginInfoItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#origin_info_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#origin_info_list');
                        }
                    })
            }
        })
    }

    return {
        init: function () {
            addOriginInfo();
            editOriginInfoItem()
            delOriginInfoItem()
            originInfoInfoShow();
            originInfoInfoForm();
        }
    };
}();
jQuery(document).ready(function () {
    originInfo.init();
});