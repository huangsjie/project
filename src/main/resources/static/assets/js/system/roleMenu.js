var Treeview = function () {
    // 菜单树初始化
    var menu_tree = function () {
        $('#menu_tree').jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                }
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder"
                },
                "file" : {
                    "icon" : "fa fa-file"
                }
            },
            "plugins": ["checkbox","types"]
        });
    }
    var checked_menu = function (roleMenu) {
        console.log(roleMenu)
    }
    return {
        init: function () {
            menu_tree();
        }
    };
}();

jQuery(document).ready(function() {
    //
    $(".m-widget4__item").on('click','[type=\'radio\']',function(){
        var id = $(this).val();
        request(
            'getRoleMenuDataList',
            'get',
            {id:id},
            function (result) {
            if(result.message){
                console.log(result.data)
            }
        })
        console.log($(this).val())
    })
    Treeview.init();
});