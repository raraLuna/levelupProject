<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/common/head-script.jsp"/>
<title>useritemlist.jsp</title>
</head>
<body>
<c:import url="/WEB-INF/views/user/userHeader.jsp"/>
<div class="container">

<p align="middle">

<iframe width="560" height="315" src="https://wiki.themanaworld.org/index.php/Classic_1-Handed_Weapons"  frameborder="0">이 브라우저는 iframe을 지원하지 않습니다</iframe>

</p>
<object id="ss" data="https://wiki.themanaworld.org/index.php/Classic_1-Handed_Weapons"
width="800"
height="800"
type="text/html">
</object>
</div>
<c:import url="/WEB-INF/views/user/userFooter.jsp"/>
</body>
</html>