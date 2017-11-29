var manageBatch = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var manageBatchShow = function () {
        var datatable = $('.manage_batch_ajax').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: '/system/origin/getManageBatchDataList'
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
                {field: "name", title: "名称", width: 100},
                {field: "tea_garden_id", title: "茶园名称", width: 100},
                {field: "batch_number", title: "批次号", width: 100},
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

        /*$('#m_form_tea_grade_id').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.tea_grade_id = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.tea_grade_id !== 'undefined' ? query.tea_grade_id : '');
*/

        $('.select_selectpicker').selectpicker();
    };


    /**
     * 茶园信息表单验证
     * 新增与编辑
     */
    var manageBatchForm = function () {
        $( "#manage_batch_edit_form" ).validate({
            rules: {
                name: {
                    required: true,
                    nameCheck:true
                },
                teaGradeId:{required: true,},
                batchNumber:{required: true,},
            },

            submitHandler: function (form){
                blockUiOpen('.manageBatchEdit .modal-content');
                request(
                    "saveManageBatch",
                    "post",
                    $("#manage_batch_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.manageBatchEdit .modal-content',1,".close-parent",0);
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
            $(".manageBatchEdit .modal-title").text("批次编辑")
            $(".manageBatchEdit [name='save']").val('edit')
        }else{
            $(".manageBatchEdit .modal-title").text("批次新增")
            $(".manageBatchEdit [name='save']").val('add');
        }
        $(".manageBatchEdit [name='id']").val('')
        $(".manageBatchEdit [name='name']").val('')
        $(".manageBatchEdit [name='description']").val('');
        $(".teaGardenEdit .form-control-feedback").remove()
        $(".manageBatchEdit div").removeClass("has-danger")
        $(".manageBatchEdit div").removeClass("has-success")
    }

    /**
     * 新增茶园信息
     */
    var addManageBatch = function () {
        $(".addManageBatch").on('click',function(){
            removeValue('add')
        })
    }

    /**
     * 获取角色信息,并移除上一轮错误信息
     */
    var editManageBatchItem = function () {
        $("#manage_batch_list").on("click", ".editManageBatchItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getManageBatchItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            console.log(result.data)
                            $("#manage_batch_edit_form [name='id']").val(result.data.id)
                            $("#manage_batch_edit_form [name='name']").val(result.data.batchNumber)
                            $("#manage_batch_edit_form [name='teaGrade']").val(result.data.teaGradeId)
                        }


                    })
            }
        })
    }


    /**
     * 删除
     */
    var delManageBatchItem = function () {
        $("#manage_batch_list ").on("click", ".delManageBatchItem", function () {
            blockUiOpen('#manage_batch_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delManageBatchItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#manage_batch_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#manage_batch_list');
                        }
                    })
            }
        })
    }

    return {
        init: function () {
            addManageBatch();
            editManageBatchItem();
            delManageBatchItem();
            manageBatchShow();
            manageBatchForm();
        }
    };
}();



jQuery(document).ready(function () {
    TeaGarden.init();
});