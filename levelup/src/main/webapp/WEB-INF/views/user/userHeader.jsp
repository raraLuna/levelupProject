<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/common/head-script.jsp"/>
<link href="resources/css/plus.min.css" id="plus-style" rel="stylesheet" type="text/css" />
<link href="resources/css/plus.min.scss" id="plus-style" rel="stylesheet" type="text/scss" />
<style type="text/css">
.container {
    width: 100%; /* 페이지 폭을 100%로 설정 */
    max-width: 1200px; /* 페이지 폭의 최대 크기를 지정 */
    margin: 0 auto; /* 페이지 내용을 수평으로 가운데 정렬 */
    padding: 20px;
}

</style>

</head>

<body>
	<c:if test="${ empty sessionScope.loginUser }">
	<header class="classshowdow">
		<nav class="container">
				<a href="${ pageContext.servletContext.contextPath }/umain.do"><img
					src="/levelup/resources/images/users/umainlogo.jpg"
					class="umainlogo" alt="Game Logo"></a>
				<ul class="uheaderul">
					<li><a class="aclick1" href="${ pageContext.servletContext.contextPath }/umain.do">Home</a></li>
					<li><a class="aclick1" href="${ pageContext.servletContext.contextPath }/ushop.do">shop</a></li>
					<li><a class="aclick1" href="${ pageContext.servletContext.contextPath }/uhelp.do">고객지원</a></li>
					<li><a class="aclick1" href="${ pageContext.servletContext.contextPath }/uabout.do">About Us</a></li>
					<div style="padding-left: 600px;"><a style="color:black;" href="gouloginpage.do">로그인해주세요</a></div>
				</ul>
				
		</nav>
	</header>
	</c:if>
	<c:if test="${ !empty sessionScope.loginUser }">
	<header class="classshowdow">
		<nav class="container">
				<a href="${ pageContext.servletContext.contextPath }/umain.do"><img
					src="/levelup/resources/images/users/umainlogo.jpg"
					class="umainlogo" alt="Game Logo"></a>
				<ul class="uheaderul">
					<li><a class="aclick1" href="${ pageContext.servletContext.contextPath }/umain.do">Home</a></li>
					<li><a class="aclick1" href="${ pageContext.servletContext.contextPath }/ushop.do">shop</a></li>
					<li><a class="aclick1" href="${ pageContext.servletContext.contextPath }/uhelp.do">고객지원</a></li>
					<li><a class="aclick1" href="mypage.do?userId=${ loginUser.userId }">MyPage</a></li>					
					<li><a class="aclick1" href="${ pageContext.servletContext.contextPath }/uabout.do">About Us</a></li>
					<div style="padding-left: 580px;"><a href="mypage.do?userId=${ loginUser.userId }" style="color:black;">${ sessionScope.loginUser.userId } 마이페이지
					</a> <a href="logout.do"> | 로그아웃</a></div>
				</ul>
		</nav>
	</header>
	</c:if>
</body>
</html>