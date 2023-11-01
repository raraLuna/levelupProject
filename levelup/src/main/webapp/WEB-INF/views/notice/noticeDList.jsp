<%@page import="com.gs.levelup.employee.model.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="currentLimit" value="${ requestScope.limit }" />
<c:set var="nowpage" value="1" />
<c:if test="${ !empty requestScope.currentPage }">
	<c:set var="nowpage" value="${ requestScope.currentPage }" />
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp" />
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp" />

</head>
<body data-sidebar="dark" data-layout-mode="light">
	<!-- 내비게이션바, 사이드바 등등 -->
	<c:import url="/WEB-INF/views/common/layout.jsp" />

	<div class="main-content">
		<div class="page-content">

			<c:import url="/WEB-INF/views/common/page-title.jsp" />
			<!-- 여기서부터 내용 작성 -->
			<h1 class="mt-4">부서 공지사항</h1>


			<main class="mt-5 pt-5">
				<div class="container-fluid px-4">

					<div class="card mb-4">
						<div class="card-header">
							<div class="btn-group float-end">
									<c:if
										test="${loginEmployee.rankId eq 'sman' || loginEmployee.rankId eq 'jdirec' || loginEmployee.rankId eq 'direc' || loginEmployee.rankId eq 'ceo'}">
										<button
											onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/ndwrite.do';">공지글
											등록</button>
									</c:if>
								</div>
						</div>
						<div class="card-body">
							<table class="table table-hover table-striped">
								<%-- 제목 검색 폼 --%>
								<form id="titleform" class="sform" action="nsearchTitle.do"
									method="get">
									<input type="hidden" name="action" value="title"> <input
										type="hidden" name="limit" value="${currentLimit}"> <input
										type="hidden" name="teamId" value="${teamId}"> <input
										type="hidden" name="departmentId" value="${departmentId}">
									<fieldset>
										<label for="keyword">제목 검색</label> <input type="search"
											id="keyword" name="keyword" size="50"> <input
											type="submit" value="검색">
									</fieldset>
								</form>
								<thead>
									<tr>
										<th>공지 제목</th>
										<th>부서명</th>
										<th>팀명</th>
										<th>작성자</th>
										<th>직급</th>
										<th>조회수</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.dlist}" var="n" varStatus="loop">
										<tr>
											<td><a
												href="${pageContext.servletContext.contextPath}/ndetail.do?noticeId=${n.noticeId}"
												class="subject">${n.noticeTitle}</a></td>
											<td>${n.departmentName}</td>												
											<td>${n.teamId}</td>
											<td>${n.employeeName}</td>
											<td>${n.rankName}</td>
											<td>${n.readCount}</td>
											<td>${n.editDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			
			<div class="col-10">

								<c:import url="/WEB-INF/views/common/pagingView.jsp" />
			</div>
			<!--  end row -->
		</div>



		<!-- container-fluid -->
		<!-- page-content -->
	</div>
	<!-- 푸터(자바스크립트 로딩) -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<!-- main-content -->


	<script src="resources/libs/tinymce/tinymce.min.js"></script>

	<!-- email editor init -->
	<script src="resources/js/pages/email-editor.init.js"></script>
	<%-- 페이징 처리 뷰 포함 처리 --%>



</body>
</html>

