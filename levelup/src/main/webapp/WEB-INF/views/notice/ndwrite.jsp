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
				<h1 align="left">새 부서 공지글 등록 페이지</h1>
				
				
				<form action="ninsert.do" method="post"
					enctype="multipart/form-data">
					
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
    <h4 class="card-title">
        <tr>
            <th>제 목</th>
            <td><input type="text" name="noticeTitle" size="50"></td>
        </tr>
    </h4>
    <p class="card-title-desc">
        <tr>
            <th>작성자</th>
            <td><input type="text" name="employeeId" readonly value="${sessionScope.loginEmployee.employeeName}"></td>
        </tr>
        <tr>
            <th>부서 선택</th>
            <td>
                <select name="departmentId">
                    <option value="dev">개발부</option>
                    <option value="marketing">영업부</option>
                    <option value="trade">무역부</option>
                    <option value="accounting">경리부</option>
                    <option value="none">미정</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>팀 선택</th>
            <td>
                <select name="teamId">
                    <option value="backend">백엔드</option>
                    <option value="webfront">프론트개발</option>
                    <option value="anddev">안드로이드개발</option>
                    <option value="iosdev">iOS개발</option>
                    <option value="cs">고객서비스</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td><input type="file" name="ofile"></td>
        </tr>
    </p>
    <textarea id="elm1" name="noticeContent" class="form-control" rows="25" placeholder="Enter Your Message"></textarea>
    <tr>
        <th colspan="2"><input type="submit" value="등록하기"> &nbsp; <input type="button" value="목록" onclick="javascript:window.location.href='<%= session.getAttribute("listPage") %>';"></th>
    </tr>
</div>

							</div>
						</div>
						<!-- end col -->
					</div>
					<!--  end row -->
			</div>
			</form>
			


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
	
<!--tinymce js-->
        <script src="resources/libs/tinymce/tinymce.min.js"></script>

        <!-- init js -->
        <script src="resources/js/pages/form-editor.init.js"></script>

</body>
</html>

