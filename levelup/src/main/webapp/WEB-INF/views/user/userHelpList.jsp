<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<script src="resources/js/jquery-3.7.0.min.js"></script>
<c:set var="nowpage" value="1" /> 
<c:if test="${ !empty requestScope.currentPage }">
   <c:set var="nowpage" value="${ requestScope.currentPage }"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/user/userHeader.jsp"/>
<c:if test="${not empty message}">
    <script type="text/javascript">
    	alert("삭제되었습니다.");
    </script>
</c:if>
<div class="container">
<div class="row">
<div class="col-2"></div>
<div class="col-7 bg-white border border-3 mb-5">
<div class="container">
<hr>
<h3>도움말&문의</h3>|
<a onclick="help1()">&nbsp;&nbsp;&nbsp; 환불문의 &nbsp;&nbsp;&nbsp;</a>|
<a onclick="help2()">&nbsp;&nbsp;&nbsp; 게임문의 &nbsp;&nbsp;&nbsp;</a>| 
<a onclick="help3()">&nbsp;&nbsp;&nbsp; 기타문의 &nbsp;&nbsp;&nbsp;</a> | 
<a onclick="help5()">&nbsp;&nbsp;&nbsp; 문의전화 &nbsp;&nbsp;&nbsp;</a> |
</div>	

		
		<hr>
		
			<div class="container-fluid">

				<c:import url="/WEB-INF/views/common/page-title.jsp" />

				<c:set var="nowpage" value="1" />
				<c:if test="${ !empty requestScope.currentPage }">
					<c:set var="nowpage" value="${ requestScope.currentPage }" />
				</c:if>

				<!-- 여기서부터 내용 작성 -->
				<div class="container">

					<!-- 문의 테이블 -->
					<table class="rwd-table">
						<tbody>
							<tr>
								<th>Question Title</th>
								<th>User ID</th>
								<th>Type</th>
								<th>Date</th>
								<th>Status</th>
							</tr>
							<c:forEach items="${ requestScope.list }" var="i">
								<tr>
									<td data-th="Question Title"><a class="ititle"
    								href="javascript:void(0);" onclick="checkUser('${i.userId}', '${sessionScope.loginUser.userId}', '${i.inquiryId}');">${i.inquiryTitle}</a></td>
									<td data-th="User ID">${ i.userId }</td>
									<c:if test="${ i.inquiryType eq '1' }">
										<td data-th="Type">환불문의</td>
									</c:if>
									<c:if test="${ i.inquiryType eq '2' }">
										<td data-th="Type">게임문의</td>
									</c:if>
									<c:if test="${ i.inquiryType eq '3' }">
										<td data-th="Type">기타문의</td>
									</c:if>
									<td data-th="Date"><fmt:formatDate value="${ i.editDate }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<c:if test="${ i.answerStatus eq 'Y' }">
										<td data-th="Answer"><span class="badge bg-success">답변완료</span></td>
									</c:if>
									<c:if test="${ i.answerStatus eq 'N' }">
										<td data-th="Answer"><span class="badge bg-danger">미답변</span></td>
									</c:if>
								</tr>

							</c:forEach>
						</tbody>
					</table>

					<br><br><br>
					<c:if test="${ !empty sessionScope.loginUser }">
						<input type="button" value="문의 작성하기" id="submitButton">
					</c:if>
					<c:if test="${ empty sessionScope.loginUser }">
						&nbsp;
					</c:if>
				</div>

				<!-- container-fluid -->
			</div>
			<br><br><br><br>
		<!-- page-content -->

</div>
<div class="col-3"></div>
</div>
<div class="row">
<div class="col-2"></div>
<div class="col-7">
		<div>
			<c:import url="/WEB-INF/views/common/pagingView.jsp" />
		</div>

</div>
<div class="col-3"></div>
</div>
</div>

<script type="text/javascript">
        // 버튼 클릭 이벤트 핸들러
        document.getElementById("submitButton").addEventListener("click", function() {
            // inquiryu.do 실행
            window.location.href = "inquiryu.do";
        });
        $(document).ready(function () {
            $('td[data-th="User ID"]').each(function () {
                var userId = $(this).text();
                if (userId.length > 2) {
                    var hiddenPart = '*'.repeat(userId.length - 2);
                    var visiblePart = userId.substring(0, 2);
                    var maskedUserId = visiblePart + hiddenPart;
                    $(this).text(maskedUserId);
                }
            });
        });
        function help1(){
        	 location.href = "${ pageContext.servletContext.contextPath }/helptype1.do";
        }
        function help2(){
       	 location.href = "${ pageContext.servletContext.contextPath }/helptype2.do";
       }
        function help3(){
       	 location.href = "${ pageContext.servletContext.contextPath }/helptype3.do";
       }
        function help4(){
       	 location.href = "${ pageContext.servletContext.contextPath }/uitem.do";
       }
        function help5(){
       	 location.href = "${ pageContext.servletContext.contextPath }/helptype5.do";
       }
</script>
<script type="text/javascript">
function checkUser(postUserId, currentUserId, inquiryId) {
    if (postUserId !== currentUserId) {
        alert("본인 게시글만 확인할 수 있습니다.");
    } else {
        var page = '${nowpage}';
        window.location.href = "/levelup/uuidetail.do?iid=" + inquiryId + "&page=" + page + "&userId=" + postUserId;
    }
}
</script>
<c:import url="/WEB-INF/views/user/userFooter.jsp"/>
</body>
</html>