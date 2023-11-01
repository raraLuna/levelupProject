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
<c:import url="/WEB-INF/views/user/userHeader.jsp"/>
<c:import url="/WEB-INF/views/common/title-meta.jsp"/>
<!-- 헤드 스크립트 -->
</head>
<body style="background-color:white;">
<% if (request.getAttribute("message") != null) { %>
    <script type="text/javascript">
        var message = "${requestScope.message}";
        alert(message);
    </script>
<% } %>
<div class="imageback">
    <img alt="유저상점사진" src="/levelup/resources/images/styleimage/backgroundgif2.gif">
    <div class="row">
    	<div class="col-7"></div>
    	<div class="col-3">
    		<img alt="다른 이미지" src="/levelup/resources/images/styleimage/shop_open.png" class="overlay-image">
    	</div>
    	<div class="col-2"></div>
    </div>
</div>
<br><br>
<div class="user-shop-container container">

<div class="row">
        <div class="user-filter">
            <h2>카테고리</h2>
            <ul>
                <li><a href="#" data-category="all">전체 상품</a></li>
                <li><a href="#" data-category="clothing">무기</a></li>
                <li><a href="#" data-category="ring">반지</a></li>
                <li><a href="#" data-category="potions">포션</a></li>
                <li><a href="#" data-category="necklace">목걸이</a></li>
                <li><a href="#" data-category="etc">기타</a></li>
                <!-- 다른 카테고리 항목 추가 -->
            </ul>
        </div>
        <div class="user-items user-items-w">
            <!-- 상품 카드 1 -->
            <div class="user-item-card" data-category="necklace" style="width:200px;">
            	<img src="/levelup/resources/images/sales/10non.png" alt="sale" style="position: relative;width: 60px; height: 60px;margin-top:-10px;margin-right:-10px;z-index:2;">
                <img src="/levelup/resources/images/itemlist2/1000.png" alt="Item 1" id="itemimage" style="position: relative;margin-top:-50px;">
                <h3>Copper Necklace</h3>
                <p>상품 아이디: 1000</p>
                <p class="item-price">가격: $1000</p>
                <p>아이템 설명란 : 무거운 구리 목걸이</p>
            </div>
            <!-- 다른 상품 카드 추가 -->
            <!-- 상품 카드 2 -->
            <div class="user-item-card" data-category="necklace" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/1001.png" alt="Item 2" id="itemimage" >
                <h3>Silver Necklace</h3>
                <p>상품 아이디: 1001</p>
                <p class="item-price">가격: $2000</p>
                <p>아이템 설명란 : 무거운 실버 목걸이</p>
            </div>
            <!-- 다른 상품 카드 추가 -->
            <!-- 상품 카드 3 -->
            <div class="user-item-card" data-category="necklace" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/1002.png" alt="Item 3" id="itemimage" >
                <h3>Gold Necklace</h3>
                <p>상품 아이디: 1002</p>
                <p class="item-price">가격: $5000</p>
                <p>아이템 설명란 : 반짝거리는 골드 목걸이</p>
            </div>
            <!-- 다른 상품 카드 추가 -->
            <!-- 상품 카드 4 -->
            <div class="user-item-card" data-category="necklace" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/1006.png" alt="Item 4" id="itemimage" >
                <h3>Golden Four-Leaf Necklace</h3>
                <p>상품 아이디: 1006</p>
                <p class="item-price">가격: $5000</p>
                <p>아이템 설명란 : 황금 네잎 목걸이</p>
            </div>
            <!-- 다른 상품 카드 추가 -->
            <!-- 상품 카드 5 -->
            <div class="user-item-card" data-category="electronics" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/1013.png" alt="Item 5" id="itemimage" >
                <h3>Skull Necklace</h3>
                <p>상품 아이디: 1013</p>
                <p class="item-price">가격: $5000</p>
                <p>아이템 설명란 : 고블린의 해골 목걸이</p>
            </div>
            <!-- 다른 상품 카드 추가 -->
            <!-- 상품 카드 6 -->
            <div class="user-item-card" data-category="ring" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/1100.png" alt="Item 6" id="itemimage" >
                <h3>Simple Copper Ring</h3>
                <p>상품 아이디: 1100</p>
                <p class="item-price">가격: $1000</p>
                <p>아이템 설명란 : 프로포즈에 제격인 구리반지</p>
            </div>
            <!-- 다른 상품 카드 추가 -->
            <!-- 상품 카드 7 -->
            <div class="user-item-card" data-category="ring" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/1101.png" alt="Item 7" id="itemimage" >
                <h3>Simple Silver Ring</h3>
                <p>상품 아이디: 1101</p>
                <p class="item-price">가격: $1000</p>
                <p>아이템 설명란 : 무거운 은 반지</p>
            </div>
            <!-- 다른 상품 카드 추가 -->
            <!-- 상품 카드 8 -->
            <div class="user-item-card" data-category="ring" style="width:200px;">
                <img src="/levelup/resources/images/sales/20non.png" alt="sale" style="position: relative;width: 60px; height: 60px;margin-top:-10px;margin-right:-10px;z-index:2;">
                <img src="/levelup/resources/images/itemlist2/1102.png" alt="Item 8" style="position: relative;margin-top:-50px;" id="itemimage" >
                <h3>Simple Golden Ring</h3>
                <p>상품 아이디: 1102</p>
                <p class="item-price">가격: $1000</p>
                <p>아이템 설명란 : 반짝거리는 골드 반지</p>
            </div>
            <!-- 다른 상품 카드 추가 -->
            <!-- 상품 카드 9 -->
            <div class="user-item-card" data-category="ring" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/1106.png" alt="Item 9" id="itemimage" >
                <h3>Silver Ring</h3>
                <p>상품 아이디: 1106</p>
                <p class="item-price">가격: $2000</p>
                <p>아이템 설명란 : 가벼운 은 반지</p>
            </div>
            <!-- 다른 상품 카드 추가 -->
            <div class="user-item-card" data-category="ring" style="width:200px;">
                <img src="/levelup/resources/images/sales/20non.png" alt="sale" style="position: relative;width: 60px; height: 60px;margin-top:-10px;margin-right:-10px;z-index:2;">
                <img src="/levelup/resources/images/itemlist2/1110.png" alt="Item 10" style="position: relative;margin-top:-50px;" id="itemimage" >
                <h3>Silver Signet Ring</h3>
                <p>상품 아이디: 1110</p>
                <p class="item-price">가격: $5000</p>
                <p>아이템 설명란 : 구하기 힘든 실버 인장 반지 19호</p>
            </div>
            <div class="user-item-card" data-category="etc" style="width:200px;">
                <img src="/levelup/resources/images/sales/30non.png" alt="sale" style="position: relative;width: 60px; height: 60px;margin-top:-10px;margin-right:-10px;z-index:2;">
                <img src="/levelup/resources/images/itemlist2/615.png" alt="Item 11" style="position: relative;margin-top:-50px;" id="itemimage" >
                <h3>Treasure Map</h3>
                <p>상품 아이디: 615</p>
                <p class="item-price">가격: $4500</p>
                <p>아이템 설명란 : 세계 어딘가 숨어있는 보물을 가르키는 지도</p>
            </div>
            <div class="user-item-card" data-category="potions" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/608.png" alt="Item 12" id="itemimage" >
                <h3>Fertility Potion</h3>
                <p>상품 아이디: 608</p>
                <p class="item-price">가격: $2500</p>
                <p>아이템 설명란 : 다산의 물약</p>
            </div>
            <div class="user-item-card" data-category="potions" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/613.png" alt="Item 13" id="itemimage" >
                <h3>Purification Potion</h3>
                <p>상품 아이디: 613</p>
                <p class="item-price">가격: $2500</p>
                <p>아이템 설명란 : 정화 물약</p>
            </div>
            <div class="user-item-card" data-category="potions" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/625.png" alt="Item 14" id="itemimage" >
                <h3>Seafood Plate</h3>
                <p>상품 아이디: 625</p>
                <p class="item-price">가격: $5000</p>
                <p>아이템 설명란 : 해산물 접시(회복)</p>
            </div>
            <div class="user-item-card" data-category="potions" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/626.png" alt="Item 15" id="itemimage" >
                <h3>Barbecue Plate</h3>
                <p>상품 아이디: 626</p>
                <p class="item-price">가격: $5000</p>
                <p>아이템 설명란 : 바베큐 플레이트(회복)</p>
            </div>
            <div class="user-item-card" data-category="potions" style="width:200px;">
                <img src="/levelup/resources/images/itemlist2/626.png" alt="Item 15" id="itemimage" >
                <h3>Barbecue Plate</h3>
                <p>상품 아이디: 626</p>
                <p class="item-price">가격: $5000</p>
                <p>아이템 설명란 : 바베큐 플레이트(회복)</p>
            </div>
           
  			<div id="noResultsMessage" style="display: none;" style="width:200px;">
			    검색 결과가 없습니다.
			</div>
			
        </div>
        </div>
    </div>
    <div id="buyItemModal" class="modal" style="z-index:3;">
	    <div class="modal-content">
	        <span class="close" id="closeModal">&times;</span>
	        <h2>구매 확인</h2>
	        <img src="" alt="Item" id="modalItemImage">
	        <p>상품명: <span id="modalItemName"></span></p>
	        <p>가격: $<span id="modalItemPrice"></span></p>
	        <p>구매하시겠습니까?</p>
	        <button id="confirmPurchase">구매 페이지로</button>
	    </div>
	</div>
    <br><br><br><br>
    <c:import url="/WEB-INF/views/user/userFooter.jsp"/>
 <script type="text/javascript">
    const itemCards = document.querySelectorAll('.user-item-card'); // 클래스 이름 수정
    const filterLinks = document.querySelectorAll('.user-filter a'); // 클래스 이름 수정
    const noResultsMessage = document.getElementById('noResultsMessage');

    // 초기 화면 로딩 시 모든 아이템 표시
    filterItems('all');

    // 카테고리별 필터링
    filterLinks.forEach(link => {
        link.addEventListener('click', function (e) {
            e.preventDefault();
            const category = this.getAttribute('data-category');
            filterItems(category);
        });
    });

    function filterItems(category) {
        let foundResults = false; // 검색 결과 초기값을 false로 설정

        itemCards.forEach(card => {
            const cardCategory = card.getAttribute('data-category');
            if (category === 'all' || cardCategory === category) {
                card.style.display = 'block';
                foundResults = true; // 결과가 있을 경우 foundResults를 true로 설정
            } else {
                card.style.display = 'none';
            }
        });

        // 검색 결과가 없을 때 메시지 표시
        if (!foundResults) {
            noResultsMessage.style.display = 'block';
        } else {
            noResultsMessage.style.display = 'none';
        }
    }
    

    itemCards.forEach(card => {
        card.addEventListener('click', function () {
            const category = this.getAttribute('data-category');
            const itemId = this.querySelector('p:nth-of-type(2)').textContent.split(": ")[1];
            const itemName = this.querySelector('h3').textContent;
            const priceText = this.querySelector('.item-price').textContent; // .item-price 클래스를 사용하여 가격 가져오기
            const result = priceText.replace(/[^0-9]/g,'');
            const itemPrice = parseInt(result);
            const itemImage = this.querySelector('#itemimage').getAttribute('src');

            console.log("Category: " + category);
            console.log("Item ID: " + itemId);
            console.log("Item Name: " + itemName);
            console.log("Price Text: " + priceText);
            console.log("Item Price: " + itemPrice);
            console.log("Item Image: " + itemImage);

            buyItem(category, itemId, itemName, itemPrice, itemImage);
        });
    });
	
   


