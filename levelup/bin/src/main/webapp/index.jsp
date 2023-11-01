<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
웰컴 요청이 오면  main 페이지가 나가도록 요청을 전달함(forwarding)
첫페이지 요청 url : http://domain or localhost:port/context-root/ 
예 : http://localhost:8080/first
-->
<%-- <% 
	RequestDispatcher view = request.getRequestDispatcher("main.do");
	view.forward(request, response);
%> --%>
<!-- 
	Spring에서는 뷰에서 바로 뷰로 가지 않고 무조건 컨트롤러를 거쳐서 view를 포워딩한다 
-->
<jsp:forward page="main.do" /> <!-- Controller로 가고 main.do가 view를 forwading 함 -->

</body>
</html>