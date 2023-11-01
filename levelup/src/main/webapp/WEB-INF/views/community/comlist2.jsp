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
		<div class="mb-3">
		<form class="form-control" action="comSearch.do">
		<div class="row">
		 <div class="col-4">
			<div class="form-floating">
	            	<input name="keyword" type="search" class="form-control" id="floatingInput" placeholder="검색할 키워드를 입력해 주세요" required="true">
	            	<label for="floatingInput">검색키워드(제목, 본문, 작성자) </label>
	       	</div>
	     </div>
	     <div class="col-2">
	     	<input name="page" type="hidden" value="${ currentPage }">
	     	            	<input type ="submit" class="btn btn-primary align-middle" value="검색">
	     </div>
		</div>
		</form>
			<div class="card">
				
		<div class="row pt-2">
			<div class="col-2 date ms-4">
					작성시간
			</div>
			<div class="col-4">
				<p text-align="center">제목</p>
				
			</div>
			<div class="col-3">
				<p text-align="center">작성자</p>
				
			</div>
			<div class="col-1">
				댓글
			</div>
			<div class="col-1">
				조회수
			</div>
		</div>
<c:forEach var="b" items="${ list }" >
		<div class="row border border-2 p-1">
			<div class="col-2 date ms-4">
					${ b.board_date }
			</div>
			<div class="col-4">
				<a href="comdetail.do?board_id=${ b.board_id }&page=${currentPage}" class="subject">${ b.board_title }
				</a>
			</div>
			<div class="col-3">
				${ b.department_name }/${ b.team_name }팀/${ b.rank_name }/ <b>${ b.employee_name }</b>
			</div>

			<div class="col-1">
				${ b.refYN }
			</div>
			<div class="col-1">
				${ b.read_count }
			</div>
		</div>
</c:forEach>
				<div class="row">
					<div class="col-2 p-3">
						<div class="btn-group me-2 mb-2 mb-sm-0">
							<button type="button" class="btn btn-primary waves-light waves-effect"
								onclick="javascript:location.href='movecomWrite.do'">
						<i class="bx bx-edit-alt"></i> 새 글 작성</button>
						</div>
					</div>
				</div>
					</div><!-- card -->

				</div> <!-- end Col-9 -->

			</div>

		</div>
		<!--  end row -->
	</div>

<!-- Modal -->
<div class="modal fade" id="composemodal" tabindex="-1" role="dialog" aria-labelledby="composemodalTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="composemodalTitle">New Message</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div>
					<div class="mb-3">
						<input type="email" class="form-control" placeholder="To">
					</div>

					<div class="mb-3">
						<input type="text" class="form-control" placeholder="Subject">
					</div>
					<div class="mb-3">
						<form method="post">
							<textarea id="email-editor" name="area"></textarea>
						</form>
					</div>

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Send <i
						class="fab fa-telegram-plane ms-1"></i></button>
			</div>
		</div>
	</div>
</div>
<!-- end modal -->


<c:import url="/WEB-INF/views/common/pagingView.jsp"/>

	 	<!-- container-fluid -->			
		</div>
	<!-- page-content -->		
	</div>
<!-- 푸터(자바스크립트 로딩) -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</div> <!-- main-content -->


        <script src="resources/libs/tinymce/tinymce.min.js"></script>

        <!-- email editor init -->
        <script src="resources/js/pages/email-editor.init.js"></script>


</body>
</html>

