package com.marveliu.web.controller;

import com.marveliu.common.utils.Result;
import com.marveliu.common.utils.ResultUtil;
import com.marveliu.web.constants.Config;
import com.marveliu.web.utils.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * @Author: Marveliu
 * @Date: 2018/9/17 下午11:40
 * @Description:
 **/

@RestController
@RequestMapping("/upload")
public class UploadController {
    private static Logger logger = LoggerFactory.getLogger(UploadController.class);

    /**
     * 用户头像上传
     *
     * @param file
     * @return
     */
    @PostMapping(value = "/img")
    public Result upload(@RequestParam("file") MultipartFile file) {
        try {
            // todo:文件格式内容判断
            // 获取文件名
            String fileName = file.getOriginalFilename();
            logger.debug("上传的文件名为：" + fileName);
            // 获取文件的后缀，比如图片的jpeg,png
            String suffixName = fileName.substring(fileName.lastIndexOf("."));
            logger.debug("上传文件的后缀名为：" + suffixName);
            // 上传文件名
            String newFileName = UUID.randomUUID() + suffixName;
            logger.debug("转换后的文件名：" + newFileName);
            FileUtil.uploadFile(file.getBytes(), Config.AppUploadPath, newFileName);
            return ResultUtil.success();
        } catch (Exception e) {
            logger.error("上传用户头像失败", e);
        }
        return ResultUtil.error("用户头像上传失败");
    }
}