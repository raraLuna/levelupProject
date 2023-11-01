<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp"/>
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp"/>

</head>
<body data-sidebar="dark" data-layout-mode="light">
<!-- 내비게이션바, 사이드바 등등 -->
<c:import url="/WEB-INF/views/common/layout.jsp"/>

<div class="main-content">
	<div class="page-content">
		<div class="container-fluid">

<c:import url="/WEB-INF/views/common/page-title.jsp"/>

<!-- 여기서부터 내용 작성 -->
<%-- 모든 유저 목록 출력 --%>
<table class="table table-striped container">
	<tr>
		<th>accountId</th>
		<th>userId</th>
		<th>email</th>
		<th>logincount</th>
		<th>lastlogin</th>
	</tr>
	<c:forEach var="b" items="${ list }">
		<tr>
			<td align="center">${ b.accountId }</td>
			<td align="center">${ b.userId }</td>
			<td align="center">${ b.email }</td>
			<td align="center">${ b.logincount }</td>
			<td align="center">${ b.lastlogin }</td>
		</tr>
	</c:forEach>
</table>
<br>

	
<c:import url="/WEB-INF/views/common/pagingView.jsp"/>


	 	<!-- container-fluid -->			
		</div>
	<!-- page-content -->		
	</div>
<!-- 푸터(자바스크립트 로딩) -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</div> <!-- main-content -->

</body>
</html>

