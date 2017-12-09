
jQuery(document).ready(function () {
    $( "#origin_form" ).validate({
        rules: {
            originCode: {
                required: true,
                alphanumerical:true
            }
        },

    submitHandler: function (form){
;
        request(
            "/index/traceQuery/proTraceAjax",
            "post",
            $("#origin_form").serialize(),
            function(result){
                console.log(result);
                if(result.message){
                    // blockUiClose('.originInfoEdit .modal-content',1,".close-parent",0);
                    //ToastrMsg(result.data,"success","topRight");
                    ;
                }else{
                    ToastrMsg(result.data,"error","topRight");
                }
            }
        )
    }
});

});

