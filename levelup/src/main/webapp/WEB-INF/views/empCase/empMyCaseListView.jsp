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
				<!-- 여기서부터 내용 작성 -->
				<div class="container">
					<!-- 문의 테이블 -->
					<table class="rwd-table">
						<tbody>
							<tr>
								<th>TITLE</th>
								<th>WRITER NAME</th>
								<th>TYPE</th>
								<th>MANAGER NAME</th>
								<th>DATE</th>
								<th>STATUS</th>
								<th>SIGN DATE</th>
								<th>Action</th>
							</tr>
								<%-- <c:url var="idt" value="idetail.do">
									<c:param name="iid" value="${ requestScope.inquiry.inquiryId }" />
									<c:param name="page" value="${ nowpage }" />
								</c:url> --%>
							<c:if test="${ !empty requestScope.list }">
							<c:forEach items="${ requestScope.list }" var="c">
								<tr>
									<!-- TITLE -->
									<td data-th="TITLE">${ c.caseTitle }</td>
									<!-- WRITER NAME -->
									<td data-th="WRITER NAME">${ c.caseWriterName }</td>
									<!-- TYPE -->
									<c:if test="${ c.caseType eq '1' }">
										<td data-th="TYPE">아이템 변경</td>
									</c:if>
									<c:if test="${ c.caseType eq '2' }">
										<td data-th="TYPE">아이템 삭제</td>
									</c:if>
									<c:if test="${ c.caseType eq '3' }">
										<td data-th="TYPE">아이템 환불</td>
									</c:if>
									<!-- MANAGER NAME -->
									<td data-th="MANAGER NAME">${ c.caseManagerName }</td>
									<!-- DATE -->
									<td data-th="DATE"><fmt:formatDate value="${ c.editDate }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<!-- STATUS -->
									<c:if test="${ c.caseStatus eq '0' }">
										<td data-th="STATUS"><span class="badge badge-pill badge-soft-warning font-size-12">처리필요</span></td>
									</c:if>
									<c:if test="${ c.caseStatus eq '1' }">
										<td data-th="STATUS"><span class="badge bg-success">처리완료</span></td>
									</c:if>
									<c:if test="${ c.caseStatus eq '2' }">
										<td data-th="STATUS"><span class="badge bg-danger">반려</span></td>
									</c:if>
									<!-- SIGN DATE -->
									<c:if test="${ !empty c.signDate }">
										<td data-th="SIGN DATE"><fmt:formatDate value="${ c.signDate }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</c:if>
									<c:if test="${ empty c.signDate }">
										<td data-th="SIGN DATE"></td>
									</c:if>
									<c:url var="cdetail" value="cdetail.do">
										<c:param name="caseId" value="${ c.caseId }"/>
										<c:param name="itemName" value="${ c.originalItemName }"/>
										<c:param name="itemName2" value="${ c.newItemName }"/>
									</c:url>
									<td data-th="Action"><a href="#" onclick="javascript:location.href='${cdetail}'" 
											class="btn btn-primary waves-effect waves-light">View Details</a></td>
								</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
							<c:if test="${ empty requestScope.list }">
								<p>현재 처리할 기안이 없습니다</p>
							</c:if>
					<br>
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

