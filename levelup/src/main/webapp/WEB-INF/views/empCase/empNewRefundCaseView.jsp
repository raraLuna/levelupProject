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
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp" />
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp" />
</head>
<style>
.table-responsive {
	overflow-y: auto;
	height: 200px;
}

.table-responsive thead th {
	position: sticky;
	top: 0px;
}

.bg-light {
	background: #eef0f4;
}
/* 드랍다운 */
.item-select{
    width: 300px;
    height: 35px;
    background: #5a6fe6;
    border: none;
    border-radius: 5px;
    color: white;
	margin-bottom: 1rem;
}

.options{
	background: white;
	color: black;
}
</style>
<script type="text/javascript">
function golist(){
	location.href = "${pageContext.servletContext.contextPath}/plist.do?page=${ param.page }";
}

</script>
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

				<h2 align="center"></h2>
				<br>
				<!-- 여기부터 내용 작성 -->

				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">

								<h1 class="card-title mb-5" align="center">아이템 환불 기안 작성</h1>

							 <form action="cinsert.do" class="outer-repeater" enctype="multipart/form-data" method="post">							 	
	                            <input type="hidden" name="caseWriterId" value="${ sessionScope.loginEmployee.employeeId }">
	                            <input type="hidden" name="caseWriterName" value="${ sessionScope.loginEmployee.employeeName }">
	                            <input type="hidden" name="caseManagerId" value="${ requestScope.manager.employeeId }">
	                            <input type="hidden" name="caseManagerName" value="${ requestScope.manager.employeeName }">                           
	                            <input type="hidden" name="caseType" value="3">
	                            <input type="hidden" name="charId" value="${ requestScope.character.charId }">
	                            <input type="hidden" name="accountId" value="${ requestScope.character.accountId }">
	                            <input type="hidden" name="charName" value="${ requestScope.character.name }">
	                            <input type="hidden" name="uniqueId" value="${ requestScope.rodexitem.uniqueId }">
	                            
	                            <input type="hidden" name="originalItemId" value="${ requestScope.rodexitem.nameId }">
								<input type="hidden" name="originalItemName" value="${ requestScope.iteminfo.itemName }">
	                           
	                            <input type="hidden" name="originalItemAmount" value="1">



									<!-- 기안 제목 -->
									<div class="form-group row mb-4">
										<label for="caseTitle" class="col-form-label col-lg-3" >기안 제목</label>
										<div class="col-lg-12">
											<input id="caseTitle" name="caseTitle" type="text"
												class="form-control" placeholder="기안 제목 입력하세요" required>
										</div>
									</div>
									
									<!-- 결재자 정보 -->									
									<label for="currentItems" class="col-form-label col-lg-3">결재자 정보</label>
									<div class="row">
										<!-- 관리자가 있는 경우 -->
										<c:if test="${ !empty sessionScope.loginEmployee.managerId }">
										<!-- 결재자 이름 -->
											<div class="mb-3 col-lg-2">											
													<label>결재자 이름</label>
													<input type="text" name="" id="disabledTextInput" class="form-control"
													placeholder="${ requestScope.manager.employeeName }" disabled>
											</div>
											<div class="mb-3 col-lg-3">
												<label>결재자 이메일</label><input type="text"
													id="disabledTextInput" class="form-control"
													placeholder="${ requestScope.manager.employeeEmail }"
													disabled>
											</div>
										</c:if>
										
										<!-- 관리자가 없는 경우(본인이 최종결재자인 경우) -->
										<c:if test="${ empty sessionScope.loginEmployee.managerId }">								
										
											<div class="mb-3 col-lg-3">	
												<input type="text" name="" id="disabledTextInput" class="form-control"
												placeholder="결재자 정보가 없습니다" disabled>
											</div>
										
										</c:if>
									</div>
									
									
									<!-- 유저 정보 -->
									<label for="currentItems" class="col-form-label col-lg-3">유저 정보</label>										
									<div class="row">
										<div class="mb-3 col-lg-2">											
												<label>계정 ID</label>
												<input type="text" name="" id="disabledTextInput" class="form-control"
												placeholder="${ requestScope.character.accountId }" disabled>
										</div>
										<div class="mb-3 col-lg-2">
											<label>캐릭터 ID</label><input type="text"
												id="disabledTextInput" class="form-control"
												placeholder="${ requestScope.character.charId }"
												disabled>
										</div>
										<div class="mb-3 col-lg-2">
											<label>캐릭터 이름</label><input type="text"
												id="disabledTextInput" class="form-control"
												placeholder="${ requestScope.character.name }"
												disabled>
										</div>
									</div>
									
									

									<!-- 구매한 아이템 정보 -->

									<label for="currentItems" class="col-form-label col-lg-3">구매한 아이템 정보</label>
									<div id="currentItems">
										<div class="row">
											<div class="mb-3 col-lg-2">아이템 ID</div>
											<div class="mb-3 col-lg-2">아이템 이름</div>	
											<div class="mb-3 col-lg-2">UNIQUE ID</div>			
											<div class="mb-3 col-lg-2">수량</div>
										</div>

										<div class="row">

											<div class="mb-3 col-lg-2">
													<input type="text" id="disabledTextInput"
													class="form-control" placeholder="${ requestScope.rodexitem.nameId }"
													disabled>
											</div>
											<div class="mb-3 col-lg-2">												
													<input type="text" id="disabledTextInput"
														class="form-control" placeholder="${ requestScope.iteminfo.itemName }"
														disabled>										
											</div>	
											<div class="mb-3 col-lg-2">
												<input type="text" id="disabledTextInput" 
													class="form-control" placeholder="${ requestScope.rodexitem.uniqueId }"
													disabled>
											</div>									
											
											<div class="mb-3 col-lg-2">
												<input type="text" id="disabledTextInput" 
													class="form-control" placeholder="${ requestScope.rodexitem.amount }"
													disabled>
											</div>
										</div>

									</div>
									
									
									
									<!-- 결제 정보 -->

									<label for="currentItems" class="col-form-label col-lg-3">결제 정보</label>
									<div id="currentItems">
										<div class="row">
											<div class="mb-3 col-lg-2">결제 ID</div>
											<div class="mb-3 col-lg-2">결제 금액</div>
											<div class="mb-3 col-lg-4">결제 KEY</div>
											<div class="mb-3 col-lg-2">결제 날짜</div>	
											<div class="mb-3 col-lg-2">결제 상태</div>																					
										</div>

										<div class="row">

											<div class="mb-3 col-lg-2">												
												<input type="text" id="disabledTextInput" 
													class="form-control" placeholder="${ requestScope.payment.paymentId }"
													disabled>
																							</div>
											<div class="mb-3 col-lg-2">												
												<input type="text" id="disabledTextInput" 
													class="form-control" placeholder="${ requestScope.payment.amount }"
													disabled>
												<input type="hidden" name="paymentAmount" value="${ requestScope.payment.amount }">
											</div>
											
											<div class="mb-3 col-lg-4">
												<input type="text" id="disabledTextInput"
													class="form-control" placeholder="${ requestScope.payment.paymentKey }"
													disabled>
												<input type="hidden" name="paymentKey" value="${ requestScope.payment.paymentKey }">
											</div>
											
											<div class="mb-3 col-lg-2">
												<input type="text" id="disabledTextInput" 
													class="form-control" placeholder="<fmt:formatDate value="${ requestScope.payment.paymentDate }" pattern="yyyy-MM-dd HH:mm:ss" />"
													disabled>
												<input type="hidden" name="paymentDate" value="${ requestScope.payment.paymentDate }" pattern="yyyy-MM-dd HH:mm:ss">
											</div>									
											
											<div class="mb-3 col-lg-2">
                                               <c:if test="${ requestScope.payment.paymentStatus eq 1 }" >
                                               		<input type="text" id="disabledTextInput" name="paymentStatus"
													class="form-control" placeholder="결제 완료" disabled>
													<input type="hidden" name="paymentStatus" value="1">
                                               </c:if>
                                               <c:if test="${ requestScope.payment.paymentStatus eq 2 }" >
                                               		<input type="text" id="disabledTextInput" name="paymentStatus"
													class="form-control" placeholder="환불 완료" disabled>
													<input type="hidden" name="paymentStatus" value="2">
                                               </c:if>
                                                <c:if test="${ requestScope.payment.paymentStatus eq 3 }" >
                                               		<input type="text" id="disabledTextInput" name="paymentStatus"
													class="form-control" placeholder="결제 대기" disabled>
													<input type="hidden" name="paymentStatus" value="3">
                                               </c:if>
											</div>
										</div>

									</div>
									
									
									


									<!-- 기안 내용 -->
									<div class="d-flex">
										<div class="flex-grow-1 overflow-hidden">
											<label for="caseContent" class="col-form-label col-lg-3">기안 내용</label>
											<div class="col-lg-12">
												<div class="mb-3 col-lg-2">
												
												<select class="form-select" name="refundCause" required>
                                                    <option selected disabled>환불 사유</option>
                                                    <option>게임 오류로 인한 아이템 수령불가</option>
                                                    <option>구매한 것과 다른 아이템이 발송됨</option>
                                                    <option>이벤트/할인 등이 적용되지 않음</option>
                                                    <option>서버오류로 인한 잘못된 구매</option>
                                                    <option>해킹으로 인한 구매</option>
                                                    <option>그 외</option>
                                                </select>
																							
												</div>
												<textarea id="caseContent" name="caseContent"
													class="form-control" rows="3" cols="40"
													placeholder="기안 내용을 작성하세요" required></textarea>
											</div>
										</div>
									</div>
									<br>

									<!-- 파일 업로드 -->
									<label for="attatchFile" class="col-form-label col-lg-3">첨부 파일</label>
									<div class="mb-3" align="center">
										<!--  <i class="display-4 text-muted bx bxs-cloud-upload"></i><br> -->
										<input class="form-control" type="file" name="upfile">
									</div>

									<br>
									
									
									<!-- 작성 완료 -->
									
									<c:if test="${ !empty sessionScope.loginEmployee.managerId }">
										<div class="row justify-content-end" align="center">
											<div class="col-lg-12">
												<button type="button" class="btn btn-secondary waves-effect waves-light" onclick="golist();">목록으로</button>
												<c:if test="${ requestScope.payment.paymentStatus eq 1 }" >
												<button type="submit" class="btn btn-primary">작성 완료</button>
												</c:if>
												<c:if test="${ requestScope.payment.paymentStatus eq 2 || requestScope.payment.paymentStatus eq 3 }" >
												 &nbsp;
												</c:if>
											</div>
										</div>
									</c:if>
									
									<c:if test="${ empty sessionScope.loginEmployee.managerId }">								
										<div class="row justify-content-end" align="center">
											<div class="col-lg-12">
												<button type="button" class="btn btn-secondary waves-effect waves-light" onclick="golist();">목록으로</button>
											</div>
										</div>
										
									</c:if>

								</form>



							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- container-fluid -->
		</div>
		<!-- page-content -->

		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- main-content -->


	<!--tinymce js-->
	<script src="resources/libs/tinymce/tinymce.min.js"></script>

	<!-- init js -->
	<script src="resources/js/pages/form-editor.init.js"></script>


	<!-- Plugins js -->
	<script src="resources/libs/dropzone/min/dropzone.min.js"></script>

</body>
</html>

