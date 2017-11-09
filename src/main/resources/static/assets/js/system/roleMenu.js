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

    return {
        init: function () {
            menu_tree();
        }
    };
}();

jQuery(document).ready(function() {
    Treeview.init();
});