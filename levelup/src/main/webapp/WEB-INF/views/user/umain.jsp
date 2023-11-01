<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/common/head-script.jsp"/>
<title>userMain</title>
<c:url var="gouloginpage" value="gouloginpage.do" />
<script src="resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

$(function(){
    var isUserLoggedIn = ${not empty sessionScope.loginUser};

    if (isUserLoggedIn) {
        $.ajax({
            url: "item3.do",
            type: "post",
            dataType: "json",
            success: function(data) {
                console.log("success : " + data);

                var str = JSON.stringify(data);
                var json = JSON.parse(str);
                var values = "";

                for (var i in json.list) {
                	values += 
                    	"<div class='user-item-card' style='width: 200px;'>"
                    	+ "<img src='/levelup/resources/images/sales/" + json.list[i].discountRate + ".png' alt='sales' style='position: relative;width: 50px; height: 50px;z-index:2;'>"
                    	+ "<img src='/levelup/resources/images/itemlist2/"
                        + json.list[i].itemId + ".png' alt='item" + json.list[i].itemId + "' style='margin-top:-20px;'>"
                        + "<h3>" + json.list[i].itemName + "</h3>"
                        
                        + "<a href='" + "${pageContext.servletContext.contextPath}/itembuypage.do?itemname=" 
                        + json.list[i].itemName + "' class='btn btn-secondary'>구매하기</a></div>";
                }

                $('#user-items').html($('#user-items').html() + values);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
            }
        });
    }else{
    	$('.purchase-button').click(function() {
            loginalert();
        });
    	
    	$.ajax({
            url: "item3.do",
            type: "post",
            dataType: "json",
            success: function(data) {
                console.log("success : " + data);

                var str = JSON.stringify(data);
                var json = JSON.parse(str);
                var values = "";

                for (var i in json.list) {
                    values += 
                    	"<div class='user-item-card' style='width: 200px;'>"
                    	+ "<img src='/levelup/resources/images/sales/" + json.list[i].discountRate + ".png' alt='sales' style='position: relative;width: 50px; height: 50px;z-index:2;'>"
                    	+ "<img src='/levelup/resources/images/itemlist2/"
                        + json.list[i].itemId + ".png' alt='item" + json.list[i].itemId + "' style='margin-top:-20px;'>"
                        + "<h3>" + json.list[i].itemName + "</h3>"
                       
                        + "<a class='btn btn-secondary purchase-button ' onclick='logincheck()' style='margin-left:0 auto;'>구매하기</a></div>";
                }
                
                $('#user-items').html($('#user-items').html() + values);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
            }
        });


    }

});
function logincheck(){
	alert("상품을 구매하시려면\n먼저 로그인하세요.");
}
function logingamecheck(){
	alert("게임을 시작하시려면\n먼저 로그인하세요.");
}
function cmdgame(){
	window.location.href = "test://";
}
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/user/userHeader.jsp"/>

	<section class="hero">
	
		<div class="container">
		<div class="row">
		<div class="col-4">
		<div class="banner-container">
		<img src="/levelup/resources/images/logo/umain2.png" width="300" height="300" alt="메인화면배너 사진">
		</div>
		</div>
		<div class="col-7">
			<c:if test="${ empty sessionScope.loginUser }">
				<div class="umainloginbox">
					<div class="button_base b10_tveffect">
						<div onclick="logingamecheck()">GameStart</div>
				        <div onclick="logingamecheck()">
				            <div>GameStart</div>
				            <div>GameStart</div>
				            <div>GameStart</div>
				        </div>
						<!-- <a href="http://download.evolonline.org/manaplus/download/manaplus-win32.exe">게임 다운로드</a> -->
					</div>
					<div class="uloginbox box_inner2" onclick="gouloginpage()">로그인하러가기</div>
					
				</div>
				
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<div class="umainloginbox">
					<div class="button_base b10_tveffect">
						<div onclick="cmdgame()">GameStart</div>
				        <div onclick="cmdgame()">
				            <div>GameStart</div>
				            <div>GameStart</div>
				            <div>GameStart</div>
				        </div>
						<!-- <a href="http://download.evolonline.org/manaplus/download/manaplus-win32.exe">게임 다운로드</a> -->
					</div>
					<div class="uloginbox2 box_inner2">
						<a href="mypage.do?userId=${ loginUser.userId }">${loginUser.userId} 님 방문을 환영합니다.</a>
						<br><br>
						<a href="logout.do">로그아웃</a>
					</div>
					
				</div>
			</c:if>
			</div>
			<div class="col-1"></div>
			</div>
		</div>
	</section>
	
	<div class="container">
		<section class="featured-games">
		<div class="row pb-5 pl-auto pl-auto">
		
			<div class="col-1"></div>
			<div class="col-3 border border-2"><img src="/levelup/resources/images/logo/eventshop.png" height="34"></div>
			<div class="col-7"> <p style="font-size:10px;text-align: right;">*일주일간 진행되는 할인상점입니다.</p></div>
			<div class="col-1"></div>
		</div>
		<div class="row pb-5 pl-auto pl-auto">
			<div class="col-1"></div>
			<div class="col-9 border border-4"><div class="user-items" id="user-items" style="witdh:852px;margin:0 auto;margin-top:10px;"></div></div>
			<div class="col-1"></div>
		</div>
	</div>	
			
		
	
	</section>
<c:import url="/WEB-INF/views/user/userFooter.jsp"/>

<script type="text/javascript">
function gouloginpage(){
    location.href = "${gouloginpage}";
}
</script>
<script type="text/javascript">
function cmd() {
    var obj = new ActiveXObject("WScript.Shell");
    obj.Run("C:\\test\\sample.exe");
}
</script>
</body>
</html>