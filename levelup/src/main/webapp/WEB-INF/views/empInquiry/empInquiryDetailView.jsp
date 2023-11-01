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

<c:url var="ansfix" value="ansfixview.do">
	<c:param name="employeeId" value="${ sessionScope.loginEmployee.employeeId }" />
	<c:param name="employeeName" value="${ sessionScope.loginEmployee.employeeName }" />
	<c:param name="inquiryId" value="${ param.iid }" />
	<c:param name="userId" value="${ param.userId }" />
	<c:param name="page" value="${ param.page }" />	
</c:url>
<script type="text/javascript">

function golist(){
	location.href = "${pageContext.servletContext.contextPath}/ilist.do?page=${ param.page }";
}

function moveAnsFixPage(){
	location.href = "${ ansfix }";
}

</script>

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
</style>
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

				<div class="row">
				<!-- 여기서부터 내용 작성 -->
				<!-- 문의 분류,  문의제목 , 유저ID, 문의 날짜,-->
				<!-- 문의 내용 -->

				<div class="col-lg-8">
					<div class="card">
						<div class="card-body">
							<div class="d-flex">
								<div class="flex-grow-1 overflow-hidden">
									<h5 class="text-truncate font-size-15">문의 제목 : ${ requestScope.inquiry.inquiryTitle }</h5>
									<p class="text-muted">문의 ID : ${ requestScope.inquiry.inquiryId }</p>
								</div>
							</div>
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
					</div>
				</div>


				<!-- 이전 문의 내역 -->
				
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title mb-4">이전 문의 내역</h4>

							<div class="table-responsive">
							<c:if test="${ empty requestScope.list }"></c:if>
								<table class="table align-middle table-nowrap">
									<tbody>
																				
										<c:forEach items="${ requestScope.list }" var="i">
											<tr>
									
												<td><h5 class="font-size-14 m-0">
														<a href="/levelup/idetail.do?iid=${ i.inquiryId }&page=${ param.page }&userId=${ i.userId }" class="text-dark">${ i.inquiryTitle }</a>
													</h5></td>
												<td data-th="Date"><fmt:formatDate value="${ i.editDate }" pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				</div> <!-- row -->

				
				
				<div class="row">
				
				<!--  답변 내용  -->
				<c:if test="${ requestScope.inquiry.answerStatus == 'Y' }">
				<div class="col-lg-8">
					<div class="card">
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
								<div class="col-sm-4 col-6">
									<button type="button" class="btn btn-primary" onclick="moveAnsFixPage();">수정하기</button> &nbsp;
									<button type="button" class="btn btn-primary" onclick="golist();">목록으로</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:if>


				<c:if test="${ requestScope.inquiry.answerStatus == 'N' }">
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body">	
						<form action="iupdate.do" method="post">
							<input type="hidden" name="employeeId" value="${ sessionScope.loginEmployee.employeeId }">
							<input type="hidden" name="employeeName" value="${ sessionScope.loginEmployee.employeeName }">
							<input type="hidden" name="inquiryId" value="${ param.iid }"> 
							<input type="hidden" name="userId" value="${ param.userId }">
							<input type="hidden" name="page" value="${ param.page }">
							<div class="d-flex">
								<div class="flex-grow-1 overflow-hidden">
									<h5 class="text-truncate font-size-15"> 답변 내용 : </h5>
									<div class="mb-3">
                                           <textarea id="formmessage" name="answerContent" class="form-control" rows="3" placeholder="답변을 달아주세요" required></textarea>
                                           
                                       </div>
								</div>
							</div>				
							<div class="row task-dates">
								<div class="col-sm-4 col-6">
									<button type="submit" class="btn btn-primary" >답변작성</button> &nbsp;
									<button type="button" class="btn btn-primary" onclick="golist();">목록으로</button>
								</div>
							</div>
							</form>
							</div>
						</div>
					</div>				
				</c:if>
				
				
				<!--  첨부 파일 목록 -->
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title mb-4">첨부 파일 목록</h4>
							<div class="table-responsive">
								<table class="table table-nowrap align-middle table-hover mb-0">
									<tbody>
										<tr>
											<c:if test="${ !empty requestScope.inquiry.attachmentFileName }">
												<c:url var="idown" value="ifdown.do">													
													<c:param name="file" value="${ requestScope.inquiry.attachmentFileName }" />												
												</c:url>
											<td>
												<h5 class="font-size-14 mb-1">
													<a href="${ idown }" class="text-dark">${ requestScope.inquiry.attachmentFileName }</a>
												</h5>
											</td>
											<td>
												<div class="text-center">
													<a href="${ idown }" class="text-dark"><i
														class="bx bx-download h3 m-0"></i></a>
												</div>
											</td>
											</c:if>
											<c:if test="${ empty requestScope.inquiry.attachmentFileName }">
											첨부파일 없음
											</c:if>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				
				</div> <!-- row -->
				
				
				
				

	
			</div>
			<!-- container-fluid -->
		</div>
		<!-- page-content -->

	<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- main-content -->
	
</body>
</html>

