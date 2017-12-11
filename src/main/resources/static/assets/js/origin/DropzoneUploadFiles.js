var DropzoneUploadFiles = function () {
        /**
         * 文件上传
         */
        var uploadDropzone = function () {
            Dropzone.options.mDropzoneOne = {
                thumbnailWidth: 256,
                thumbnailHeight: 141,
                paramName: "file",
                addRemoveLinks:true,//是否有删除图片的功能
                acceptedFiles: ".jpg,.jpeg,.png,.gif",
                maxFiles: 1,
                maxFilesize: 5, // MB
                success: function(file, result) {
                    if (result.message){
                        $("#origin_info_edit_form [name='imgUrl']").val(result.data.url);
                    }else{
                        ToastrMsg(result.data,"error","topRight");
                    }
                }
            };
        }
    return {
        init: function() {
            uploadDropzone();
        }
    };
}();

DropzoneUploadFiles.init();