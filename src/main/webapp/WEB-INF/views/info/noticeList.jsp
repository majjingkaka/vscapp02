<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h1>notice</h1>
<!-- container -->
<div class="p-3"> 

    <div class="col-sm-12 col-xs-12 mg-sm-b50 mg-xs-b20">
        <!-- <blockquote class="mg-sm-t30"><strong>진료공지사항</strong></blockquote> -->

        <form class="form-horizontal" role="form" action="noticeList" id="search">
            <div style="overflow-x:auto;">

                <table class="table table-striped">
                    <thead>
                      <tr>
                        <!-- <th style="width: 10%;">#</th>
                        <th style="width: 50%;">Title</th>
                        <th style="width: 20%;">Writer</th>
                        <th style="width: 20%;">Date</th> -->
                        <th class="col-2 col-sm-2">No</th>
                        <th class="col-6 col-sm-6">Title</th>
                        <th class="col-2 col-sm-2">Writer</th>
                        <th class="col-2 col-sm-2">Date</th>
                      </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${noticeList.size() == 0 && noticeHeaderList.size() == 0}">
                                <tr>
                                    <td colspan="4" style="text-align: center">
                                        요청한 공지사항 리스트가 없습니다.
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
            
                                <c:forEach items = "${noticeHeaderList}" var = "noticeHeaderList" varStatus="status">
                                    <tr>
                                        <!-- <td>${noticeHeaderList.noticeNo}</td> -->
                                        <td><span class="label pkbcolor">공지</span></td>
                                        <td><a href="/notice/${noticeHeaderList.noticeNo}">${noticeHeaderList.title}</a></td>
                                        <td>${noticeHeaderList.writerId}</td>
                                        <td><fmt:formatDate value="${noticeHeaderList.inpDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    </tr>
                                </c:forEach>
            
                                <c:forEach items = "${noticeList}" var = "noticeList" varStatus="status">
                                    <tr>
                                        <td>${noticeList.noticeNo}</td>
                                        <!-- <td><span class="label pkbcolor">공지</span></td> -->
                                        <td><a href="/notice/${noticeList.noticeNo}">${noticeList.title}</a></td>
                                        <td>${noticeList.writerId}</td>
                                        <td><fmt:formatDate value="${noticeList.inpDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    </tr>
                                    <!-- ${noticeList.noticeNo} / ${noticeList.title} / ${noticeList.content} / ${noticeList.writerId} / ${noticeList.inpDt} -->
                                </c:forEach>
            
                            </c:otherwise>
                        </c:choose>
                </table>
            
                <input name="page" type="hidden" id="page" value="1" />
                <!-- <input name="searchType" type="hidden" id="searchType" value="${searchType}"/> -->
                <!-- <input name="searchContent" type="hidden" id="searchContent" value="${searchContent}"/> -->
                
            </div>
        </form>
        
        <a class="btn btn-default pull-right btn-gr" href="/noticeRegForm">글쓰기</a>
        
        <br><br>

        <div class="col-sm-12 col-xs-12 text-center">
            <ul class="pagination">
                <c:if test="${pagerInfo.startPageIndex > pagerInfo.blockPage}">
                    <li><a class="paging-type" href="javascript:goPage(${pagerInfo.startPageIndex -pagerInfo.blockPage});" aria-label="Prev"><span aria-hidden="true">« 이전</span></a></li>
                </c:if>
    
                <c:forEach begin="${pagerInfo.startPageIndex}" end="${pagerInfo.endPageIndex}" var="index">
                    <li class="${pagerInfo.currentPage== index ? 'active':''}"><a class="paging-type" href="javascript:goPage(${index});">${index}</a></li>
                </c:forEach>
    
                <c:if test="${pagerInfo.endPageIndex < pagerInfo.pageTotal}">
                    <li><a class="paging-type" href="javascript:goPage(${pagerInfo.endPageIndex + 1});" aria-label="Next"><span aria-hidden="true">다음 »</span></a></li>
                </c:if>
            </ul>
        </div>

        <br><br>

    </div>
    

</div>


<!-- <c:choose>
    <c:when test="${noticeList.size() == 0 && noticeHeaderList.size() == 0}">
        요청한 공지사항 리스트가 없습니다.
    </c:when>
    <c:otherwise>

        <c:forEach items = "${noticeHeaderList}" var = "noticeHeaderList" varStatus="status">
            ${noticeHeaderList.title}
        </c:forEach>

        <c:forEach items = "${noticeList}" var = "noticeList" varStatus="status">
            ${noticeList.noticeNo} / ${noticeList.title} / ${noticeList.content} / ${noticeList.writerId} / ${noticeList.inpDt}
        </c:forEach>

    </c:otherwise>
</c:choose> -->



<script>

    // function search() {

    //     var select = new String($("#searchSelector option:selected").val());
    //     var searchBox = $("#searchBox").val();

    //     if(select != ""){ //선택되었을경우
    //         if(searchBox != "") { //둘다 입력조건일경우

    //             if (select == 'searchNum') { //숫자일경우

    //                 //console.log(searchBox);
    //                 //console.log($.isNumeric(searchBox));

    //                 if (!$.isNumeric(searchBox)) {
    //                     alert("숫자만 입력하세요.");
    //                     $("#searchBox").focus();
    //                     return;
    //                 }
    //             }

    //         }else{ //빈값을경우
    //             alert("입력해 주세요.");
    //             $("#searchBox").focus();
    //             return;
    //         }
    //     }else{
    //         /*alert("검색조건을 선택해 주세요.");
    //         $("#searchBox").focus();
    //         return;*/
    //         $('#searchType').attr('value', '');
    //         $('#searchContent').attr('value', '');
    //     }

    //     $('#searchType').attr('value', $("#searchSelector option:selected").val());
    //     $('#searchContent').attr('value', $('#searchBox').val());

    //     $("#search").submit();
    // }


    function goPage(page) {
        
        console.log(page);

        /*
         location.href = location.pathname + replaceQueryParam("page", page, window.location.search);
         */
        $("input[name='page']").val(page);
        /*        $("#search").attr("action","/payback/eachDetailPayback");*/
        $("#search").submit();
    }
</script>

