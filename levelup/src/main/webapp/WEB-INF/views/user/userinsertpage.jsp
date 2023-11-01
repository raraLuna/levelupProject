<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery-3.7.0.min.js"></script>
<title>user enroll Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- App favicon -->
<link rel="shortcut icon" href="resources/images/favicon.ico">

<!-- owl.carousel css -->
<link rel="stylesheet" href="resources/libs/owl.carousel/assets/owl.carousel.min.css">

<link rel="stylesheet" href="resources/libs/owl.carousel/assets/owl.theme.default.min.css">

<!-- Bootstrap Css -->
<link href="resources/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="resources/css/icons.min.css" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="resources/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function validate(){

	var pwdValue = $('#userpwd').val();
	var pwdValue2 = $('#userpwd2').val();
	
	if(pwdValue !== pwdValue2){
		alert("암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
		document.getElementById("userpwd2").value = "";
		document.getElementById("userpwd").select();
		return false;
	}

	return true;
}
function dupIDCheck(){
	
	$.ajax({
		url: "idchk.do",
		type: "post",
		data: { userid: $('#userId').val() },
		success: function(data){
			console.log("success : " + data);
			if(data == "ok"){
				alert("사용 가능한 아이디입니다.");
				$('#userpwd').focus();
			}else{
				alert("이미 사용중인 아이디입니다.");
				$('#userid').select();
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
	
	return false;  //버튼 클릭이벤트 취소 (submit 버튼에 클릭이벤트 전달을 막기 위함)
}
</script>
</head>
<style>
.uenrollbox{
	padding-top: 120px;
	padding-left: 40%;
	padding-right: 40%;
}
</style>
    <body class="auth-body-bg">
 		<div class="uenrollbox">
                                <div class="d-flex flex-column h-100">
                                    <div class="mb-4 mb-md-5">
                                        <a href="${ pageContext.servletContext.contextPath }/umain.do" class="d-block auth-logo">
                                            <img src="/levelup/resources/images/users/umainlogo.jpg" alt="" height="40">
                                            The ManaWorld
                                        </a>
                                    </div>
                                    <div class="my-auto">
                            		<p>enrollpage</p>
                                        <div class="mt-4">
                                            <form action="enroll.do" method="post">
                
                                                <div class="mb-3">
                                                    <label for="username" class="form-label">Username</label>
                                                    <input type="text" class="form-control" name="userId" id="userId" placeholder="Enter username" required>
                                                    <br>
                                                    <input type="button" value="id 중복체크" onclick="return dupIDCheck();">
                                                </div>
                        
                                                <div class="mb-3">
                                                    <div class="float-end">
                                                        <a href="auth-recoverpw-2.html" class="text-muted">Forgot password?</a>
                                                    </div>
                                                    <label class="form-label">암호</label>
                                                    <div class="input-group auth-pass-inputgroup">
                                                        <input type="password" name="userPass" class="form-control" placeholder="Enter password" aria-label="Password" aria-describedby="password-addon"  id="userpwd" required>
                                                        <button class="btn btn-light " type="button"><i class="mdi mdi-eye-outline"></i></button>
                                                    </div>
                                                    <label class="form-label">암호확인</label>
                                                    <div class="input-group auth-pass-inputgroup">
                                                        <input type="password" class="form-control" placeholder="Enter password repeat" aria-label="Password" aria-describedby="password-addon" id="userpwd2" required>
                                                        <button class="btn btn-light " type="button"><i class="mdi mdi-eye-outline"></i></button>
                                                    </div>
                                                </div>
                                                
                                                <label for="username" class="form-label">성별</label>
                                                <br>
												
												<input type="radio" name="sex" value="M"> 남자 &nbsp;
												<input type="radio" name="sex" value="F"> 여자
												<br><br>
												<label for="email" class="form-label">email</label>
                                                <input type="email" class="form-control" name="email" id="email" placeholder="Enter email" required>
                        						
                        						<br><br>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="remember-check">
                                                    <label class="form-check-label" for="remember-check">
                                                        Remember me
                                                    </label>
                                                </div>
                                                

                                                
                                                <div class="mt-3 d-grid">
                                                    <button class="btn btn-primary waves-effect waves-light" type="submit">회원가입</button>
                                                </div>
                    
                                                
                               

                                            </form>
                             
                                        </div>
                                    </div>
<div class="mt-4 mt-md-5 text-center">
    <p>&copy; 2023 team.gangnamstory</p>
</div>
<script src="resources/libs/jquery/jquery.min.js"></script>
<script src="resources/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="resources/libs/metismenu/metisMenu.min.js"></script>
<script src="resources/libs/simplebar/simplebar.min.js"></script>
<script src="resources/libs/node-waves/waves.min.js"></script>

<!-- owl.carousel js -->
<script src="resources/libs/owl.carousel/owl.carousel.min.js"></script>

<!-- auth-2-carousel init -->
<script src="resources/js/pages/auth-2-carousel.init.js"></script>

<!-- App js -->
<script src="resources/js/app.js"></script>
</body>
</html>