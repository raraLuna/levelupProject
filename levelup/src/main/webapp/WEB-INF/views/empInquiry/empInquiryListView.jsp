<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="./resources/css/empListView.css">
<script type="text/javascript" src="/levelup/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#searchByTypeSelect").on('change', function(){
		if ($(this).val()!= 0){
			$("#searchSubmitButton").click()
		}
	});
});

function showDateBox() {
	var dateBox = document.querySelector(".dateboxContainer");
	var keywordInputbox = document.getElementById("keywordInputbox");
	var typeDropdown = document.querySelector(".typeDropdownContainer");
	dateBox.style.display = 'block';	
	
	console.log(typeDropdown);

	if (keywordInputbox.style.display != 'none'){
		keywordInputbox.style.display = 'none';
	}
	
	if (typeDropdown.style.display != 'none'){
		typeDropdown.style.display = 'none';
	}
}

function showSearchBox() {
	var dateBox = document.querySelector(".dateboxContainer");
	var keywordInputbox = document.getElementById("keywordInputbox");
	var typeDropdown = document.querySelector(".typeDropdownContainer");
	keywordInputbox.style.display = 'inline';	

	if (dateBox.style.display != 'none'){
		dateBox.style.display = 'none';
	}
	
	if (typeDropdown.style.display != 'none'){
		typeDropdown.style.display = 'none';
	}
}

function showTypeDropdown(){
	var dateBox = document.querySelector(".dateboxContainer");
	var keywordInputbox = document.getElementById("keywordInputbox");
	var typeDropdown = document.querySelector(".typeDropdownContainer");
	typeDropdown.style.display = 'inline';	

	if (keywordInputbox.style.display != 'none'){
		keywordInputbox.style.display = 'none';
	}
	
	if (dateBox.style.display != 'none'){
		dateBox.style.display = 'none';
	}
}
</script>
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp" />
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp" />

</head>
<body data-sidebar="dark" data-layout-mode="light">
<c:if test="${ empty loginEmployee }">
   <c:redirect url="eloginPage.do"/>
</c:if>
	<!-- 내비게이션바, 사이드바 등등 -->
	<c:import url="/WEB-INF/views/common/layout.jsp" />

	<div class="main-content">
		<div class="page-content">
			<div class="container-fluid">

				<c:import url="/WEB-INF/views/common/page-title.jsp" />

				<c:set var="nowpage" value="1" />
				<c:if test="${ !empty requestScope.currentPage }">
					<c:set var="nowpage" value="${ requestScope.currentPage }" />
				</c:if>

				<!-- 여기서부터 내용 작성 -->
				<div class="container">

					<!-- 타입별 검색 1. 전제, 환불문의, 게임문의, 기타문의 -->
					<!-- 타입별 검색 내 keyword  종류 : 유저ID, 제목, 날짜 -->
					<form action="isearch.do">
						<div class="container">
							<div class="inputs">
								<input type="radio" name="action" value="writer" onclick="showSearchBox();"><label>유저ID</label>
								<input type="radio" name="action" value="title" onclick="showSearchBox();"><label>제목</label>
								<input type="radio" name="action" value="date" onclick="showDateBox();"><label>날짜</label>
								<input type="radio" name="action" value="type" onclick="showTypeDropdown(); "><label>문의구분</label>
								<div class="dateboxContainer">
									<input type="date" class="searchDateInput" name="begin"> ~ <input type="date" class="searchDateInput" name="end">
								</div>
								<div class="typeDropdownContainer">
									<select id="searchByTypeSelect" name="type">
										<option value="0">문의구분</option>
										<option value="1">환불문의</option>
										<option value="2">게임문의</option>
										<option value="3">기타문의</option>
									</select>
								</div>
								<input id="keywordInputbox" type="search" name="keyword">
								<input id="searchSubmitButton" type="submit" value="SEARCH">
								<input type="button" onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/ilist.do?page=${ nowpage }'" value="RESET">
							</div>
						</div>
					</form>
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
								<%-- <c:url var="idt" value="idetail.do">
									<c:param name="iid" value="${ requestScope.inquiry.inquiryId }" />
									<c:param name="page" value="${ nowpage }" />
								</c:url> --%>
							<c:if test="${ !empty requestScope.list }">
							<c:forEach items="${ requestScope.list }" var="i">
								<tr>
									<!-- 문의 제목 -->
									<td data-th="Question Title"><a class="ititle"
										href="/levelup/idetail.do?iid=${ i.inquiryId }&page=${ nowpage }&userId=${ i.userId }">${ i.inquiryTitle }</a></td>
									
									<!-- 유저 아이디 -->
									<td data-th="User ID">${ i.userId }</td>
									<!-- 문의 타입 -->
									<c:if test="${ i.inquiryType eq '1' }">
										<td data-th="Type">환불문의</td>
									</c:if>
									<c:if test="${ i.inquiryType eq '2' }">
										<td data-th="Type">게임문의</td>
									</c:if>
									<c:if test="${ i.inquiryType eq '3' }">
										<td data-th="Type">기타문의</td>
									</c:if>
									<!-- 문의 작성 날짜 -->
									<td data-th="Date"><fmt:formatDate value="${ i.editDate }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<!-- 문의 답변 여부 -->
									<c:if test="${ i.answerStatus eq 'Y' }">
										<td data-th="Answer"><span class="badge bg-success">답변완료</span></td>
									</c:if>
									<c:if test="${ i.answerStatus eq 'N' }">
										<td data-th="Answer"><span class="badge bg-danger">미답변</span></td>
									</c:if>
								</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
							<c:if test="${ empty requestScope.list }">
								<p>결과가 존재하지 않습니다.</p>
							</c:if>

					<br>

					<%-- 페이징 처리 뷰 포함 처리 --%>
					<c:import url="/WEB-INF/views/common/pagingView.jsp" />
				</div>

				<!-- container-fluid -->
			</div>
			<!-- page-content -->
		</div>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- main-content -->

</body>
</html>

