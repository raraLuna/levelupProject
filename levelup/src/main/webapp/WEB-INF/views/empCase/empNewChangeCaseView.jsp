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

.bg-light {
	background: #eef0f4;
}
/* 드랍다운 */
.item-select{
    width: 300px;
    height: 35px;
    background: #5a6fe6;
    border: none;
    border-radius: 5px;
    color: white;
	margin-bottom: 1rem;
}

.options{
	background: white;
	color: black;
}
</style>
<script type="text/javascript">
function golist(){
	location.href = "${pageContext.servletContext.contextPath}/csearchcharid.do?keyword=${ param.keyword }";
}

</script>
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
				<!-- 여기부터 내용 작성 -->

				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">

								<h1 class="card-title mb-5" align="center">아이템 변경 기안 작성</h1>

							 <form action="cinsert.do" class="outer-repeater" enctype="multipart/form-data" method="post">							 	
	                            <input type="hidden" name="caseWriterId" value="${ sessionScope.loginEmployee.employeeId }">
	                            <input type="hidden" name="caseWriterName" value="${ sessionScope.loginEmployee.employeeName }">
	                            <input type="hidden" name="caseManagerId" value="${ requestScope.manager.employeeId }">
	                            <input type="hidden" name="caseManagerName" value="${ requestScope.manager.employeeName }">                           
	                            
	                            <input type="hidden" name="caseType" value="1">
	                            <input type="hidden" name="charId" value="${ requestScope.character.charId }">
	                            <input type="hidden" name="accountId" value="${ requestScope.character.accountId }">
	                            <input type="hidden" name="charName" value="${ requestScope.character.name }">
	                            <input type="hidden" name="uniqueId" value="${ requestScope.itemdata.uniqueId }">
	                            
	                            <input type="hidden" name="originalItemId" value="${ requestScope.itemdata.nameId }">
	                            <c:if test="${ !empty requestScope.itemdata.itemName }">
		                            <input type="hidden" name="originalItemName" value="${ requestScope.itemdata.itemName }">
	                            </c:if>
	                            <c:if test="${ empty requestScope.itemdata.itemName }">
		                            <input type="hidden" name="originalItemName" value="아이템 ${ requestScope.itemdata.itemName }">
	                            </c:if>
	                            <input type="hidden" name="originalItemAmount" value="${ requestScope.itemdata.amount }">



									<!-- 기안 제목 -->
									<div class="form-group row mb-4">
										<label for="caseTitle" class="col-form-label col-lg-3" >기안 제목</label>
										<div class="col-lg-12">
											<input id="caseTitle" name="caseTitle" type="text"
												class="form-control" placeholder="기안 제목 입력하세요" required>
										</div>
									</div>

									
									<!-- 결재자 정보 -->									
									<label for="currentItems" class="col-form-label col-lg-3">결재자 정보</label>
									<div class="row">
										<!-- 관리자가 있는 경우 -->
										<c:if test="${ !empty sessionScope.loginEmployee.managerId }">
										<!-- 결재자 이름 -->
											<div class="mb-3 col-lg-2">											
													<label>결재자 이름</label>
													<input type="text" name="" id="disabledTextInput" class="form-control"
													placeholder="${ requestScope.manager.employeeName }" disabled>
											</div>
											<div class="mb-3 col-lg-3">
												<label>결재자 이메일</label><input type="text"
													id="disabledTextInput" class="form-control"
													placeholder="${ requestScope.manager.employeeEmail }"
													disabled>
											</div>
										</c:if>
										
										<!-- 관리자가 없는 경우(본인이 최종결재자인 경우) -->
										<c:if test="${ empty sessionScope.loginEmployee.managerId }">								
										
											<div class="mb-3 col-lg-3">	
												<input type="text" name="" id="disabledTextInput" class="form-control"
												placeholder="결재자 정보가 없습니다" disabled>
											</div>
										
										</c:if>
									</div>
									
									
									<!-- 유저 정보 -->
									<label for="currentItems" class="col-form-label col-lg-3">유저 정보</label>										
									<div class="row">
										<div class="mb-3 col-lg-2">											
												<label>계정 ID</label>
												<input type="text" name="" id="disabledTextInput" class="form-control"
												placeholder="${ requestScope.character.accountId }" disabled>
										</div>
										<div class="mb-3 col-lg-2">
											<label>캐릭터 ID</label><input type="text"
												id="disabledTextInput" class="form-control"
												placeholder="${ requestScope.character.charId }"
												disabled>
										</div>
										<div class="mb-3 col-lg-2">
											<label>캐릭터 이름</label><input type="text"
												id="disabledTextInput" class="form-control"
												placeholder="${ requestScope.character.name }"
												disabled>
										</div>
									</div>
									
									

									<!-- 현재  아이템 정보 -->

									<label for="currentItems" class="col-form-label col-lg-3">현재 아이템 정보</label>
									<div id="currentItems">
										<div class="row">
											<div class="mb-3 col-lg-2">ID</div>
											<div class="mb-3 col-lg-2">NAME</div>	
											<div class="mb-3 col-lg-2">UNIQUE ID</div>			
											<div class="mb-3 col-lg-2">AMOUNT</div>
										</div>

										<div class="row">

											<div class="mb-3 col-lg-2">
												
												<input type="text" id="disabledTextInput"
													class="form-control" placeholder="${ requestScope.itemdata.nameId }"
													disabled>
											</div>
											<div class="mb-3 col-lg-2">
												<c:if test="${ !empty requestScope.itemdata.itemName }">
													<input type="text" id="disabledTextInput"
														class="form-control" placeholder="${ requestScope.itemdata.itemName }"
														disabled>
												</c:if>
												<c:if test="${ empty requestScope.itemdata.itemName }">
													<input type="text" id="disabledTextInput"
														class="form-control" placeholder="아이템 ${ requestScope.itemdata.nameId }" disabled>
												</c:if>
											</div>	
											<div class="mb-3 col-lg-2">
												<input type="text" id="disabledTextInput" 
													class="form-control" placeholder="${ requestScope.itemdata.uniqueId }"
													disabled>
											</div>									
											
											<div class="mb-3 col-lg-2">
												<input type="text" id="disabledTextInput" 
													class="form-control" placeholder="${ requestScope.itemdata.amount }"
													disabled>
											</div>
										</div>

									</div>
									<!-- 변경할 아이템 선택 Drop Down-->

									<!-- TODO 오늘까지 한거 -->
									<!-- TODO 드랍다운 추가 -->
									<div>
										<label>변경 아이템 선택</label> <br>
										<select class="item-select" id="replacementitemselect" onchange="onReplacementItemSelectChange(this.options[this.selectedIndex]);">
											<c:forEach items="${ requestScope.ilist }" var="i">
												<option class="options" id="${ i.itemId }"
												data-nameId="${ i.itemId }"
												data-amount="${ i.amount }"
												data-uniqueId="${ i.uniqueId }"
												data-itemName="${ i.itemName }"
												data-itemType="${ i.itemType }"
												data-price="${ i.price }"
												data-gamePrice="${ i.gamePrice }">${ i.itemName }
												</option>
											</c:forEach>
										</select>

				
									</div>

									<!-- 드랍다운에서 아이템 선택 시 자동으로 채워지는 칸들 -->
									<div id="currentItems">
										<div class="row">
											<div class="mb-3 col-lg-2">ID</div>
											<div class="mb-3 col-lg-2">NAME</div>							
											<div class="mb-3 col-lg-2">AMOUNT</div>
										</div>

										<div class="row">
											<div class="mb-3 col-lg-2">
												<input type="text" id="replacementitemid" name="disabledReplaceItemId"
													class="form-control"
													disabled>
													<input type="hidden" id="hiddenInputReplaceItemId" name="newItemId">
											</div>
											<div class="mb-3 col-lg-2">
													<input type="text" id="replacementitemname" name="disabledReplaceItemName"
														class="form-control"
														disabled>
													<input type="hidden" id="hiddenInputReplaceItemName" name="newItemName">
											</div>											
											<div class="mb-3 col-lg-2">
												<input type="number" id="disabledTextInput" name="newItemAmount"
													class="form-control" required>
											</div>
										</div>
									</div>





									<!-- 기안 내용 -->
									<div class="d-flex">
										<div class="flex-grow-1 overflow-hidden">
											<label for="caseContent" class="col-form-label col-lg-3">기안 내용</label>
											<div class="col-lg-12">
												<textarea id="caseContent" name="caseContent"
													class="form-control" rows="3" cols="40"
													placeholder="기안 내용을 작성하세요" required></textarea>
											</div>
										</div>
									</div>
									<br>

									<!-- 파일 업로드 -->
									<label for="attatchFile" class="col-form-label col-lg-3">첨부 파일</label>
									<div class="mb-3" align="center">
										<!--  <i class="display-4 text-muted bx bxs-cloud-upload"></i><br> -->
										<input class="form-control" type="file" name="upfile">
									</div>

									<br>
									
									
									<!-- 작성 완료 -->
									
									<c:if test="${ !empty sessionScope.loginEmployee.managerId }">
										<div class="row justify-content-end" align="center">
											<div class="col-lg-12">
												<button type="button" class="btn btn-secondary waves-effect waves-light" onclick="golist();">목록으로</button>
												<button type="submit" class="btn btn-primary">작성 완료</button>
											</div>
										</div>
									</c:if>
									
									<c:if test="${ empty sessionScope.loginEmployee.managerId }">								
										<div class="row justify-content-end" align="center">
											<div class="col-lg-12">
												<button type="button" class="btn btn-secondary waves-effect waves-light" onclick="golist();">목록으로</button>
											</div>
										</div>
										
									</c:if>

								</form>



							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- container-fluid -->
		</div>
		<!-- page-content -->

		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- main-content -->


	<!--tinymce js-->
	<script src="resources/libs/tinymce/tinymce.min.js"></script>

	<!-- init js -->
	<script src="resources/js/pages/form-editor.init.js"></script>


	<!-- Plugins js -->
	<script src="resources/libs/dropzone/min/dropzone.min.js"></script>
	
	<script type="text/javascript">
		function onReplacementItemSelectChange(replacementItem){
			// Disabled Input Field (뷰 처리용) 아이템 이름이랑 아이디 띄우는 용도
			var replacementitemidinputfield = document.getElementById('replacementitemid');
			var replacementitemnameinputfield = document.getElementById('replacementitemname');
			// Hidden Input Field (컨트롤러로 New Item 정보 전송용) 
			var hiddenInputReplacementItemId = document.getElementById('hiddenInputReplaceItemId');
			var hiddenInputReplacementItemName = document.getElementById('hiddenInputReplaceItemName');
			
			replacementitemidinputfield.value = replacementItem.getAttribute("data-nameId");
			replacementitemnameinputfield.value = replacementItem.getAttribute("data-itemName");
			
			hiddenInputReplacementItemId.value = replacementItem.getAttribute("data-nameId");
			hiddenInputReplacementItemName.value = replacementItem.getAttribute("data-itemName");
		}
	</script>
</body>
</html>

