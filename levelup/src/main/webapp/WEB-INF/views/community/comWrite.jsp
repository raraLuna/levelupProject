<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:if test="${ empty loginEmployee }">
	<c:redirect url="eloginPage.do"/>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp"/>
<!-- 헤드 스크립트 -->

<c:import url="/WEB-INF/views/common/head-script.jsp"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css" crossorigin="anonymous">
<link href="resources/css/fileinput.css" rel="stylesheet">
<style>
.kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
    text-align: center;
}
.kv-avatar {
    display: inline-block;
}
.kv-avatar .file-input {
    display: table-cell;
}
.kv-reqd {
    color: red;
    font-family: monospace;
    font-weight: normal;
}
.dn {
            display: none; /* 요소 숨김 */
}
</style>

</head>
<body data-sidebar="dark" data-layout-mode="light">
<!-- 내비게이션바, 사이드바 등등 -->
<c:import url="/WEB-INF/views/common/layout.jsp"/>

<div class="main-content">
	<div class="page-content">
		<div class="container-fluid">

<c:import url="/WEB-INF/views/common/page-title.jsp"/>

<!-- 여기서부터 내용 작성 -->

<div class="row">
	<div class="col-12">
                            

<!-- Right Sidebar -->
<div class="mb-3">

    <div class="card">
       <div class="card-body">
            <div class="d-flex mb-4">
                <div class="flex-shrink-0 me-3">
                </div>
                <div class="flex-grow-1">
                    작성자: <b class="font-size-14 mt-1">${ loginEmployee.employeeName }</b> <small class="text-muted"><a href="mailto:${ loginEmployee.employeeEmail }">${ loginEmployee.employeeEmail }</a></small><br>

				<form id="upload-form" class="form" action="cominsert.do" method="POST" encType="multipart/form-data">
					<div class="row">
						<div class="col-12 mb-3">
							<div class="form-floating">
				            	<input name="board_title" type="text" class="form-control" id="floatingInput" placeholder="제목을 입력해 주세요" required="true">
				            	<label for="floatingInput">제목</label>
				          	</div>
				          		<input name="employee_id" value="${ loginEmployee.employeeId }" type="hidden">
				          		<input name="department_id" value="${ loginEmployee.departmentId }" type="hidden">
				          		<input name="team_id" value="${ loginEmployee.teamId }" type="hidden">
						</div>
					</div>
					<div class="row mb-2">
							<textarea name="board_body" id="elm1" class="col-12"></textarea>
					</div>
					<div class="row">
						<div class="kv-avatar col-12">
			                <div class="file-loading">
            			        <input id="upfiles" name="upfiles[]" type="file" multiple data-browse-on-zone-click="true">
                			</div>
            			</div>
  					</div>
  					<div class="btn-group col-3 mt-3">
						<input type="submit" class="btn btn-primary" value="작성">
						<input type="reset" class="btn btn-info" valuel="작성취소">
						<input type="button" value="목록" 
						onclick="javascript:location.href='comlist.do?page=1'; return false;" class="btn btn-light">
					</div>
                </div>
				</form>
            </div>
            
			</div>
        </div>

    </div>
</div>
<!-- card -->

</div>
<!-- end Col-12 -->

</div>
		<!--  end row -->
	</div>
	<!-- container-fluid -->
</div>
<!-- End Page-content -->



	 	<!-- container-fluid -->			
		</div>
	<!-- page-content -->		
	</div>
<!-- 푸터(자바스크립트 로딩) -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>

		<!--tinymce js-->
		<script src="resources/libs/tinymce/tinymce.min.js"></script>

		<!-- email editor init -->
		<script src="resources/js/pages/email-editor.init.js"></script>

        <!-- init js -->
        <script src="resources/js/pages/form-editor.init.js"></script>

	<script src="resources/js/fileinput/plugins/buffer.min.js" type="text/javascript"></script>
	<script src="resources/js/fileinput/plugins/filetype.min.js" type="text/javascript"></script>
	<script src="resources/js/fileinput/plugins/piexif.min.js" type="text/javascript"></script>
	<script src="resources/js/fileinput/plugins/sortable.min.js" type="text/javascript"></script>
	<script src="resources/js/fileinput/fileinput.js"></script>

	<script src="/fm/resources/js/fileinput/locales/kr.js"></script>



<script type="text/javascript">
$(function(){
	$("#upfiles").fileinput({
    showUpload: false,
	browseLabel: '파일 선택',
	removeLabel: '선택 리셋',
	removeTitle: '파일 업로드 창 리셋',
	elErrorContainer: '#kv-avatar-errors-1',
	msgErrorClass: 'alert alert-block alert-danger',
	layoutTemplates: {main2: '{preview} ' + ' {remove} {browse}'},
	}); //fileinput 
}); // document ready
</script>

</div> <!-- main-content -->

</body>
</html>

