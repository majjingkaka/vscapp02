package com.example.vscapp02.controller;



import com.example.vscapp02.common.ImageDomain;
import com.example.vscapp02.common.ImageUpload;
import com.example.vscapp02.dto.FileInfo;
import com.example.vscapp02.dto.Notice;
import com.example.vscapp02.dto.PagerInfo;

// import com.nsk.hospital.common.ImageDomain;
// import com.nsk.hospital.common.ImageUpload;
// import com.nsk.hospital.model.Notice;
// import com.nsk.hospital.model.PagerInfo;
// import com.nsk.hospital.model.FileInfo;

import com.example.vscapp02.mapper.NoticeMapper;
//import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.security.Principal;
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import java.io.File;
import java.util.*;

//import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

@Controller
//@RequestMapping(path = "/info")
public class NoticeController {

    //private static Logger logger = LoggerFactory.getLogger(NoticeController.class);
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private NoticeMapper noticeMapper;

    @Autowired
    private ImageDomain imageDomain;

    // 리스트조회
    @RequestMapping(path = "/noticeList", method = RequestMethod.GET)
    public String noticeList(Notice notice,
                             Model model,
                             Principal principal,
                             @RequestParam(defaultValue = "")String searchType,
                             @RequestParam(defaultValue = "")String searchContent,
                             @RequestParam(defaultValue = "1")int page){
        logger.debug("### NoticeController noticeList call...");
        
        if(principal != null){
            if(!principal.getName().isEmpty() && principal.getName().equals("admin")){
                notice.setContentOpen(null);
            }else{
                notice.setContentOpen(true);
            }
        }else{
            notice.setContentOpen(true);
        }

        // 검색조건 세팅
        // if(!StringUtils.isEmpty(searchType)){
        //     if(searchType.equals("searchNum")){
        //         notice.setSeq(Integer.parseInt(searchContent));
        //     }else if(searchType.equals("searchTitle")){
        //         notice.setTitle(searchContent);
        //     }else if(searchType.equals("searchPerson")){
        //         notice.setName(searchContent);
        //     }

        //     model.addAttribute("searchType", searchType);
        //     model.addAttribute("searchContent", searchContent);
        // }

        //notice.setcType("notice");
        notice.setHeaderType(true);
        List<Notice> noticeHeaderList = noticeMapper.selectHeaderNotices(notice);

        notice.setHeaderType(false);
        int noticeTotalCount = noticeMapper.selectNoticeTotalCount(notice);

        PagerInfo pagerInfo = new PagerInfo(page,10);
        pagerInfo.setItemCountTotal(noticeTotalCount);

        List<Notice> noticeList = noticeMapper.selectNotices(notice, pagerInfo);

        model.addAttribute("pageName", "noticeList");
        model.addAttribute("noticeHeaderList", noticeHeaderList);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("pagerInfo", pagerInfo);

        return "info/noticeList";
    }

    
    // 등록폼
    @RequestMapping(path = "/noticeRegForm")
    public String noticeRegForm(Notice notice, Model model){

        //notice.setcType("notice");

        if(notice.getNoticeNo() != 0){
            notice = noticeMapper.selectNotice(notice);
        }

        model.addAttribute("pageName", "noticeRegForm");
        model.addAttribute("noticeDetail", notice);
        return "info/noticeRegForm";
    }

    
    // 등록처리 //produces = "application/json"
    @RequestMapping(path = "/noticeReg", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> noticeReg(Model model, 
                                        Notice notice, 
                                        MultipartHttpServletRequest request,
                                        Principal principal) {
        Map<String, Object> result = new HashMap<String, Object>();
        Iterator<String> itr =  request.getFileNames();

        if (itr.hasNext()) { //!StringUtils.isEmpty(consult.getImgFile())
            MultipartFile file = request.getFile(itr.next());

            try {

                result = ImageUpload.imageUpload(file, request, result);

                String originalFilename = result.get("originalFilename") + "";
                String uploadedFileName = result.get("uploadedFileName") + "";

                notice.setFileNameOrigin(originalFilename);
                notice.setFileNameUpload(uploadedFileName);
                notice.setFileSize(notice.getImgFile().getSize()+"");
                notice.setFileType(originalFilename.substring(originalFilename.lastIndexOf(".")+1, originalFilename.length()));

            }catch (Exception e){
                //e.printStackTrace();
                result.put("result", "fail");
                result.put("message", e.getMessage());
            }
        }
        
        notice.setContent(StringEscapeUtils.escapeHtml4(notice.getContent()));
        //notice.setcType("notice"); // 컬럼타입
        
        // if(notice.getWriterId() == null || notice.getWriterId().isEmpty()){
        //     notice.setWriterId("nologin");
        // }
        
        if(principal != null){
            if(principal.getName().isEmpty()){
                notice.setWriterId("nologin");
            }else{
                notice.setWriterId(principal.getName());
            }
        }

        if(notice.getNoticeNo() != 0 ){
            int updateNotice = noticeMapper.updateNotice(notice);
            result.put("formType","up");
            result.put("formTypeCt",updateNotice);
        }else{
            //notice.setRegDt(new Date()); // 등록시간 지정
            int insertNotice = noticeMapper.insertNotice(notice);
            result.put("formType","in");
            result.put("formTypeCt",insertNotice);
        }
        result.put("result","success");
        
        // if(notice.getNoticeNo() != 0){
        //     notice = noticeMapper.selectNotice(notice);
        // }
        // model.addAttribute("noticeDetail", notice);
        //noticeDetail(notice.getNoticeNo(),model,request);
        return result;
        //return "info/noticeDetail";
    }

    // 상세
    @RequestMapping(path = "/notice/{seq}", method = RequestMethod.GET)
    public String noticeDetail(@PathVariable int seq, Model model, HttpServletRequest request){

        Notice notice = new Notice();
        notice.setNoticeNo(seq);
        //notice.setcType("notice");

        //ServletContext context = request.getServletContext();
        String pathType = "upload/";
        //String path = context.getRealPath("/")+pathType;

        Notice noticeDetail = noticeMapper.selectNotice(notice);
        String unescapeHtml4Content = StringEscapeUtils.unescapeHtml4(noticeDetail.getContent());
        noticeDetail.setContent(unescapeHtml4Content);

        model.addAttribute("pageName", "noticeDetail");
        model.addAttribute("noticeDetail", noticeDetail);
        model.addAttribute("imgPath", "/" + pathType);

        return "info/noticeDetail";
    }

    
    // 삭제 (업로드자료미포함처리)
    @RequestMapping(path = "/noticeRemove")
    @ResponseBody
    public Map<String, Object> noticeRemove(@RequestParam int noticeNo,
                                             @RequestParam(defaultValue = "", required = false) String modalPassword,
                                             Model model){

        Map<String, Object> result = new HashMap<String, Object>();
        Notice notice = new Notice();
        notice.setNoticeNo(noticeNo);
        //notice.setcType("notice");

        try {
            Notice noticetDetail = noticeMapper.selectNotice(notice);
            if(noticetDetail.getPassword().equals(modalPassword)){
                noticeMapper.deleteNotice(notice);
                result.put("result","success");
            }else{
                result.put("result", "fail");
                result.put("message", "비밀번호를 다시 확인해주세요");
            }

        }catch (Exception e){
            result.put("result", "fail");
            result.put("message", e.getMessage());
        }
        return result;
    }

    
    // 업로드
    @RequestMapping(value = "/uploadimages", produces = "application/json", consumes = "multipart/form-data", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadimages(Model model, MultipartHttpServletRequest request) {
        logger.info("uploadimages : ");

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("hasWarnings", false);
        result.put("isSuccess", true);

        List<FileInfo> fileInfoList = new ArrayList<FileInfo>();
        FileInfo fileInfo = new FileInfo();
        //List<Object> result = new ArrayList<Object>();//new HashMap<String, Object>();
        Iterator<String> itr =  request.getFileNames();

        if(itr.hasNext()) {
            MultipartFile file = request.getFile(itr.next());

            try{
                System.out.println("file getContentType : " + file.getContentType());
                System.out.println("file length : " + file.getBytes().length);
                System.out.println("file name : " + file.getOriginalFilename());

                result = ImageUpload.imageUpload(file, request, result);

                fileInfo.setFileName(file.getOriginalFilename());
                fileInfoList.add(fileInfo);

            }catch(Exception e){
                result.put("hasWarnings", true);
                result.put("isSuccess", true);
            }
        }

        //http://localhost:8080/resources/upload/1502166527779-8d787868-4d05-4566-96e4-69d91c74983d.jpg
        result.put("imgPath", imageDomain.getDomain() + "/upload/");
        result.put("files", fileInfoList);
        return result;
    }

    // 업로드 remove
    @RequestMapping(value = "/uploadimagesremove", produces = "application/json", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadimagesremove(Model model,
                                                  HttpServletRequest request,
                                                  @RequestParam(defaultValue = "", required = false) String fileName,
                                                  @RequestParam(defaultValue = "", required = false) String uploadedFileName) {
        logger.info("uploadimagesremove : " + uploadedFileName);

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("hasWarnings", false);
        result.put("isSuccess", true);

        try {
            boolean imageRemove = ImageUpload.imageRemove(request, uploadedFileName);
            logger.info("imageRemove : " + imageRemove);


        }catch (Exception e){
            result.put("hasWarnings", true);
            result.put("isSuccess", true);
        }
        return result;
    }

    /*패스워드 체크*/
    @RequestMapping(path = "/passwordCheck")
    @ResponseBody
    public Map<String, Object> passwordCheck(@RequestParam int noticeNo,
                                    @RequestParam(defaultValue = "", required = false) String modalPassword,
                                    Model model){

        Map<String, Object> result = new HashMap<String, Object>();
        Notice notice = new Notice();
        notice.setNoticeNo(noticeNo);
        //notice.setcType("consult");

        try {
            notice = noticeMapper.selectNotice(notice);
            if(notice.getPassword().equals(modalPassword) ){
                result.put("result","success");
                result.put("message", "success");
            }else{
                result.put("result", "fail");
                result.put("message", "비밀번호를 다시 확인해주세요");
            }
        }catch (Exception e){
            result.put("result", "fail");
            result.put("message", e.getMessage());
        }
        return result;
    }
}