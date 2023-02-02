package com.example.vscapp02.controller;



import com.example.vscapp02.dto.Notice;
import com.example.vscapp02.dto.PagerInfo;

// import com.nsk.hospital.common.ImageDomain;
// import com.nsk.hospital.common.ImageUpload;
// import com.nsk.hospital.model.Notice;
// import com.nsk.hospital.model.PagerInfo;
// import com.nsk.hospital.model.FileInfo;

import com.example.vscapp02.mapper.NoticeMapper;
//import org.apache.commons.lang3.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;

//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import java.io.File;
import java.util.*;

@Controller
//@RequestMapping(path = "/info")
public class NoticeController {

    //private static Logger logger = LoggerFactory.getLogger(NoticeController.class);
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private NoticeMapper noticeMapper;

    // @Autowired
    // private ImageDomain imageDomain;

    // 원내알림
    @RequestMapping(path = "/noticeList", method = RequestMethod.GET)
    public String noticeList(Notice notice,
                             Model model,
                             @RequestParam(defaultValue = "")String searchType,
                             @RequestParam(defaultValue = "")String searchContent,
                             @RequestParam(defaultValue = "1")int page){
        logger.debug("### NoticeController noticeList call...");
        
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
        
        model.addAttribute("noticeHeaderList", noticeHeaderList);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("pagerInfo", pagerInfo);

        return "info/notice";
    }

    /*
    // 원내알림 등록폼
    @RequestMapping(path = "/noticeRegForm")
    public String noticeRegForm(Notice notice, Model model){

        notice.setcType("notice");

        if(notice.getSeq() != 0){
            notice = noticeRepository.selectNotice(notice);
        }

        model.addAttribute("noticeDetail", notice);
        return "/notice/noticeRegForm";
    }

    // 원내알림 content 등록처리
    @RequestMapping(path = "/noticeReg", produces = "application/json", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> noticeReg(Model model, Notice notice) {
        Map<String, Object> result = new HashMap<String, Object>();

        
        notice.setContent(StringEscapeUtils.escapeHtml4(notice.getContent()));

        notice.setcType("notice"); // 컬럼타입
        if(notice.getSeq() != 0 ){
            int updateNotice = noticeRepository.updateNotice(notice);
            result.put("formType","up");
        }else{
            notice.setRegDt(new Date()); // 등록시간 지정
            int insertNotice = noticeRepository.insertNotice(notice);
            result.put("formType","in");
        }

        result.put("result","success");
        return result;
    }

    //  원내알림 상세
    @RequestMapping(path = "/{seq}", method = RequestMethod.GET)
    public String noticeDetail(@PathVariable int seq, Model model, HttpServletRequest request){

        Notice notice = new Notice();
        notice.setSeq(seq);
        notice.setcType("notice");

        ServletContext context = request.getServletContext();
        String pathType = "upload/";
        String path = context.getRealPath("/")+pathType;

        Notice noticeDetail = noticeRepository.selectNotice(notice);
        String unescapeHtml4Content = StringEscapeUtils.unescapeHtml4(noticeDetail.getContent());
        noticeDetail.setContent(unescapeHtml4Content);

        model.addAttribute("noticeDetail", noticeDetail);
        model.addAttribute("imgPath", "/" + pathType);

        return "/notice/noticeDetail";
    }

    // 원내알림 삭제
    @RequestMapping(path = "/noticeRemove")
    @ResponseBody
    public Map<String, Object> noticeRemove(@RequestParam int seq,
                                             @RequestParam(defaultValue = "", required = false) String modalPassword,
                                             Model model){

        Map<String, Object> result = new HashMap<String, Object>();
        Notice notice = new Notice();
        notice.setSeq(seq);
        notice.setcType("notice");

        try {
            noticeRepository.deleteNotice(notice);
            result.put("result","success");

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
 */

}