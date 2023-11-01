<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/common/head-script.jsp"/>
<c:url var="imoveup" value="iupdate.do">
	<c:param name="iid" value="${ requestScope.inquiry.inquiryId }" />
	<c:param name="page" value="${ nowpage }" />
</c:url>

<c:url var="idel" value="idelete.do">
	<c:param name="iid" value="${ requestScope.inquiry.inquiryId }" />
	<c:param name="page" value="${ nowpage }" />
</c:url>

<c:url var="iins" value="iinsertans.do">
	<c:param name="iid" value="${ requestScope.inquiry.inquiryId }" />
	<c:param name="page" value="${ nowpage }" />
</c:url>
<script type="text/javascript">
function moveUpdatePage(){
	location.href = "${ imoveup }";
}
function requestDelete(){
	location.href = "${ idel }";
}

function createans(){
	location.href = "${ iins }"
}

function golist(){
	location.href="${pageContext.servletContext.contextPath}/uhelp.do"
}

function golist(){
	location.href = "${pageContext.servletContext.contextPath}/uhelp.do?page=${ param.page }";
}

function godelete() {
    var modal = document.getElementById('confirmationModal');
    modal.style.display = 'block';

    var confirmDeleteButton = document.getElementById('confirmDeleteButton');
    confirmDeleteButton.addEventListener('click', deleteinquiry);
}

function godelete() {
    var modal = document.getElementById('confirmationModal');
    modal.style.display = 'block';

    var confirmDeleteButton = document.getElementById('confirmDeleteButton');
    confirmDeleteButton.addEventListener('click', deleteinquiry);

    var cancelDeleteButton = document.getElementById('cancelDeleteButton');
    cancelDeleteButton.addEventListener('click', closeConfirmationModal);
}

function deleteinquiry() {
	closeConfirmationModal();
	location.href="${pageContext.servletContext.contextPath}/deleteinquiry.do?page=${ param.page }&iid=${ requestScope.inquiry.inquiryId }";
}

function closeConfirmationModal() {
    var modal = document.getElementById('confirmationModal');
    modal.style.display = 'none';
}

function moveinqFixPage(){
	location.href = "${pageContext.servletContext.contextPath}/uinqfix.do?page=${ param.page}&iid=${ requestScope.inquiry.inquiryId }";
}
</script>
<title>useritemlist.jsp</title>
</head>
<body>
<c:import url="/WEB-INF/views/user/userHeader.jsp"/>
<div class="container">
	<div class="userinquiryback">
		<div class="card-body">
			<div class="d-flex">
				<div class="flex-grow-1 overflow-hidden">
					<h5 class="text-truncate font-size-15">문의 제목 : ${ requestScope.inquiry.inquiryTitle }</h5>
					<%-- <p class="text-muted">문의 ID : ${ requestScope.inquiry.inquiryId }</p> --%>
				</div>
			</div>
			
			<h5 class="font-size-15 mt-4">첨부파일 :</h5>
			<c:if test="${ !empty requestScope.inquiry.attachmentFileName }">
				<c:url var="idown" value="ifdown.do">
					<c:param name="file" value="${ requestScope.inquiry.attachmentFileName }" />												
				</c:url>
				<td>
					<h5 class="font-size-14 mb-1">
						
				   <c:set var="filename" value="${fn:split(requestScope.inquiry.attachmentFileName, '#')[1]}" />
				   <a href="${idown}" class="text-dark">${filename}</a> &nbsp; <a href="${ idown }" class="text-dark"><i class="bx bx-download h3 m-0"></i></a>
					</h5>
					

				</td>
			</c:if>
			<c:if test="${ empty requestScope.inquiry.attachmentFileName }">
			첨부파일 없음
			</c:if>
			
			<h5 class="font-size-15 mt-4">문의 내용 :</h5>
	
			<p class="text-muted">${ requestScope.inquiry.inquiryContent }</p>
	
	
			<div class="row task-dates">
				<div class="col-sm-4 col-6">
					<div class="mt-4">
						<h5 class="font-size-14">
							<i class="bx bx-calendar me-1 text-primary"></i> 문의 날짜
						</h5>
						<p class="text-muted mb-0"><fmt:formatDate value="${ requestScope.inquiry.editDate }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
					</div>
				</div>
	
				<div class="col-sm-4 col-6">
					<div class="mt-4">
						<h5 class="font-size-14">
							<i class="bx bx-calendar-check me-1 text-primary"></i> 문의 유형
						</h5>
						<p class="text-muted mb-0">
							<c:if test="${ requestScope.inquiry.inquiryType eq '1' }"> 환불문의 </c:if>
							<c:if test="${ requestScope.inquiry.inquiryType eq '2' }"> 게임문의 </c:if>
							<c:if test="${ requestScope.inquiry.inquiryType eq '3' }"> 기타문의 </c:if>
						</p>
					</div>
				</div>
				<div class="col-sm-4 col-6">
					<div class="mt-4">
						<h5 class="font-size-14">
							<i class="bx bx-calendar-check me-1 text-primary"></i> 유저 ID
						</h5>
						<p class="text-muted mb-0">${ requestScope.inquiry.userId }</p>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-4 col-6">
			<button type="button" class="btn" onclick="moveinqFixPage();">수정하기</button> &nbsp;
			<button type="button" class="btn" onclick="golist();">목록으로</button> &nbsp;
			<button type="button" class="btn" onclick="godelete();">삭제하기</button>
		</div>
	</div>
	<div class="userinquiryback">
		<c:if test="${ !empty requestScope.inquiry.answerContent }">
			<div class="card-body">
				<div class="d-flex">
					<div class="flex-grow-1 overflow-hidden">
						<h5 class="text-truncate font-size-15"> 답변 내용 : </h5>
						<p class="text-muted">${ requestScope.inquiry.answerContent }</p>
					</div>
				</div>
					
				<div class="text-muted mt-4">
                   <p><i class="mdi mdi-chevron-right text-primary me-1"></i> 사원 이름 : ${ requestScope.inquiry.employeeName }</p>
                   <p><i class="mdi mdi-chevron-right text-primary me-1"></i> 
                   답변 날짜 : <fmt:formatDate value="${ requestScope.inquiry.answerDate }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                   </div>
				<div class="row task-dates">
				</div>
			</div>
		</c:if>
		<c:if test="${ empty requestScope.inquiry.answerContent }">
			<div class="card-body">
				<p>아직 답변이 달리지 않았습니다.</p>
			</div>
		</c:if>
	</div>
</div>
<div id="confirmationModal" class="modal">
    <div class="modal-content">
    <br>
        <p>정말 삭제하시겠습니까?</p>
        <br>
        <button id="confirmDeleteButton" class="btn">삭제하기</button>
        <button id="cancelDeleteButton" class="btn">취소하기</button>
    </div>
</div>
<c:import url="/WEB-INF/views/user/userFooter.jsp"/>
</body>
</html>