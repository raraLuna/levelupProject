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
</head>
<body>
<br><br><br><br><br><br>
<div class="container">
<form action="sendMail.do" method="post">
    <div class="mb-3">
        <label for="userEmail" class="form-label">userEmail : </label>
        <input type="email" class="form-control" name="email" id="email" placeholder="Enter userEmail">
        <br>
        <button type="submit">전송하기</button>
    </div>
    <p>이메일이 도착하지 않았나요? <a href="#" id="resendLink">-다시 전송하기</a></p>
</form>

<script>
    document.getElementById("resendLink").addEventListener("click", function(event) {
        event.preventDefault();
        document.querySelector("form").submit();
    });
</script>
<hr>
<form action="checkCode.do" method="post">
        <div class="mb-3">
            <label for="code" class="form-label">code : </label>
            <input type="text" class="form-control" name="code" id="code" placeholder="Enter code">
            <!-- Hidden input field for storing the email value -->
            <input type="hidden" name="email" id="emailHidden" value="">
            <br>
            <button type="submit" id="checkCodeButton">코드확인</button>
        </div>
</form>
</div>

<script>
    document.getElementById("checkCodeButton").addEventListener("click", function() {
        document.getElementById("emailHidden").value = document.getElementById("email").value;
    });
    
    var codeInput = document.getElementById("code");

	 document.getElementById("checkCodeButton").addEventListener("click", function() {
     var codeValue = codeInput.value;

     if (isNaN(codeValue)) {
         alert("숫자만 입력해주세요.");
         event.preventDefault();
     }
 });
</script>








 <div class="mt-4 mt-md-5 text-center">
    <p>&copy; 2023 team.gangnamstory</p>
</div>
<script>
  var successValue = '<%= request.getAttribute("success") %>';
  var emailInput = document.getElementById("email");

  if (successValue !== null && successValue !== 'null') {
    emailInput.value = successValue;
  } else {
    emailInput.placeholder = "Enter code";
  }
  
  
  var message = '<%= request.getAttribute("message") %>';

  if (message === "error") {
    alert("코드를 다시 입력하세요.");
  }else if(message === "error2"){
	  alert("등록된 이메일이 아닙니다.");
  }else if(message === "sendsuccess"){
	  alert("메일이 전송되었습니다.");
  }
  
</script>
</body>
</html>