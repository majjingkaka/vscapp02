<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> -->

<style>
    .ck-editor__editable { height: 400px; }
    .ck-content { font-size: 15px; }
</style>


<style>
    textarea.form-control {
        height: 300px;
    }

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


<div class="col-sm-12 col-xs-12">

    <sf:form modelAttribute="noticeDetail" class="form-horizontal" id="noticeReg" name="noticeReg" action="/noticeReg" method="post">
        <sf:input type="hidden" path="noticeNo" name="noticeNo" id="noticeNo"/>

        <!-- <div class="form-group">
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
        </div> -->

        <div class="form-group">
            <label class="control-label col-sm-2" for="title">제목 :</label>
            <div class="col-sm-10">
                <sf:input path="title" type="text" placeholder="제목을 입력하세요." id="title" name="title" class="form-control"/>
            </div>
        </div>

        <!-- <div class="form-group">
            <label class="control-label col-sm-2" for="files">첨부이미지 :</label>
            <div class="col-sm-10">
                <input type="file" placeholder="파일을 선택하세요." id="files" name="files" class="form-control"/>
            </div>
        </div> -->

        <div class="form-group">
            <label class="control-label col-sm-2" for="content">내용 :</label>
            <div class="col-sm-10">
                <textarea path="content" cols="50" row="10" placeholder="내용을 입력하세요." id="content" name="content" class="form-control col-sm-5">${noticeDetail.content}</textarea>
            </div>
        </div>
        
        <!-- <div id="editor"></div> -->

        <br><br>

        <button type="button" class="button btn btn-default pull-right btn-gr" onclick="javascript:location.href='/noticeList'">목록으로</button>
        <button type="submit" id="saveText" class="button btn btn-default pull-right btn-gr">등록</button>

    </sf:form>
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

        $('#noticeReg').validate({
            ignore: [],
            debug: false,
            onfocusout: false,

            rules: {
                title: {
                    required: true
                },
                content: {
                    required: function(){
                        CKEDITOR.instances.content.updateElement();
                    },
                    minlength:10
                }
            },

            messages: {
                title: {
                    required: '제목은 필수값입니다.'
                },
                content: {
                    required: '내용은 필수값입니다.'
                }
            },
            errorPlacement: function(error, element) {
                // do nothing
            },
            invalidHandler: function(form, validator) {
                var errors = validator.numberOfInvalids();
                if (errors) {
                    alert(validator.errorList[0].message);
                    validator.errorList[0].element.focus();
                }
            },
            submitHandler: function (form) {
                //console.log('1');
                //save();
                //console.log($(':radio[name="headerType"]:checked').val());

                var content = CKEDITOR.instances.content.getData();
                var stringData = 'seq='+$('#noticeNo').val()+'&content='+content+'&title='+ $('#title').val()+'&headerType='+ $(':radio[name="headerType"]:checked').val();

                console.log(content);
                console.log(stringData);

                $.ajax({
                    url : "/notice/noticeReg",
                    type : "post",
                    data : stringData, // $('#noticeReg').serialize()
                    dataType : "json",
                    /*
                     async: false,
                     cache: false,
                     contentType: false,
                     processData: false,
                     enctype: 'multipart/form-data',
                     */
                    success : function(res) {
                        if ("success" == res.result) {

                            if(res.formType == "in"){
                                alert("등록이 완료되었습니다.");
                                location.href='/notice/noticeList';
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
        });

        /*$('input[name="files"]').fileuploader({
            // Options will go here
        });*/

        if($('#noticeNo').val() != 0){
            $('#saveText').text('수정완료');
            $('#resetBtn').addClass('hide');
        }

        $('#resetBtn').click(function () {
            $('form').each(function(){
                this.reset();
            });
        });

    });



</script>