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
    //表单验证初始化
    var dictionaryForm = function () {
        $( "#dictionary_parent_edit_form" ).validate({
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
            invalidHandler: function(event, validator) {
                alertMsgShow('.m-form #danger_msg', 'danger', ' 编辑菜单请选中左侧 菜单Tree 要编辑的菜单. 新增请直接填写.');
            },

            submitHandler: function (form){
                request(
                    "saveMenu",
                    "post",
                    $("#menu_edit_form").serialize(),
                    function(result){
                        if(result.message){
                            alertMsgShow('.m-form #success_msg', 'success', result.data);
                        }else{
                            alertMsgShow('.m-form #warning_msg', 'warning', result.data);
                        }
                    }
                )
            }
        });
    }
    /**
     * 获取当前选中字典的属性信息
     */
    var get_dictionary_value_list = function () {
        $(".m-widget4__item").on('click', '[type=\'radio\']', function () {
            var id = $(this).val();
            request(
                'getDictionaryValueList',
                'get',
                {parentId: id},
                function (result) {
                    if (result.message) {
                        show_dictionary_list(id,result.data)
                    }else{
                        alertMsgShow('.m-form #warning_msg', 'warning', result.data);
                    }
                })
        })
    }

    /**
     * 显示属性列表
     * @param dictionaryList
     */
    var show_dictionary_list = function(parent,dictionaryList){
        var _html = '';
        if(dictionaryList != ''){
            $.each(dictionaryList, function (i, n) {
                if(n.id === parent){
                    $("#dictionary_parent_edit_form [name='name']").val(n.name)
                    $("#dictionary_parent_edit_form [name='value']").val(n.value)
                    $("#dictionary_parent_edit_form [name='id']").val(n.id)
                    $("#dictionary_parent_edit_form [name='sortId']").val(n.sortId)
                    $("#dictionary_parent_edit_form [name='description']").val(n.description)
                }else{
                    _html += "<tr><th scope=\"row\">"+n.sortId+"</th>";
                    _html += "<td>"+n.name+"</td>";
                    _html += "<td>"+n.value+"</td>";
                    _html += '<td><span class="m-badge ' + status[n.status].class + ' m-badge--wide">' + status[n.status].title + '</span></td>';
                    _html += "<td><a href=\"\" class=\"m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill editRoleItem\" title=\"编辑\" item=\""+n.id+"\" data-toggle=\"modal\" data-target=\".rolesEdit\">\n" +
                        "\t<i class=\"la la-edit\"></i>\n" +
                        "</a>\n" +
                        "<a class=\"m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill delRoleItem\" title=\"删除\" item=\""+n.id+"\" >\n" +
                        "\t<i class=\"la la-trash\"></i>\n" +
                        "</a></td>";
                    _html += "</tr>";
                }
            });
        }
        if(_html == ""){
            _html = "<tr><th colspan='5' scope=\"row\" style='text-align:center'> 未找到相关属性信息！</th>";
        }


        $(".dictionary_list").html(_html);
    }

    return {
        init: function () {
            dictionaryForm()
            get_dictionary_value_list();
        }
    };
}();

jQuery(document).ready(function() {
    Dictionary.init();
    /**
     * 选中第一个 radio
     */
    $(".first-radio").click()
});