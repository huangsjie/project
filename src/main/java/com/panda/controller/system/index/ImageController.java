package com.panda.controller.system.index;

import com.alibaba.fastjson.JSONObject;
import com.panda.util.ImageCutUtil;
import com.panda.util.PhotoResult;
import com.panda.util.PhotoUploadUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * 上传图片的RestController
 * Created by eumji on 17-5-31.
 */
@RestController
@RequestMapping(value = "/system/image")
public class ImageController {

    private Logger logger = LoggerFactory.getLogger(ImageController.class);

    @Resource
    private PhotoUploadUtil photoUploadUtil;

    /**
     * 单图上传,图片未剪裁
     * @param file
     * @return
     */
    @RequestMapping("/imageUpload")
    public PhotoResult imageUpload(@RequestParam(value = "editormd-image-file",required = true) MultipartFile file){
        PhotoResult result = null;
        //设置filename
        // String filename = new Random().nextInt(10000)+file.getOriginalFilename();
        try {
            File files = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator")+file.getOriginalFilename());
            file.transferTo(files);

            result = photoUploadUtil.uploadPhoto(files.getAbsolutePath(), file.getOriginalFilename());
            return result;
        } catch (IOException e) {
           logger.error(e.getMessage());
           return new PhotoResult(0,"","IO异常上传失败！！！");
        }
    }

    /**
     * 单图上传，图片裁剪后上传
     * @param request 获取session的request
     * @param avatar_src 图片路径
     * @param avatar_data 图片裁剪的内容
     * @param file 图片
     * @return
     */
    @RequestMapping("/updateAvatar")
    public PhotoResult updateAvatar(HttpServletRequest request, String avatar_src, String avatar_data, @RequestParam(value = "avatar_file",required = true) MultipartFile file){
        PhotoResult result = null;
        String type = file.getContentType();
        if(type==null || !type.toLowerCase().startsWith("image/")) {
            return new PhotoResult(0,"","不支持的文件类型，仅支持图片！");
        }
        try {
            //本地新建临时文件
            File files = new File(System.getProperty("java.io.tmpdir"),file.getOriginalFilename());
            JSONObject object = (JSONObject) JSONObject.parse(avatar_data);

            InputStream inputStream = file.getInputStream();
            //裁剪图片
            ImageCutUtil.cut(inputStream, files, (int) object.getFloatValue("x"), (int) object.getFloatValue("y"), (int) object.getFloatValue("width"), (int) object.getFloatValue("height"));
            inputStream.close();
            //上传图片
            result = photoUploadUtil.uploadPhoto(files.getAbsolutePath(), file.getOriginalFilename());

        }catch (IOException e){
           logger.error(e.getMessage());
            return new PhotoResult(0,"","上传图片发生异常！");
        }
        return result;
    }
}
