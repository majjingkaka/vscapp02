<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>notice</h1>

<c:choose>
    <c:when test="${noticeList.size() == 0 && noticeHeaderList.size() == 0}">
        요청한 진료공지사항 리스트가 없습니다.
    </c:when>
    <c:otherwise>

        <c:forEach items = "${noticeHeaderList}" var = "noticeHeaderList" varStatus="status">
            ${noticeHeaderList.title}
        </c:forEach>

        <c:forEach items = "${noticeList}" var = "noticeList" varStatus="status">
            ${noticeList.noticeNo} / ${noticeList.title} / ${noticeList.writerId}
        </c:forEach>

    </c:otherwise>
</c:choose>