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
									<button
										onclick="javascript:window.location.href='<%=session.getAttribute("listPage")%>';">목록</button>
								</div>
							</div>
						</div>
					</div>
				</main>
				
				<!--  end row -->
			</div>


			<!-- Modal -->
			<div class="modal fade" id="composemodal" tabindex="-1" role="dialog"
				aria-labelledby="composemodalTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="composemodalTitle">New Message</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
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
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">
								Send <i class="fab fa-telegram-plane ms-1"></i>
							</button>
						</div>
					</div>
				</div>
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


</body>
</html>

