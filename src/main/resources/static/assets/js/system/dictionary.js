var Dictionary = function () {
    var status = {
        9: {'title': 'Pending', 'class': 'm-badge--brand'},
        9: {'title': 'Delivered', 'class': ' m-badge--metal'},
        9: {'title': 'Canceled', 'class': ' m-badge--primary'},
        1: {'title': '启用', 'class': ' m-badge--success'},
        9: {'title': 'Info', 'class': ' m-badge--info'},
        2: {'title': '禁用', 'class': ' m-badge--danger'},
        9: {'title': 'Warning', 'class': ' m-badge--warning'}
    };
    //字典父级验证
    var dictionaryForm = function () {
        $(".dictionary_form_save").on('click',function(){
            checkFormValidate('#dictionary_form')
        })
    }
    //字典子级属性验证
    var dictionaryChildForm = function(){
        $(".dictionary_child_form_save").on('click',function(){
            checkFormValidate('#dictionary_child_form')
        })
    }
    // 表单验证
    var checkFormValidate = function(formAttrIbuteID){
        $( formAttrIbuteID ).validate({
            rules: {
                name: {
                    required: true,
                    nameCheck:true
                },
                sortId: {
                    required: true,
                    digits: true
                },
                value: {
                    required: true
                },
                description: {
                    required: true,
                    minlength: 5,
                    maxlength: 100
                }
            },
            // invalidHandler: function(event, validator) {
            //
            //     alertMsgShow(formAttrIbuteID +' #warning_msg', 'warning', ' 字典信息检测未通过 , 请根据提示完成操作.');
            // },
            submitHandler: function (form){
                console.log($(formAttrIbuteID).serialize())
                request(
                    "saveDictionaryOrUpdate",
                    "post",
                    $(formAttrIbuteID).serialize(),
                    function(result){
                        if(result.message){
                            blockUiClose('.dictionaryEdit .modal-content',1,".close-parent",0);
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
     * 获取当前选中字典的属性列表
     */
    var getDictionaryValueListInfo = function () {
        $(".m-widget4__item").on('click', '[type=\'radio\']', function () {
            var id = $(this).val();
            request(
                'getDictionaryValueList',
                'get',
                {parentId: id},
                function (result) {
                    if (result.message) {
                        showDictionaryList(id,result.data)
                    }else{
                        alertMsgShow('.m-form #warning_msg', 'warning', result.data);
                    }
                })
        })
    }
    /**
     * 编辑 字典子级 属性信息
     * 点击属性管理列表 编辑按钮 get id
     */
    var getDictionaryChildItem = function(){
        $(".dictionary_list ").on("click", ".editDictionaryItem", function () {
            removeValue('.dictionaryEdit','edit','属性编辑')
            var id = $(this).attr("item");
            if(id != ""){
                request(
                    "getDictionaryItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            $("#dictionary_child_form [name='name']").val(result.data.name)
                            $("#dictionary_child_form [name='value']").val(result.data.value)
                            $("#dictionary_child_form [name='id']").val(result.data.id)
                            $("#dictionary_child_form [name='sortId']").val(result.data.sortId)
                            $('#dictionary_child_form [name="status"]').val(result.data.status)
                            $("#dictionary_child_form [name='description']").val(result.data.description)
                            if(result.data.status == 1){
                                $('#dictionary_child_form .status_switch').bootstrapSwitch('state',true);
                            }else{
                                $('#dictionary_child_form .status_switch').bootstrapSwitch('state',false);
                            }
                        }else{
                            alertMsgShow('.m-form #warning_msg', 'warning', result.data);
                        }
                    })
            }
        })
    }
    /**
     * 显示属性列表
     * @param dictionaryList
     */
    var showDictionaryList = function(parent,dictionaryList){
        var _html = '';
        if(dictionaryList != ''){
            $.each(dictionaryList, function (i, n) {
                if(n.id === parent){
                    $("#dictionary_form [name='name']").val(n.name)
                    $("#dictionary_form [name='value']").val(n.value)
                    $("#dictionary_form [name='id']").val(n.id)
                    $("#dictionary_form [name='sortId']").val(n.sortId)
                    $('#dictionary_form [name="status"]').val(n.status)
                    $("#dictionary_form [name='description']").val(n.description)
                    if(n.status == 1){
                        $('#dictionary_form .status_switch').bootstrapSwitch('state',true);
                    }else{
                        $('#dictionary_form .status_switch').bootstrapSwitch('state',false);
                    }
                }else{
                    _html += "<tr><th scope=\"row\">"+n.sortId+"</th>";
                    _html += "<td>"+n.name+"</td>";
                    _html += "<td>"+n.value+"</td>";
                    _html += '<td><span class="m-badge ' + status[n.status].class + ' m-badge--wide">' + status[n.status].title + '</span></td>';
                    _html += '<td><a href="" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill editDictionaryItem" title="编辑" item="'+n.id+'" data-toggle="modal" data-target=".dictionaryEdit">\
							    <i class="la la-edit"></i></a>\
						        <a class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill delDictionaryItem" title="删除" item="'+n.id+'" >\
							    <i class="la la-trash"></i></a></td>';
                    _html += "</tr>";
                }
            });
        }
        if(_html == ""){
            _html = "<tr><th colspan='5' scope=\"row\" style='text-align:center'> 未找到相关属性信息！</th>";
        }


        $(".dictionary_list").html(_html);
    }

    /**
     * 删除字典属性
     */
    var delDictionaryItem = function(){
        $(".dictionary_list ").on("click", ".delDictionaryItem", function () {
            blockUiOpen('#roles_list');
            var self = $(this);
            var id = self.attr("item");
            if(id != ""){
                request(
                    "delDictionaryItem",
                    'get',
                    {id:id},
                    function (result) {
                        if(result.message){
                            blockUiOpen('.dictionary_data_list',result.data);
                            self.parents("tr").remove();
                            blockUiClose('.dictionary_data_list','','',2000);
                        }else{
                            blockUiOpen('.dictionary_data_list',result.data);
                            blockUiClose('.dictionary_data_list','','',2000);
                        }
                    })
            }
        })
    }

    return {
        init: function () {
            dictionaryForm();
            delDictionaryItem();
            dictionaryChildForm();
            getDictionaryChildItem();
            getDictionaryValueListInfo();
        }
    };
}();
/**
 * 重置 modal 表单
 */
function removeValue(formAttrIbute, type, modalTitle){
    if(type == 'edit'){
        $(formAttrIbute + " .modal-title").text(modalTitle);
        $(formAttrIbute + " [name='save']").val('edit');
    }else{
        $(formAttrIbute + " .modal-title").text(modalTitle);
        $(formAttrIbute + " [name='save']").val('add');
    }
    $(formAttrIbute + " [name='id']").val('')
    $(formAttrIbute + " [name='name']").val('')
    $(formAttrIbute + " [name='description']").val('');
    $(formAttrIbute + " .form-control-feedback").remove();
    $(formAttrIbute + " div").removeClass("has-danger");
    $(formAttrIbute + " div").removeClass("has-success");
    $(formAttrIbute + " .m-alert").addClass("m--hide");
}

jQuery(document).ready(function() {
    Dictionary.init();
    /**
     * 选中第一个 radio
     */
    $(".first-radio").click()
    /**
     * 开关
     */
    $('.status_switch').on('switchChange.bootstrapSwitch', function (event,state) {
        if(state==true){
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(1)
        }else{
            $(this).parents("div").find(".status_switch_parent").find("[name='status']").val(2)
        }
    });
});