<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="./resources/css/empListView.css">
<script type="text/javascript"
	src="/levelup/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

</script>
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp" />
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp" />
<script>
function validate(){

	var pwdValue = $('#employeePwd').val();
	var pwdValue2 = $('#employeePwd2').val();
	
	if(pwdValue !== pwdValue2){
		alert("암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
		document.getElementById("userpwd2").value = "";
		document.getElementById("userpwd").select();
		return false;
	}

	return true;
}
</script>
</head>
<body data-sidebar="dark" data-layout-mode="light">
	<!-- 내비게이션바, 사이드바 등등 -->
	<c:import url="/WEB-INF/views/common/layout.jsp" />

	<div class="main-content">
		<div class="page-content">
		
				<c:import url="/WEB-INF/views/common/page-title.jsp" />
				<div class="row"><br><br><br><br></div>
							<div class="row">
							<div class="col-3"></div>
							<div class="col-6 bg-white border border-3">
							<h4 class="pt-3">직원 등록란</h4>
				<!-- 여기서부터 내용 작성 -->
				<form action="empenroll.do" id="enrollForm" method="post" onsubmit="return validate();">
				    <label for="departmentId">부서 선택 :</label>
				    <select name="departmentId" id="departmentId">
				        <option value="none">부서를 선택하세요.</option>
				        <option value="dev">개발부</option>
				        <option value="marketing">영업부</option>
				        <option value="trade">무역부</option>
				        <option value="accounting">경리부</option>
				        <option value="none">미정</option>
				    </select>
				    <br>
				    <label for="teamId">팀 선택 :</label>
				    <select name="teamId" id="teamId">
				        <option value="none">팀을 선택하세요</option>
				        <option value="backend">백엔드</option>
				        <option value="webfront">프론트개발</option>
				        <option value="anddev">안드로이드개발</option>
				        <option value="iosdev">iOS개발</option>
				        <option value="cs">고객서비스</option>
				    </select>
				    <br><br>
				    <label for="employeeName">신규 사원 이름 : </label>
				    <input type="text" placeholder="enter name" name="employeeName" id="employeeName" required>
				    <br><br>
				    <label for="employeeEmail">이메일 : </label>
				    <input type="email" placeholder="enter email" name="employeeEmail" id="employeeEmails" required>
				    <br><br>
				    <label for="employeePwd">비밀번호 : </label>
				    <input type="password" name="employeePwd" id="employeePwd" required>
				    <br>
				    <label for="employeePwd2">비밀번호 확인 : </label>
				    <input type="password" name="employeePwd2" id="employeePwd2" required>
				    <br><br>
				    <label for="employeeAddress">주소 : </label>
				    <input type="text" name="employeeAddress" id="employeeAddress" placeholder="enter address" required>
				    <br><br>
				    <label for="employeePhone">번호 : </label>
				    <input type="tel" name="employeePhone" id="employeePhone" placeholder="enter phone" required>
				    <br><br>
				    <label for="employeeBirthdate">생일 : </label>
				    <input type="date" name="employeeBirthdate" id="employeeBirthdate" placeholder="enter birthday" required>
				    <input type="hidden" value="${ loginEmployee.employeeId }" id="managerId" name="managerId">
				    <br><br>
				    <button class="mb-4" type="submit">제출</button>
				</form>
				
				<script>
				function validate() {
				    var selectedDepartment = document.getElementById("departmentId").value;
				    var selectTeam = document.getElementById("teamId").value;
				    
				    if (selectedDepartment === "none") {
				        alert("부서를 선택하세요.");
				        return false; 
				    }else if(selectTeam === "none"){
				    	alert("팀을 선택하세요.");
				    	return false;
				    }
				    
				    
				    return true;
				}
				var testS = "${loginEmployee.employeeId }"
				console.log("testS : " + testS);
				var message = "${ requestScope.message }";
				if (message != null && message.length > 4) {
				    alert(message);
				}
				
				</script>
				<!-- container-fluid -->
				</div>
			<div class="col-3"></div>
			</div>
			<!-- page-content -->
		</div>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- main-content -->

</body>
</html>

