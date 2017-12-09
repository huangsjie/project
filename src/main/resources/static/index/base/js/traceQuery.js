var traceQuery = function () {
    $( "#origin_form" ).validate({
        rules: {
            originCode: {
                required: true,
                alphanumerical:true
            }
        },
        submitHandler: function (form){
            form.submit();
        }
    });
    return {
        init: function () {
            traceQuery();
        }
    };
}()

