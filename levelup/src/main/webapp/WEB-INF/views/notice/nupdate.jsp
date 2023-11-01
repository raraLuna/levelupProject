<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
			<div class="container-fluid">

				<c:import url="/WEB-INF/views/common/page-title.jsp" />

				<!-- 여기서부터 내용 작성 -->
				<h1 align="left">공지글 수정 페이지</h1>
<br>
<form action="nupdate.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" value="${ sessionScope.loginEmployee.teamId }" name="teamId">
					<input type="hidden" value="${ sessionScope.loginEmployee.departmentId }" name="departmentId">
					<input type="hidden" name="noticeId" value="${ notice.noticeId }">	
					<input type="hidden" name="attachementFilename" value="${notice.attachementFilename }">
					<input type="hidden" name="renameFilename" value="${notice.renameFilename }">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">

									<h4 class="card-title">
										<tr>
											<th>제 목</th>
											<td><input type="text" name="noticeTitle" size="50" value="${ notice.noticeTitle }"></td>
										</tr>
										
									</h4>
									<p class="card-title-desc">
									<tr>
										<th>작성자</th>
											<td> : ${ sessionScope.loginEmployee.employeeName }
											<input type="hidden" name="employeeId" readonly value="${ sessionScope.loginEmployee.employeeId }"></td></tr>
									<tr>
									<br>
											<th>첨부파일 : </th>
											<td><%-- <% if(notice.getattachementFilename() != null){ %> --%>
									   		<c:if test="${ !empty notice.attachementFilename }">
												${notice.attachementFilename } &nbsp; 
												<input type="checkbox" name="deleteFlag" value="yes"> 
												파일삭제 <br>
												변경 : <input type="file" name="upfile">
											</c:if>
											<%-- <% }else{ %> --%>
											<c:if test="${ empty notice.attachementFilename }">
												첨부된 파일 없음 <br>
												추가 : <input type="file" name="upfile">	
											</c:if></td>
										</tr>
									</p>
									
									<textarea id="elm1" name="noticeContent"
										class="form-control" rows="25" >${ notice.noticeContent }</textarea>

									<tr>
										<th colspan="2"><input type="submit" value="수정하기">
											&nbsp; <input type="reset" value="작성취소"> &nbsp; 
											<input type="button" value="이전페이지로 이동" onclick="javascript:history.go(-1); return false;"> &nbsp;
											<input type="button" value="목록" 
    										onclick="javascript:window.location.href='<%= session.getAttribute("listPage") %>';"></th>
											
											<br>
									</tr>
								</div>
							</div>
						</div>
						<!-- end col -->
					</div>
					<!--  end row -->
			</div>
			</form>
			</div>
			<!-- end modal -->


			<!-- container-fluid -->
		</div>
		<!-- page-content -->
	</div>
	<!-- 푸터(자바스크립트 로딩) -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- main-content -->


	<script src="resources/libs/tinymce/tinymce.min.js"></script>

	<!-- email editor init -->
	<script src="resources/js/pages/email-editor.init.js"></script>
	
    <!-- init js -->
    <script src="resources/js/pages/form-editor.init.js"></script>


</body>
</html>

