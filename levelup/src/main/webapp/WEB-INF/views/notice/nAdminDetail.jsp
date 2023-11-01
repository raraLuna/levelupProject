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
				

				<c:url var="nup" value="nmoveup.do">
					<c:param name="noticeId" value="${ notice.noticeId }" />
				</c:url>

				<c:url var="nd" value="ndelete.do">
					<c:param name="noticeId" value="${ notice.noticeId }" />
					<c:param name="rfile" value="${ notice.renameFilename }" />
				</c:url>

				<script type="text/javascript">
function moveUpdatePage(){	
	location.href = "${nup}";
}

function confirmDelete() {
    var confirmed = confirm("정말 삭제하시겠습니까?");
    if (confirmed) {
        // 사용자가 확인을 누르면 삭제 요청을 보냅니다.
        requestDelete();
    }
}

function requestDelete(){
	location.href = "${nd}";
}
</script>

<main class="mt-5 pt-5">
					<div class="container-fluid px-4">
						<h1 class="mt-4">공지사항 상세보기</h1>
						<div class="card mb-4">
							<div class="card-body">
								<form>
									<div class="mb-3 mt-3">
										<label for="bno" class="form-label">${notice.employeeName}
											<small class="text-muted"> <a
												href="mailto:${notice.employeeEmail}">${notice.employeeEmail}</a>
										</small><br>
										</label> <small class="text-muted">${notice.departmentName} /
											${notice.teamName}팀 / ${notice.rankName}</small>

									</div>

									<div class="mb-3">
										<label for="title" class="form-label">제목</label> <div class="form-control" id="text" name="text" disabled>${notice.noticeTitle}</div>
									</div>
									<div class="mb-3">
										<label for="writer" class="form-label">첨부파일</label>
										<div class="form-control" id="text" name="text" disabled>
											<div class="attachment">
												<c:if test="${!empty notice.attachementFilename}">
													<c:url var="nfd" value="nfdown.do">
														<c:param name="ofile"
															value="${notice.attachementFilename}" />
														<c:param name="rfile" value="${notice.renameFilename}" />
													</c:url>
													<a href="${nfd}">${notice.attachementFilename}</a>
												</c:if>
											</div>
										</div>
									</div>
									<div class="mb-3">
										<label for="title" class="form-label">내용</label>
										<div class="form-control" id="text" name="text" disabled>${notice.noticeContent}</div>
									</div>
									<div class="mb-3">
										<label for="regDate" class="form-label">작성일</label> <div class="form-control" id="text" name="text" disabled>${notice.editDate}</div>
									</div>
									
									조회수 : ${notice.readCount}
									

								</form>
								<div class="buttons">
								<button onclick="moveUpdatePage(); return false;">수정페이지로
											이동</button>
										<button onclick="confirmDelete(); return false;">삭제하기</button>
									<button
										onclick="javascript:window.location.href='<%=session.getAttribute("listPage")%>';">목록</button>
								</div>
							</div>
						</div>
					</div>
				</main>
				<!--  end row -->
			</div>



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


</body>
</html>

