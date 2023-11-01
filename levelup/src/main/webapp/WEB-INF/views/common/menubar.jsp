<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Levelup main</title>
<style type="text/css">
.html, body {
	margin: 0;
	width: 100%;
}

.box-wrap {
	display: flex;
	flex-direction: row;
	width: 100%;
	background-color: #EBEBEA;
}

.LOGO {
	font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
	font-size: 40px;
	text-align: left;
	margin-left: 10px;
}

.box {
	width: 200px;
	height: 50px;
	background-color: #03a5fc;
	border: 1px solid #000;
	margin: 0px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="box-wrap">
		<div class="LOGO">LEVELUP ERP</div>
		<div class="box">문의 리스트</div>
		<div class="box">기안 리스트</div>
		<div class="box">사내 게시판</div>
		<div class="box">일정관리</div>
		<div class="box">보관함</div>
	</div>
</body>
</html>