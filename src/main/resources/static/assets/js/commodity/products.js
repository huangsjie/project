var products = function () {
    var actionsTemplate = $("#actionsTemplate").html();
    var productsListShow = function () {
        var datatable = $('.products_list').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'getProductsDataList'
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
            }, {
                field: "name",
                title: "名称",
                width: 100
            },{
                field: "status",
                title: "状态",
                width: 60,
                template: function (row) {
                    var status = {
                        0: {'title': '未激活', 'class': ' m-badge--warning'},
                        1: {'title': '激活', 'class': ' m-badge--success'},
                        2: {'title': '禁用', 'class': ' m-badge--danger'},
                    };
                    return '<span class="m-badge ' + status[row.status].class + ' m-badge--wide">' + status[row.status].title + '</span>';
                }
            }, {
                field: "descriptin",
                title: "描述",
                width: 100
            }, {
                field: "createTime",
                title: "创建时间",
                sortable: 'asc',
                width: 150
            },{
                field: "Actions",
                width: 100,
                title: "操作",
                sortable: false,
                overflow: 'visible',
                template: function (row) {
                    var dropup = (row.getIndex() - row.getIndex()) <= 4 ? 'dropup' : '';
                    return actionsTemplate.replace(/#rowId#/g, row.id)
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

        $('#m_form_status').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.status = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.status !== 'undefined' ? query.status : '');

        $('#m_form_status, #m_form_type').selectpicker();
    };

    /**
     * productEdit 表单验证
     * 新增与编辑
     */
    var productsForm = function () {
        $( "#product_edit_form" ).validate({
            rules: {
                name: {
                    required: true,
                    nameCheck:true
                },
                description: {
                    required: true,
                    nameCheck:true,
                    minlength: 3,
                    maxlength: 100
                }
            },
            submitHandler: function (form){
                blockUiOpen('.productsEdit .modal-content');
                request(
                    "saveOrUpdateProducts",
                    "post",
                    $("#product_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            removeValue('add');
                            blockUiClose('.productsEdit .modal-content',1,".close-parent",0);
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
     * 获取信息,并移除上一轮错误信息
     */
    var getProductsItem = function () {
        $("#products_list ").on("click", ".editProductsItem", function () {
            removeValue('edit')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getProductsItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            $("#product_edit_form [name='id']").val(result.data.id)
                            $("#product_edit_form [name='name']").val(result.data.name)
                            $("#product_edit_form [name='status']").val(result.data.status)
                            $("#product_edit_form [name='descriptin']").val(result.data.descriptin)
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
     * 删除产品
     */
    var delProductsItem = function () {
        $("#products_list ").on("click", ".delProductsItem", function () {
            blockUiOpen('#products_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delProductsItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            self.parents("tr").remove();
                            ToastrMsg(result.data,"success","topRight",'#products_list');
                        }else{
                            ToastrMsg(result.data,"error","topRight",'#products_list');
                        }
                    })
            }
        })
    }
    /**
     * 重置表单
     */
    var removeValue = function (type){
        if(type == 'edit'){
            $(".productsEditModal .modal-title").text("角色编辑")
            $(".productsEditModal [name='save']").val('edit')
        }else{
            $(".productsEditModal .modal-title").text("角色新增")
            $(".productsEditModal [name='save']").val('add');
        }
        $(".productsEditModal [name='id']").val('')
        $(".productsEditModal [name='name']").val('')
        $(".productsEditModal [name='descriptin']").val('');
        $('.status_switch').bootstrapSwitch('state',false);
        $(".productsEditModal .form-control-feedback").remove()
        $(".productsEditModal div").removeClass("has-danger")
        $(".productsEditModal div").removeClass("has-success")
    }
    /**
     * 取消编辑时 重置表单初始值为 add 类型
     */
    var addProducts = function () {
        $(".addProducts").on('click',function(){
            removeValue('add')
        })
    }
    return {
        init: function () {
            productsListShow();
            productsForm();
            getProductsItem();
            delProductsItem();
            addProducts();
        }
    };
}();



jQuery(document).ready(function () {
    products.init();
    $('.status_switch').bootstrapSwitch();
    $('.status_switch').on('switchChange.bootstrapSwitch', function (event,state) {
        if(state==true){
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(1)
        }else{
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(2)
        }
    });
});