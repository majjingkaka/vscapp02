<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> -->

<style>
    .ck-editor__editable { height: 400px; }
    .ck-content { font-size: 15px; }
</style>


<style>

    .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
        border-top: 0px solid #ddd !important;
    }

    .button{
        margin: 0px 0px 0px 5px;
    }

</style>
<!-- <script type="text/javascript" src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/lang/ko.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckajaxplugin.js"></script>


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
            <h2>공지입력</h2>
        </div>
      </div>

    <sf:form modelAttribute="noticeDetail" class="form-horizontal" id="noticeReg" name="noticeReg" action="/noticeReg" method="post">
        <sf:input type="hidden" path="noticeNo" name="noticeNo" id="noticeNo"/>

        <div class="form-group">
            <label class="control-label col-sm-2" for="headerType">타입 :</label>
            <div class="col-sm-10">
                <div class="radio" id="headerType" style="margin-top: -7px;">
                    <label class="radio-inline">
                        <sf:radiobutton path="headerType" name="headerType" value="0" checked="true" />리스트공지
                    </label>
                    <label class="radio-inline">
                        <sf:radiobutton path="headerType" name="headerType" value="1" />상단공지
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="contentOpen">공개여부 :</label>
            <div class="col-sm-10">
                <div class="radio" id="contentOpen">
                    <label class="radio-inline">
                        <sf:radiobutton path="contentOpen" name="contentOpen" value="0" checked="true" />비공개
                    </label>
                    <label class="radio-inline">
                        <sf:radiobutton path="contentOpen" name="contentOpen" value="1" />공개
                    </label>
                </div>

            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="title">제목 :</label>
            <div class="col-sm-10">
                <sf:input path="title" type="text" placeholder="제목을 입력하세요." id="title" name="title" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="imgFile">첨부이미지 :</label>
            <div class="col-sm-10">
                <input type="file" placeholder="파일을 선택하세요." id="imgFile" name="imgFile" class="form-control-file"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="password">비밀번호 :</label>
            <div class="col-sm-10">
                <sf:input path="password" type="password" placeholder="비밀번호를 입력하세요" id="password" name="password" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="content">내용 :</label>
            <div class="col-sm-10">
                <textarea path="content" cols="50" row="10" placeholder="내용을 입력하세요." id="content" name="content" class="form-control col-sm-5">${noticeDetail.content}</textarea>
            </div>
        </div>
        
        <!-- <div id="editor"></div> -->
        
    </sf:form>

    <button type="button" class="button btn btn-default pull-right btn-gr" onclick="javascript:location.href='/noticeList'">목록으로</button>
    <!-- <button type="submit" id="saveText" class="button btn btn-default pull-right btn-gr">등록</button> -->
    <button type="reset" id="resetBtn" class="button btn btn-default pull-right btn-gr">다시작성</button>
    <button type="button" id="saveText" class="button btn btn-default pull-right btn-gr" onclick="javascript:seve()">등록</button>
    
    <br>
    <br>
</div>


<!-- <script>
    $(document).ready(function(){
        ClassicEditor
        .create( document.querySelector( '#content' ), {
            //removePlugins: [ 'Heading' ],
            language: "ko"
        }).catch( error => {
            console.error( error );
        });
    });
    
</script> -->


