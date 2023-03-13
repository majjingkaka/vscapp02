<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<title name="title">솔트코딩 noticeDetail</title>
<meta name="description" content="스크래치 로봇 블록코딩 초등코딩 noticeDetail">

<!-- <%
    pageContext.setAttribute("CR", "\r");
    pageContext.setAttribute("LF", "\n");
    pageContext.setAttribute("CRLF", "\r\n");
    pageContext.setAttribute("SP", "&nbsp;");
    pageContext.setAttribute("BR", "<br/>");
%> -->

<style>
    img {
        max-width: 100% !important;
        height: auto !important;
    }

    textarea.form-control {
        height: 300px;
    }

    .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
        border-top: 0px solid #ddd !important;
    }

    /* .button{
        margin: 0px 0px 0px 5px;
    } */

    #uploadimg{
        background-size: cover;
        height: 200px;
        width: auto;
    }

    #detail-box{
        background-color: #f5f5f5;
    }

</style>

<style>
    .blockquote{
        background-color: #fff;
        border-left: .7rem solid #fff;
        margin: 1.5em .7rem;
        padding: .5em .7rem;
    }
</style>
    
    

<div class="container-fluid p-3">

    <div class="card">
        <div class="card-body">
            <h2>상세</h2>
        </div>
    </div>

    
    <div class="card" style="font-size: 15px;">
        <div class="card-body">
            
            <div class="form-group">
                <label class="control-label" for="title">제목 :</label>
                <div class="">
                    <p class="form-control-static" id="title">${noticeDetail.title}</p>
                </div>
            </div>
        
            <div class="form-group">
                <label class="control-label" for="inpDt">작성일 :</label>
                <div class="">
                    <p class="form-control-static" id="inpDt"><fmt:formatDate value="${noticeDetail.inpDt}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                </div>
            </div>
        
            <c:if test="${null ne noticeDetail.fileNameUpload}">
                <div class="form-group">
                    <label class="control-label" for="uploadimg">첨부이미지 :</label>
                    <div class="">
                        <img id="uploadimg" src="${imgPath}${noticeDetail.fileNameUpload}" />
                    </div>
                </div>
            </c:if>
        
            <div class="form-group">
                <label class="control-label" for="title">내용 :</label>
                <div class="">
                    <p class="form-control-static" id="content">${noticeDetail.content}</p>
                </div>
            </div>

        </div>
    </div>
        
    
    


    <button type="button" class="button btn btn-default pull-right btn-gr btn-sm" onclick="javascript:location.href='/noticeList'">목록으로</button>
            
    <security:authorize access="hasRole('ADMIN')">
        <button type="button" class="button btn btn-default pull-right btn-gr btn-sm" onclick="javascript:deleteAndModify('d');">삭제</button>
        <button type="button" class="button btn btn-default pull-right btn-gr btn-sm" onclick="javascript:deleteAndModify('m');">수정</button>
    </security:authorize>
    <br><br>

</div>

<div class="modal fade" id="passwordConfirm" tabindex="-1" aria-labelledby="myModalLabelConfirm" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" style="top: 200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabelConfirm" class="modal-title">비밀번호 확인</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                <span aria-hidden="true">&times;</span>
            </div>

            <div class="modal-body">
                <input type="text" placeholder="비밀번호를 입력하세요." id="modalPassword" class="form-control" />
            </div>

            <div class="modal-footer">
                <button id="removeBtn" data-toggle="modal" class="button btn btn-default btn-sm btn-gr" onclick="remove();">삭제확인</button>
                <button id="modifyBtn" data-toggle="modal" class="button btn btn-default btn-sm hide btn-gr" onclick="modify();">수정확인</button>

                <button data-toggle="modal" class="button btn btn-default btn-sm btn-gr" onclick="$('#passwordConfirm').modal('hide');return false;">취소</button>
            </div>

        </div>
    </div>
</div>

<sf:form method="post" action="/noticeRegForm" id="noticeModify">
    <input type="hidden" value="${noticeDetail.noticeNo}" name="noticeNo" id="noticeNo">
</sf:form>

<script>

    $(document).ready(function(){
    });

    // function deleteAndModify(type){
    //     if(type == 'd'){
    //         //삭제
    //         if(confirm("삭제 하시겠습니까?")) {
    //             remove();
    //         }
    //     }else if(type == 'm'){
    //         if(confirm("수정 하시겠습니까?")) {
    //             modify();
    //         }
    //     }
    //     return;
    // }

    function deleteAndModify(type){
        if(type == 'd'){
            $('#removeBtn').removeClass('d-none');
            $('#modifyBtn').addClass('d-none');
        }else if(type == 'm'){
            $('#removeBtn').addClass('d-none');
            $('#modifyBtn').removeClass('d-none');
        }else{
            $('#removeBtn').removeClass('d-none');
            $('#modifyBtn').addClass('d-none');
        }
        
        $('#passwordConfirm').modal('show');
        return;
    }

    // function modify(){
    //     $('#noticeModify').submit();
    // }

    function remove(){
        var noticeNo = $('#noticeNo').val();
        var modalPassword = $('#modalPassword').val();
        $.ajax({
            url : "/noticeRemove",
            type : "post",
            data : {noticeNo : noticeNo, modalPassword : modalPassword},
            dataType : "json",
            success : function(res) {
                if ("success" == res.result) {
                    alert("삭제 완료되었습니다.");
                    location.href='/noticeList';
                    //location.reload();
                }else {
                    $('#passwordConfirm').modal('hide');
                    alert(res.message);
                }
            }
        });
    }

    function modify(){
        var noticeNo = $('#noticeNo').val();
        var modalPassword = $('#modalPassword').val();
        $.ajax({
            url : "/passwordCheck",
            type : "post",
            data : {noticeNo : noticeNo, modalPassword : modalPassword},
            dataType : "json",
            success : function(res) {
                if ("success" == res.result) {
                    $('#noticeModify').submit();
                }else {
                    $('#passwordConfirm').modal('hide');
                    alert(res.message);
                }
            }
        });
    }

    // function seve(){
    //     $.ajax({
    //         url : "/notice/noticeReg",
    //         type : "post",
    //         data : $("#consultReg").serialize(),
    //         dataType : "json",
    //         success : function(res) {
    //             if ("success" == res.result) {
    //                 alert("등록이 완료되었습니다.");
    //                 location.href='/notice/noticeList';
    //                 //location.reload();
    //             }else {
    //                 alert(res.message);
    //             }
    //         }
    //     });
    // }
</script>
