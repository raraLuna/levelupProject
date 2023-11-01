<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery-3.7.0.min.js"></script>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/libs/owl.carousel/assets/owl.carousel.min.css">
<link rel="stylesheet" href="resources/libs/owl.carousel/assets/owl.theme.default.min.css">
<!-- Bootstrap Css -->
<link href="resources/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="resources/css/icons.min.css" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="resources/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function validate(event){
	var pwdValue = $('#rePwd').val();
	var pwdValue2 = $('#rePwd2').val();
	
	if (pwdValue !== pwdValue2) {
		alert("암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
		document.getElementById("rePwd2").value = "";
		document.getElementById("rePwd").select();
		event.preventDefault(); // 폼 전송 취소
	}
}

document.addEventListener("DOMContentLoaded", function() {
    document.querySelector("form").addEventListener("submit", validate);
});
</script>
</head>
<body>
<br><br><br><br><br><br>
<div class="container">
<form action="rePwd.do" method="post">
    <div class="mb-3">
        <label for="rePwd" class="form-label">비밀번호 재설정 : </label>
        <input type="password" class="form-control" name="rePwd" id="rePwd" placeholder="Enter PassWord" required>
        <br>
        <label for="rePwd" class="form-label">비밀번호 재입력 : </label>
        <input type="password" class="form-control" name="rePwd2" id="rePwd2" placeholder="ReEnter" required>
        <br>
        <input type="hidden" value="${ requestScope.email }" name="email">
        <button type="submit">재설정</button>
    </div>
</form>
<hr>
</div>
 <div class="mt-4 mt-md-5 text-center">
    <p>&copy; 2023 team.gangnamstory</p>
</div>
</body>
</html>