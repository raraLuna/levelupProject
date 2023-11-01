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

<div class="container-fluid">
<div class="row mb-3">
	<div class="col-12">
		<div>
		<form class="form-control" action="comSearch.do">
		<div class="row">

<!-- 
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
 -->

	     <div class="col-3">
							<button type="button" class="btn btn-primary waves-light waves-effect"
								onclick="javascript:location.href='movecomWrite.do'">
						<i class="bx bx-edit-alt"></i> 새 글 작성</button>
	     </div>
		</div>
		</form>
			
<div class="row row row-cols-1 row-cols-md-2 mt-3" data-masonry='{"percentPosition": true }'>
<c:forEach var="b" items="${ list }" >


<div class="container">
<div class="card gx-3 overflow-hidden">
	
  <div class="card-body">
    <h5 class="card-title fs-3">${ b.board_title }</h5>
    <div class="card-text overflow-auto fs-4">${ b.board_body }</div>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item text-end"><i class="fas fa-pen-nib fs-4 text-primary text-opacity-20"></i> ${ b.department_name }/${ b.team_name }팀/${ b.rank_name }/ <b class="fs-4 text-primary">${ b.employee_name }</b></li>
    <li class="list-group-item text-end"><i class="mdi mdi-clock-outline fs-4 text-primary text-opacity-20"></i> ${ b.board_date }  <i class="fas fa-eye fs-4 text-primary text-opacity-20"></i> ${ b.read_count }</li>

  </ul>
  <div class="card-body
  <c:if test="${ b.refYN == 'y' }">
text-bg-info
</c:if>
  ">
    <a href="comdetail.do?board_id=${ b.board_id }&page=${currentPage}" class="btn btn-primary">상세보기</a>
<c:if test="${ b.refYN == 'y' }">
	&nbsp;&nbsp;<i class="mdi mdi-message-plus-outline fs-1"></i>&nbsp;&nbsp;
</c:if>
<c:if test="${ !empty b.attachement_filename }">

<!-- <div class="dropdown"> -->
  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
    첨부 파일
  </a>

  <ul class="dropdown-menu" id="${ b.board_id }">
  </ul>
<!-- </div> -->
	
</c:if>
  
  </div>
</div>
</div>



</c:forEach>


					</div><!-- card -->

				</div> <!-- end Col-9 -->

			</div>

		</div>
		<!--  end row -->
	</div>

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

<c:forEach var="b" items="${ list }">
<c:if test="${ !empty b.attachement_filename }">
	
<script type="text/javascript">
$(function(){
	files${ b.board_id } = ${ b.attachement_filename };
	for(i in files${ b.board_id }){
		$('#${ b.board_id}').append('<li><a class="dropdown-item" href="resources/com_upfiles/${b.board_id}/' + files${ b.board_id }[i] + '">' + files${ b.board_id }[i] + '<a></li>');
	}    
	
});
</script>

</c:if>
</c:forEach>

	<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>

</body>
</html>

