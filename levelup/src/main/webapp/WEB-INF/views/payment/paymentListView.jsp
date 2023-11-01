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
<script type="text/javascript"
	src="/levelup/resources/js/jquery-3.7.0.min.js"></script>
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
					<form action="psearch.do">
						<div class="container">
							<div class="inputs">
								<input type="radio" name="action" value="paymentId"
									onclick="showSearchBox();"><label>Payment Id</label> <input
									type="radio" name="action" value="date"
									onclick="showDateBox();"><label>Date</label> <input
									type="radio" name="action" value="paymentstatus"
									onclick="showTypeDropdown(); "><label>Status</label>
								<div class="dateboxContainer">
									<input type="date" class="searchDateInput" name="begin">
									~ <input type="date" class="searchDateInput" name="end">
								</div>
								<div class="typeDropdownContainer">
									<select id="searchByTypeSelect" name="paymentstatus">
										<option value="0">상태구분</option>
										<option value="1">결제완료</option>
										<option value="2">환불</option>
										<option value="3">결제대기</option>
									</select>
								</div>
								<input id="keywordInputbox" type="search" name="keyword">
								<input id="searchSubmitButton" type="submit" value="SEARCH">
								<input type="button"
									onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/plist.do?page=${ nowpage }'"
									value="RESET">
							</div>
						</div>
					</form>
					<!-- 문의 테이블 -->
					<table class="rwd-table">
						<tbody>
							<tr>
								<th>Payment ID</th>
								<th>Char Id</th>
								<th>Char Name</th>
								<th>Account Id</th>
								<th>Status</th>
								<th>Payment Date</th>
								<th>Refund Date</th>
								<th>Refund Cause</th>
								<th>Action</th>
							</tr>
							<%-- <c:url var="idt" value="idetail.do">
									<c:param name="iid" value="${ requestScope.inquiry.inquiryId }" />
									<c:param name="page" value="${ nowpage }" />
								</c:url> --%>
							<c:if test="${ !empty requestScope.list }">
								<c:forEach items="${ requestScope.list }" var="p">
									<tr>
										<!-- Payment ID -->
										<td data-th="Payment ID">${ p.paymentId }</a></td>
										<!-- Char Id -->
										<td data-th="Char Id">${ p.charId }</td>
										<!-- Char Name -->
										<td data-th="Char Name">${ p.charName }</td>
										<!-- Account Id -->
										<td data-th="Account Id">${ p.accountId }</td>
										<!-- Status -->
										<c:if test="${ p.paymentStatus eq '1' }">
											<td data-th="Status"><span class="badge bg-success">결제완료</span></td>
										</c:if>
										<c:if test="${ p.paymentStatus eq '2' }">
											<td data-th="Status"><span class="badge bg-danger">환불</span></td>
										</c:if>
										<c:if test="${ p.paymentStatus eq '3' }">
											<td data-th="Status"><span
												class="badge badge-pill badge-soft-warning font-size-12">결제 대기</span></td>
										</c:if>
										<!-- Payment Date -->
										<td data-th="Payment Date"><fmt:formatDate
												value="${ p.paymentDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										
										<!-- Refund Date -->
										<td data-th="Refund Date"><fmt:formatDate
												value="${ p.refundDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<!-- Refund Cause -->
										<c:if test="${ !empty p.refundCause }">
											<td data-th="Refund Cause">${ p.refundCause }</td>
										</c:if>
										<c:if test="${ empty p.refundCause }">
											<td data-th="Refund Cause">해당없음</td>
										</c:if>
										<c:if test="${ p.paymentStatus eq '1' || p.paymentStatus eq '3' }">
											<c:url var="cwrite" value="rfcaseform.do">
													<c:param name="paymentId" value="${ p.paymentId }"/>
													<c:param name="charId" value="${ p.charId }"/>
													<c:param name="itemId" value="${ p.itemId }"/>
													<c:param name="uniqueId" value="${ p.uniqueId }"/>
													<c:param name="paymentKey" value="${ p.paymentKey }"/>
													<c:param name="page" value="${ nowpage }"/>
													<c:param name="employeeId" value="${ sessionScope.loginEmployee.employeeId }"/>
													<c:param name="managerId" value="${ sessionScope.loginEmployee.managerId }"/>
											</c:url>
											<!-- 환불기안버튼 -->
											<td data-th="기안작성"><a href="#"
												onclick="javascript:location.href='${cwrite}&caseType=3'"
												class="btn btn-primary waves-effect waves-light">환불 기안</a></td>	
										</c:if>	
										<c:if test="${ p.paymentStatus eq '2' }">	
											<td data-th="기안작성"><a href="#" onclick="alreadyrefund();"												
												class="btn btn-secondary waves-effect waves-light">환불 완료</a></td>
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
	<script type="text/javascript">
	
	</script>
	
	<script type="text/javascript">
		function cancelPayment(paymentKey){
			/* form */
			let f = document.createElement('form');
			
			
			/* paymentKey hidden input */
			let paymentKeyHiddenInput = document.createElement('input');
			paymentKeyHiddenInput.setAttribute('type', 'hidden');
			paymentKeyHiddenInput.setAttribute('name', 'paymentKey');
			paymentKeyHiddenInput.setAttribute('value', paymentKey);
			
		    /* cancel reason hidden input */
			let cancelReasonHiddenInput = document.createElement('input');
			cancelReasonHiddenInput.setAttribute('type', 'hidden');
			cancelReasonHiddenInput.setAttribute('name', 'cancelReason');
			cancelReasonHiddenInput.setAttribute('value', '테스트 환불');
		    
			/* nowpage hidden input */
			let nowpageHiddenInput = document.createElement('input');
			nowpageHiddenInput.setAttribute('type', 'hidden');
			nowpageHiddenInput.setAttribute('name', 'page');
			nowpageHiddenInput.setAttribute('value', '${ nowpage }');
			
		    f.appendChild(paymentKeyHiddenInput);
		    f.appendChild(cancelReasonHiddenInput);
		    f.appendChild(nowpageHiddenInput);
			
		    f.setAttribute('method', 'post');
			f.setAttribute('action', 'pcancel.do');
			
			console.log(paymentKeyHiddenInput.value);
			console.log(cancelReasonHiddenInput.value);
			console.log(nowpageHiddenInput.value);
			
			document.body.appendChild(f);
			f.submit();
		}
		
		
		function alreadyrefund(){
			alert("이미 환불이 된 결제내역 입니다");
		}
	</script>	
</body>
</html>