// 구매 페이지로 이동 및 로그인 확인
function buyItem(category, itemId, itemName, itemPrice, itemImage) {
    <c:choose>
        <c:when test="${empty sessionScope.loginUser}">
            alert("상품을 구매하시려면\n먼저 로그인하세요.");
        </c:when>
        <c:otherwise>
            // 로그인한 사용자라면 모달 팝업을 열고 정보 전달
            openModal(itemName, itemPrice, itemImage);
        </c:otherwise>
    </c:choose>
}

// 모달 열기 함수
function openModal(itemName, itemPrice, itemImage) {
    const modal = document.getElementById("buyItemModal");
    const modalItemName = document.getElementById("modalItemName");
    const modalItemPrice = document.getElementById("modalItemPrice");
    const modalItemImage = document.getElementById("modalItemImage");

    modalItemName.innerText = itemName;
    modalItemPrice.innerText = parseFloat(itemPrice).toFixed(2); // 가격을 숫자로 변환하고 소수점 2자리까지 표시
    modalItemImage.src = itemImage; // 상품 사진 설정

    modal.style.display = "block";
}

// 모달 닫기 함수
function closeModal() {
    const modal = document.getElementById("buyItemModal");
    modal.style.display = "none";
}

// 구매 확인 버튼 클릭 시 모달 닫고 동작 수행
document.getElementById("confirmPurchase").addEventListener("click", function () {
    closeModal();
    var itemName = modalItemName.textContent;
    var url = "${ pageContext.servletContext.contextPath }/itembuypage.do?itemname=" + itemName;

    location.href = url;
});

// 닫기 버튼 클릭 시 모달 닫기
document.getElementById("closeModal").addEventListener("click", closeModal);
</script>
</body>
</html>

