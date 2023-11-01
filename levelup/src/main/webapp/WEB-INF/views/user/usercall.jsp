<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/common/head-script.jsp" />
<title>useritemlist.jsp</title>
</head>
<body style="background-color:white;">
<c:import url="/WEB-INF/views/user/userHeader.jsp" />
<div class="container">
<br><br><br><br>
        <!-- 고객문의 안내 문구 시작 -->
        <div class="customer-support">
            <h3>고객문의</h3>
            <p>"문의하실 때 게임 버전, 환경 정보, 문제 상황을 자세하게 제공하면 빠른 도움을 받을 수 있어요."</p>
        </div>
        <div class="customer-support">
         
            <h3>1:1 문의 지원</h3>
            <p>"무엇이든 물어보세요! 1:1 문의로 고객 지원팀이 답변해드립니다."</p>
        </div>
        <div class="customer-support">
         
            <h3>우리의 약속</h3>
            <p>"우리는 고객 만족을 최우선으로 생각합니다. 모든 문의에 최선을 다하겠습니다."</p>
        </div>
        <div class="customer-support">
         
            <h3>서비스 향상을 위한 의견 환영</h3>
            <p>"고객의 의견은 우리 서비스를 향상시키는 데 큰 역할을 합니다. 의견을 주셔서 감사합니다."</p>
        </div>
        <div class="customer-support">
         
            <h3>연락 방법</h3>
            <p>"우리와 연락하려면 아래의 정보를 이용하세요:"</p>
        </div>
        <div class="customer-support">
         
            <h3>응답 시간</h3>
            <p>"문의는 평일 기준 [10 ~ 20]분 내에 확인하고 응답드립니다."</p>
        </div>
        <div class="customer-support">
            <h3>고객센터 ☎ : 010-1234-5678</h3>
        </div>
        
        
        
        
        
        
        <div class="other-info">
        </div>

</div>
<c:import url="/WEB-INF/views/user/userFooter.jsp" />
</body>
</html>