<script>
    $(document).ready(function(){

        CKEDITOR.replace( 'content' ,{
            width:'100%',
            height:'300px'
        });

        // $('#noticeReg').validate({
        //     ignore: [],
        //     debug: false,
        //     onfocusout: false,

        //     rules: {
        //         title: {
        //             required: true
        //         },
        //         content: {
        //             required: function(){
        //                 CKEDITOR.instances.content.updateElement();
        //             },
        //             minlength:10
        //         }
        //     },

        //     messages: {
        //         title: {
        //             required: '제목은 필수값입니다.'
        //         },
        //         content: {
        //             required: '내용은 필수값입니다.'
        //         }
        //     },
        //     errorPlacement: function(error, element) {
        //         // do nothing
        //     },
        //     invalidHandler: function(form, validator) {
        //         var errors = validator.numberOfInvalids();
        //         if (errors) {
        //             alert(validator.errorList[0].message);
        //             validator.errorList[0].element.focus();
        //         }
        //     },
        //     submitHandler: function (form) {
        //         console.log('1');
        //         //save();
        //         //console.log($(':radio[name="headerType"]:checked').val());

        //         var content = CKEDITOR.instances.content.getData();
        //         var stringData = 'seq='+$('#noticeNo').val()+'&content='+content+'&title='+ $('#title').val()+'&headerType='+ $(':radio[name="headerType"]:checked').val();

        //         console.log(content);
        //         console.log(stringData);

        //         $.ajax({
        //             url : "/noticeReg",
        //             type : "post",
        //             data : stringData, // $('#noticeReg').serialize()
        //             dataType : "json",
        //             /*
        //              async: false,
        //              cache: false,
        //              contentType: false,
        //              processData: false,
        //              enctype: 'multipart/form-data',
        //              */
        //             success : function(res) {
        //                 if ("success" == res.result) {

        //                     if(res.formType == "in"){
        //                         alert("등록이 완료되었습니다.");
        //                         location.href='/notice/noticeList';
        //                         //location.reload();
        //                     }else if(res.formType == "up"){
        //                         alert("수정이 완료되었습니다.");
        //                         location.href='/notice/'+$('#noticeNo').val();
        //                     }
        //                 }else {
        //                     alert(res.message);
        //                 }
        //             }
        //         });

        //     }
        // });

        // $('input[name="files"]').fileuploader({
        //     // Options will go here
        // });

        if($('#noticeNo').val() != 0){
            $('#saveText').text('수정완료');
            $('#resetBtn').addClass('hide');
        }

        $('#resetBtn').click(function () {
            $('form').each(function(){
                this.reset();
            });
        });

        var formData = new FormData();
        if($("input[name=imgFile]")[0].files[0] != undefined){
            formData.append("imgFile",$("input[name=imgFile]")[0].files[0]);
        }

    });


    function seve(){
    console.log('1');
    //document.consultReg.submit();
    //$("#consultReg").serialize()

        // if(!$("#name").val()) {
        //     alert("이름을 입력해 주세요.");
        //     $("#name").focus();
        //     return;
        // }
        // if(!validateEmail($("#email").val())) {
        //     alert("이메일이 유효하지 않습니다.");
        //     $("#email").focus();
        //     return;
        // }
        // if(!validateCellphone($("#phoneNumber").val())) {
        //     alert("휴대전화번호가 올바르지 않습니다.");
        //     $("#phoneNumber").focus();
        //     return;
        // }
        
        if(!$("#title").val()) {
            alert("제목을 입력해 주세요.");
            $("#title").focus();
            return;
        }
        
        if(!CKEDITOR.instances.content.getData()) {
            alert("내용을 입력해 주세요.");
            $("#content").focus();
            return;
        }
        
        if(!$("#password").val()) {
            alert("비밀번호를 입력해 주세요.");
            $("#password").focus();
            return;
        }

        var formData = new FormData();
        if($("input[name=imgFile]")[0].files[0] != undefined){
            formData.append("imgFile",$("input[name=imgFile]")[0].files[0]);
        }

        var content = CKEDITOR.instances.content.getData();
        console.log(content);

        formData.append("noticeNo",$('#noticeNo').val());
        formData.append("name",$('#name').val());
        formData.append("title",$('#title').val());
        formData.append("content",content);
        formData.append("password",$('#password').val());
        formData.append("contentOpen",$(':radio[name="contentOpen"]:checked').val());
        formData.append("headerType",$(':radio[name="headerType"]:checked').val());
        
        //var stringData = 'seq='+$('#seq').val()+'&content='+content+'&title='+ $('#title').val()+'&headerType='+ $(':radio[name="headerType"]:checked').val();
        //console.log(stringData);

        $.ajax({
            url : "/noticeReg",
            type : "post",
            data : formData,
            dataType : "json",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            enctype: 'multipart/form-data',
            success : function(res) {
                if ("success" == res.result) {
                    if(res.formType == "in"){
                        alert("등록이 완료되었습니다.");
                        location.href='/noticeList';
                        //location.reload();
                    }else if(res.formType == "up"){
                        alert("수정이 완료되었습니다.");
                        location.href='/notice/'+$('#noticeNo').val();
                    }
                }else {
                    alert(res.message);
                }
            }
        });
    }


</script>