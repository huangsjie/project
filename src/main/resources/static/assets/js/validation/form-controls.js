var FormControls = function () {
    var menuForm = function () {
        $( "#menu_form" ).validate({
            rules: {
                name: {
                    required: true,
                    name: true
                },
                url: {
                    required: true
                },
                sortId: {
                    required: true,
                    sortId: true
                },
                parentId: {
                    required: true,
                    parentId: true
                },
                iconClass: {
                    required: true,
                    iconClass: true
                },
                type: {
                    required: true,
                    type: true
                },
                description: {
                    required: true,
                    description:true,
                    minlength: 5,
                    maxlength: 100
                }
            },

            //display error alert on form submit
            invalidHandler: function(event, validator) {
                var alert = $('#m_form_1_msg');
                alert.removeClass('m--hide').show();
                mApp.scrollTo(alert, -200);
            },

            submitHandler: function (form) {
                //form[0].submit(); // submit the form
            }
        });
    }

    return {
        init: function() {
            menuForm();
        }
    };
}();

jQuery(document).ready(function() {
    FormControls.init();
});