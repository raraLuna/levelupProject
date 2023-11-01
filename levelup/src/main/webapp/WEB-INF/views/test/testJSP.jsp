<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp"/>
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp"/>

	<!-- Plugins css -->
	<link href="resources/libs/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css" />


</head>
<body data-sidebar="dark" data-layout-mode="light">
<!-- 내비게이션바, 사이드바 등등 -->
<c:import url="/WEB-INF/views/common/layout.jsp"/>

<div class="main-content">
	<div class="page-content">
		<div class="container-fluid">

<c:import url="/WEB-INF/views/common/page-title.jsp"/>

<!-- 여기서부터 내용 작성 -->

<!--  tiny mce 에디터 -->	
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">

				<h4 class="card-title">Tinymce wysihtml5</h4>
				<p class="card-title-desc">Bootstrap-wysihtml5 is a javascript
					plugin that makes it easy to create simple, beautiful wysiwyg editors
					with the help of wysihtml5 and Twitter Bootstrap.</p>

				<form method="post">
					<textarea id="elm1" name="area"></textarea>
				</form>

			</div>
		</div>
	</div> <!-- end col -->
</div>
<!--  end row -->


<!-- 파일 업로드  plugin -->
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">

				<h4 class="card-title">Dropzone</h4>
				<p class="card-title-desc">DropzoneJS is an open source library
					that provides drag’n’drop file uploads with image previews.
				</p>

				<div>
					<form action="#" class="dropzone">
						<div class="fallback">
							<input name="file" type="file" multiple="multiple">
						</div>
						<div class="dz-message needsclick">
							<div class="mb-3">
								<i class="display-4 text-muted bx bxs-cloud-upload"></i>
							</div>

							<h4>Drop files here or click to upload.</h4>
						</div>
					</form>
				</div>

				<div class="text-center mt-4">
					<button type="button" class="btn btn-primary waves-effect waves-light">Send
						Files</button>
				</div>
			</div>
		</div>
	</div> <!-- end col -->
</div>
<!--  end row -->




	 	<!-- container-fluid -->			
		</div>
	<!-- page-content -->		
	</div>
<!-- 푸터(자바스크립트 로딩) -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</div> <!-- main-content -->

		<!--tinymce js-->
        <script src="resources/libs/tinymce/tinymce.min.js"></script>

        <!-- init js -->
        <script src="resources/js/pages/form-editor.init.js"></script>


		<!-- 파일업로드 드롭존 -->
		<script src="resources/libs/dropzone/min/dropzone.min.js"></script>

</body>
</html>

