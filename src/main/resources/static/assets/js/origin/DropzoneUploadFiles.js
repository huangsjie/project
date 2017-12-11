var DropzoneUploadFiles = function () {
        /**
         * 文件上传
         */
        var uploadDropzone = function () {
            Dropzone.options.mDropzoneOne = {
                thumbnailWidth: 256,
                thumbnailHeight: 141,
                paramName: "file",
                maxFiles: 1,
                maxFilesize: 5, // MB
                acceptedFiles: "image",
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