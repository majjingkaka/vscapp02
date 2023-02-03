package com.example.vscapp02.common;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

//import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
//import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class ImageUpload {

    public static Map<String, Object> imageUpload(MultipartFile multipartFile,
                                                  HttpServletRequest request,
                                                  Map<String, Object> result) throws IOException {

        String originalFilename = multipartFile.getOriginalFilename();
        String uploadedFileName = System.currentTimeMillis() + "-" + UUID.randomUUID().toString()+originalFilename.substring(originalFilename.lastIndexOf("."));

        //System.out.println(originalFilename);
        //System.out.println(uploadedFileName);

        //ServletContext context = request.getServletContext();
        //String path = context.getRealPath("/")+"upload/";
        String path = "src/main/resources/upload/";

        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }

        File uploadFile = new File(path + uploadedFileName);
        multipartFile.transferTo(uploadFile);

        result.put("originalFilename", originalFilename);
        result.put("uploadedFileName", uploadedFileName);

        return result;
    }

    public static boolean imageRemove(HttpServletRequest request, String uploadedFileName) throws IOException{

        //ServletContext context = request.getServletContext();
        //String path = context.getRealPath("/")+"upload/";
        String path = "src/main/resources/upload/";

        try {
            File file = new File(path + uploadedFileName);

            if(file.exists() == true){
                file.delete();
            }

        }catch (Exception e){
            return false;
        }

        return true;
    }


}
