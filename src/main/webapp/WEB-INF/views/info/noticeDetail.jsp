<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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

    .button{
        margin: 0px 0px 0px 5px;
    }

    #uploadimg{
        background-size: cover;
        height: 200px;
        width: auto;
    }

    #detail-box{
        background-color: #f5f5f5;
    }

</style>



<div class="n-container np fff mg-lg-t20 ">


    <div class="col-sm-10 col-xs-12 ">

        <div class="col-sm-12 col-xs-12 mg-sm-b50 mg-xs-b50">
            <form class="form-horizontal">

                <div id="detail-box" class="np col-sm-12 mg-sm-b50 mg-xs-b50">

                    <div class="form-group col-sm-8">
                        <label class="control-label col-sm-2" for="title">제목 :</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="title">${noticeDetail.title}</p>
                        </div>
                    </div>

                    <div class="form-group col-sm-4">
                        <label class="control-label col-sm-4" for="regDt">작성일 :</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="regDt"><fmt:formatDate value="${noticeDetail.regDt}" pattern="yyyy.MM.dd"/></p>
                        </div>
                    </div>

                    <c:if test="${null ne noticeDetail.fileNameUpload}">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="uploadimg">첨부이미지 :</label>
                            <div class="col-sm-10">
                                <img id="uploadimg" src="${imgPath}${noticeDetail.fileNameUpload}" />
                            </div>
                        </div>
                    </c:if>

                    <div class="form-group col-sm-12">
                        <div class="col-sm-12">
                            <p class="form-control-static" id="content">${noticeDetail.content}</p>
                        </div>
                    </div>

                </div>

            </form>

            <button type="button" class="button btn btn-default pull-right btn-gr" onclick="javascript:location.href='/noticeList'">목록으로</button>
            <security:authorize access="hasRole('ADMIN')">
                
            </security:authorize>

            <button type="button" class="button btn btn-default pull-right btn-gr" onclick="javascript:deleteAndModify('d');">삭제</button>
            <button type="button" class="button btn btn-default pull-right btn-gr" onclick="javascript:deleteAndModify('m');">수정</button>
            
            
            <br><br>

        </div>

    </div>
</div>

<div id="passwordConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabelConfirm" class="modal fade custommodal">
    <div role="document" class="modal-dialog" style="top: 200px;">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 id="myModalLabelConfirm" class="modal-title">비밀번호 확인</h3>
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
            $('#removeBtn').removeClass('hide');
            $('#modifyBtn').addClass('hide');
        }else if(type == 'm'){
            $('#removeBtn').addClass('hide');
            $('#modifyBtn').removeClass('hide');
        }else{
            $('#removeBtn').removeClass('hide');
            $('#modifyBtn').addClass('hide');
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
