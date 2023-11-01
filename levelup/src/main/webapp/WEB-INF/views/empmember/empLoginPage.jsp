<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0,maximum-scale=3.0,minimum-scale=1.0,width=device-width,minimal-ui">
<title>Levelup login page</title>
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<link rel="stylesheet" type="text/css" href="./resources/css/login.css">
<script type="text/javascript" src="./resources/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/make_graph.js"></script>
<script type="text/javascript" src="./resources/js/page_info.js"></script>
<script type="text/javascript" src="./resources/js/main.js"></script>
</head>
<body>
    <div id="container">
        <main class="main-wrapper login">
            <div class="login-box">
        		<h1>L E V E L U P</h1>
                <form action="elogin.do" method="post">
                    <a class="login-logo" href="#">
                        <img src="./resources/images/game-controller.png">
                    </a>

                    <div class="login-nemo login-name margin-top30px">
                        <input type="text" id="empid" placeholder="이메일을 입력하세요." name="employeeEmail" required>
                        <i class='bx bxs-user' name='bx'></i>
                    </div>

                    <div class="login-nemo login-name">
                        <input type="password" placeholder="비밀번호를 입력하세요." name="employeePwd" required>
                        <i class='bx bxs-lock-alt' name="bx"></i>
                    </div>

                    <input class="login-btn" type="submit" name="login" value="로그인">
                </form>
            </div>
        </main>
    </div>
</body>
</html>
