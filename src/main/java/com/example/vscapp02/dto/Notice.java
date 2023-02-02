package com.example.vscapp02.dto;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * Created by majjingkaka on 2017-07-01.
 */
public class Notice {

    private int noticeNo;
    private String writerId;
    private String name;
    private String password;
    private String email;
    private String phoneNumber;
    private String title;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regDt;
    private String content;
    private Boolean contentOpen;
    private MultipartFile imgFile;

    private String comment;
    private String fileSize;
    private String fileNameOrigin;
    private String fileNameUpload;
    private String fileType;
    private String cType; // 컬럼타입
    private boolean headerType; // 0:리스트공지 1:상단공지

    private Date inpDt;

    public boolean isHeaderType() {
        return headerType;
    }

    public void setHeaderType(boolean headerType) {
        this.headerType = headerType;
    }

    public String getWriterId() {
        return writerId;
    }

    public void setWriterId(String writerId) {
        this.writerId = writerId;
    }

    public Boolean getContentOpen() {
        return contentOpen;
    }

    public void setContentOpen(Boolean contentOpen) {
        this.contentOpen = contentOpen;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileNameOrigin() {
        return fileNameOrigin;
    }

    public void setFileNameOrigin(String fileNameOrigin) {
        this.fileNameOrigin = fileNameOrigin;
    }

    public String getFileNameUpload() {
        return fileNameUpload;
    }

    public void setFileNameUpload(String fileNameUpload) {
        this.fileNameUpload = fileNameUpload;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getcType() {
        return cType;
    }

    public void setcType(String cType) {
        this.cType = cType;
    }

    public MultipartFile getImgFile() {
        return imgFile;
    }

    public void setImgFile(MultipartFile file) {
        this.imgFile = file;
    }

    public int getNoticeNo() {
        return noticeNo;
    }

    public void setNoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegDt() {
        return regDt;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    public Date getInpDt() {
        return inpDt;
    }

    public void setInpDt(Date inpDt) {
        this.inpDt = inpDt;
    }
}
