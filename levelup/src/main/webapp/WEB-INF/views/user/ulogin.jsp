<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">


        <title>The Mana World User login</title>
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
		var message = "${ requestScope.message }";
		if (message != null && message === "success") {
		    alert("회원가입 성공");
		}else if(message != null && message === "success2"){
			alert("비밀번호가 재설정되었습니다.");
		}
		
	</script>
    </head>
<style>
.uloginbox{
	padding-top: 190px;
	padding-left: 40%;
	padding-right: 40%;
}
</style>
    <body class="auth-body-bg">
 		<div class="uloginbox">
                                <div class="d-flex flex-column h-100">
                                    <div class="mb-4 mb-md-5">
                                        <a href="${ pageContext.servletContext.contextPath }/umain.do" class="d-block auth-logo">
                                            <img src="/levelup/resources/images/users/umainlogo.jpg" alt="" height="40">
                                            The ManaWorld
                                        </a>
                                    </div>
                                    <div class="my-auto">
                            
                                        <div class="mt-4">
                                            <form action="login.do" method="post">
                								<div class="mb-3">
												    <label for="username" class="form-label">Username</label>
												    <input type="text" class="form-control" name="userId" id="username" placeholder="Enter username" value="${not empty requestScope.useridpass ? requestScope.useridpass : ''}">
												</div>
                        
                                                <div class="mb-3">
                                                    <div class="float-end">
                                                        <a href="${ pageContext.servletContext.contextPath }/searchPwd.do"  class="text-muted">Forgot password?</a>
                                                    </div>
                                                    <label class="form-label">Password</label>
                                                    <div class="input-group auth-pass-inputgroup">
                                                        <input type="password" name="userPass" class="form-control" placeholder="Enter password" aria-label="Password" aria-describedby="password-addon">
                                                        <button class="btn btn-light " type="button" id="password-addon"><i class="mdi mdi-eye-outline"></i></button>
                                                    </div>
                                                </div>
                        
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="remember-check">
                                                    <label class="form-check-label" for="remember-check">
                                                        Remember me
                                                    </label>
                                                </div>
                                                
                                                <div class="mt-3 d-grid">
                                                    <button class="btn btn-primary waves-effect waves-light" type="submit">Log In</button>
                                                </div>
                    
                                                
                               

                                            </form>
                                            <div class="mt-5 text-center">
                                                <p>계정이 없으신가요? <a href="${ pageContext.servletContext.contextPath }/userinsertpage.do" class="fw-medium text-primary"> Signup now </a> </p>
                                                <p>비밀번호 찾기 | <a href="${ pageContext.servletContext.contextPath }/searchPwd.do" class="fw-medium text-primary"> find password </a> </p>
                                            </div>
                                            <div class="mt-5 text-center">
                                                
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-4 mt-md-5 text-center">
                                        <p>&copy; 2023 team.gangnamstory</p>
                                    </div>
                                </div>
                        </div>

        <!-- JAVASCRIPT -->
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
