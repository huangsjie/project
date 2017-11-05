var Treeview = function () {
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
            "plugins": ["types"]
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