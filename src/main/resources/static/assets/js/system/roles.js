var DatatableRemoteAjaxDemo = function () {
    var demo = function () {
        var datatable = $('.m_datatable').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: '/system/roles/getRolesDataList'
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
                    if(row.id != ''){
                        return row.type;
                    }
                }
            }, {
                field: "name",
                title: "名称",
                width: 100
            }, {
                field: "description",
                title: "描述",
                width: 100
            }, {
                field: "createTime",
                title: "创建时间",
                sortable: 'asc',
                width: 150
            }, {
                field: "type",
                title: "类型",
                sortable: 'asc',
                width: 60,
                template: function (row) {
                    var status = {
                        1: {'title': '1', 'class': 'm-badge--brand'},
                        2: {'title': '2', 'class': ' m-badge--metal'},
                        3: {'title': '3', 'class': ' m-badge--primary'},
                        4: {'title': '4', 'class': ' m-badge--success'},
                        5: {'title': '5', 'class': ' m-badge--info'},
                        6: {'title': '6', 'class': ' m-badge--danger'},
                        7: {'title': '7', 'class': ' m-badge--warning'}
                    };
                    return '<span class="m-badge ' + status[row.type].class + ' m-badge--wide">' + status[row.type].title + '</span>';
                }
            },{
                field: "Actions",
                width: 100,
                title: "操作",
                sortable: false,
                overflow: 'visible',
                template: function (row) {
                    var dropup = (row.getDatatable().getPageSize() - row.getIndex()) <= 4 ? 'dropup' : '';
                    return '\
						<a href="" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="编辑" data-toggle="modal" data-target=".rolesEdit">\
							<i class="la la-edit"></i>\
						</a>\
						<a href="#" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="删除">\
							<i class="la la-trash"></i>\
						</a>\
					';
                }
            }]
        });

        var query = datatable.getDataSourceQuery();

        $('#m_form_search').on('change', function (e) {
            var query = datatable.getDataSourceQuery();
            query.generalSearch = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(query.generalSearch);

        $('#m_form_status').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.Status = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.Status !== 'undefined' ? query.Status : '');

        $('#m_form_type').on('change', function () {
            var query = datatable.getDataSourceQuery();
            query.Type = $(this).val().toLowerCase();
            datatable.setDataSourceQuery(query);
            datatable.load();
        }).val(typeof query.Type !== 'undefined' ? query.Type : '');

        $('#m_form_status, #m_form_type').selectpicker();

    };

    return {
        init: function () {
            demo();
        }
    };
}();

jQuery(document).ready(function () {
    DatatableRemoteAjaxDemo.init();
});