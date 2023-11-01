<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 상점 결제 페이지</title>
<c:import url="/WEB-INF/views/common/head-script.jsp"/>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<script src="resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	console.log("testlog1");
	var accountId = "${sessionScope.loginUser.accountId}";
    
	
	
    $.ajax({
		url: "charlist.do",
		type: "post",
		dataType: "json",
		data: { accountId: accountId },
		success: function(data){
			console.log("success : " + data);
			
			//object --> string
			var str = JSON.stringify(data);
			
			//string --> json
			var json = JSON.parse(str);
			
			values = "";			
			for(var i in json.list){
				//로그인한 회원만 게시글 상세보기를 할 수 있게 한다면
				
				values = "<select name='charName'>";
				values += "<option value=''>캐릭터를 선택해주세요</option>"; // 선택 안했을 때의 옵션
				for (var i in json.list) {
				    values += "<option value='" + json.list[i].name + "'>" + json.list[i].name +  "</option>";
				}
				values += "</select></td>";
			}
			
			$('#charlist').html($('#charlist').html() + values);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});  
});

</script>
</head>
<body>
<c:import url="/WEB-INF/views/user/userHeader.jsp"/>
	<br>
	<div class="container">
	
		<div class="row pt-4 mb-5">
			<div class="col-1"></div>
			<div class="col-4 pt-5 bg-white">
				<div class="container">
					<h3>구매전 캐릭터를 선택해 주세요</h3>
					<table id="charlist" cellspacing="0" width="700">
					</table>
					<br> <img
						src="/levelup/resources/images/itemlist/${requestScope.item.itemId}.png"
						alt="Item 15"> <br>
		
					<p>가격 : ${requestScope.item.price}</p>
					<p>
					<c:choose>
						<c:when test="${not empty requestScope.item.discountRate}">
					      할인율 : ${requestScope.item.discountRate}
					    </c:when>
						<c:otherwise>
					      &nbsp;
					    </c:otherwise>
					</c:choose>
				</p>
				</div>
			</div>
			<div class="col-7 bg-white">
				<br> <br>
				<div id="payment-method"></div>
				<div id="agreement"></div>
				<button id="payment-button" class="btn btn-link ms-2 mb-3">결제하기</button>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/user/userFooter.jsp"/>
<script type="text/javascript">
// 김지혁
const clientKey = 'test_ck_6BYq7GWPVvnz7o1ODvR5VNE5vbo1';
const secretKey = 'test_sk_DpexMgkW36ZnqQN19dEN3GbR5ozO';
var price = "${ requestScope.item.price}";
var discountRate = "${requestScope.item.discountRate}";
if (discountRate != null && discountRate >= 10) {
    // 할인율을 적용한 가격으로 업데이트
    price = price - (price * (discountRate / 100));
}


// 김화범
//const clientKey = 'test_ck_mBZ1gQ4YVXK2qEKKLN2X3l2KPoqN';
//const secretKey = 'test_sk_DpexMgkW36xJ0M0ooAXMrGbR5ozO';

// 최유미
//const clientKey = 'test_ck_Gv6LjeKD8aY5W2QbeknN8wYxAdXy';
//const secretKey = 'test_sk_24xLea5zVAmdw7OMPDZxVQAMYNwW';


const base64Encoded = btoa(secretKey);
console.log("=============" + price);
const customerKey = "${ sessionScope.loginUser.userId }"
const button = document.getElementById("payment-button")
const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제

paymentWidget.renderPaymentMethods(
	  "#payment-method", 
	  { value: price },
	  // 렌더링하고 싶은 멀티 결제 UI의 variantKey
	  // https://docs.tosspayments.com/guides/payment-widget/admin#멀티-결제-ui
	  { variantKey: "DEFAULT" }
)

paymentWidget.renderAgreement(
	'#agreement',
	{ variantKey: "AGREEMENT" } // 기본 이용약관 렌더링
)

const orderId = generateRandomString(10);

button.addEventListener("click", function () {
    // 구매 성공 URL 및 다른 데이터
    const selectedCharName = document.querySelector("select[name='charName']").value;
    console.log("");
    if (selectedCharName === "") {
        alert("먼저 캐릭터를 선택해주세요");
    } else {
        paymentWidget.requestPayment({
            orderId: orderId,
            orderName: "${ requestScope.item.itemId }",
            successUrl: "http://localhost:8080/levelup/buyingpage.do?charName=" + selectedCharName + "&itemId=${ requestScope.item.itemId }",
            failUrl: "http://localhost:8080/levelup/ushop.do",
            customerEmail: "kimjihyuk5935@gmail.com",
            customerName: "김지혁"
        });
    }
});

function generateRandomString(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}
</script>
</body>
</html>