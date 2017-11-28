var TeaGarden = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var teaGardenInfoShow = function () {
        var datatable = $('.tea_garden_info_ajax').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: '/system/origin/getTeaGardenDataList'
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
                {field: "teaGradeName", title: "等级", width: 100},
                {field: "gardenTypeName", title: "类型", width: 100},
                {field: "area", title: "区域", width: 100},
                {field: "acreage", title: "面积", width: 100},
                {field: "age_limit", title: "树龄", width: 100},
                {field: "cultivarName", title: "品种", width: 100},
                {field: "teaIsName", title: "茶系", width: 100},
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

        $('#m_form_tea_grade_level').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.tea_grade = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.tea_grade !== 'undefined' ? query.tea_grade : '');

        $('#m_form_tea_garden_type').on('change', function () {
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

        $('.select_selectpicker').selectpicker();
    };


    /**
     * 茶园信息表单验证
     * 新增与编辑
     */
    var teaGardenInfoForm = function () {
        $( "#tea_garden_edit_form" ).validate({
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
                blockUiOpen('.teaGardenEdit .modal-content');
                request(
                    "saveTeaGarden",
                    "post",
                    $("#tea_garden_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.teaGardenEdit .modal-content',1,".close-parent",0);
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
            $(".teaGardenEdit .modal-title").text("茶园编辑")
            $(".teaGardenEdit [name='save']").val('edit')
        }else{
            $(".teaGardenEdit .modal-title").text("茶园新增")
            $(".teaGardenEdit [name='save']").val('add');
        }
        $(".teaGardenEdit [name='id']").val('')
        $(".teaGardenEdit [name='name']").val('')
        $(".teaGardenEdit [name='description']").val('');
        $(".teaGardenEdit .form-control-feedback").remove()
        $(".teaGardenEdit div").removeClass("has-danger")
        $(".teaGardenEdit div").removeClass("has-success")
    }

    /**
     * 新增茶园信息
     */
    var addTeaGarden = function () {
        $(".addTeaGarden").on('click',function(){
            removeValue('add')
        })
    }

    /**
     * 获取角色信息,并移除上一轮错误信息
     */
    var editTeaGardenItem = function () {
        $("#tea_garden_list").on("click", ".editTeaGardenItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getTeaGardenItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            console.log(result.data)
                            $("#tea_garden_edit_form [name='id']").val(result.data.id)
                            $("#tea_garden_edit_form [name='name']").val(result.data.name)
                            $("#tea_garden_edit_form [name='teaGrade']").val(result.data.teaGrade)
                            $("#tea_garden_edit_form [name='gardenType']").val(result.data.gardenType)
                            $("#tea_garden_edit_form [name='area']").val(result.data.area)
                            $("#tea_garden_edit_form [name='acreage']").val(result.data.acreage)
                            $("#tea_garden_edit_form [name='ageLimit']").val(result.data.ageLimit)
                            $("#tea_garden_edit_form [name='sortId']").val(result.data.sortId)
                            $("#tea_garden_edit_form [name='description']").val(result.data.description)
                        }


                    })
            }
        })
    }


    /**
     * 删除角色
     */
    var delTeaGardenItem = function () {
        $("#tea_garden_list ").on("click", ".delTeaGardenItem", function () {
            blockUiOpen('#tea_garden_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delTeaGardenItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#tea_garden_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#tea_garden_list');
                        }
                    })
            }
        })
    }

    return {
        init: function () {
            addTeaGarden();
            editTeaGardenItem()
            delTeaGardenItem()
            teaGardenInfoShow();
            teaGardenInfoForm();
        }
    };
}();



jQuery(document).ready(function () {
    TeaGarden.init();
});