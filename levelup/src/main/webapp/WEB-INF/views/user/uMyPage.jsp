<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/common/head-script.jsp" />
<title>Insert title here</title>
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
            
            var str = JSON.stringify(data);
            var json = JSON.parse(str);
            
            var values = "<select name='charName' onchange='showPaymentsForChar(this.value)'>";
            values += "<option value=''>캐릭터를 선택해주세요</option>";
            for (var i in json.list) {
                values += "<option value='" + json.list[i].name + "'>" + json.list[i].name +  "</option>";
            }
            values += "</select>";
            
            $('#charlist').html(values); 

            hidePaymentList();
        },
        error: function(jqXHR, textStatus, errorThrown){
            console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
        }
    });  
});

function hidePaymentList() {
    var paymentRows = document.querySelectorAll(".payment-row");
    paymentRows.forEach(function(row) {
        row.style.display = "none";
    });
}

function showPaymentsForChar(charName) {
    hidePaymentList();

    if (charName !== '') {
        var matchingRows = document.querySelectorAll(".payment-row-" + charName);
        matchingRows.forEach(function(row) {
            row.style.display = "table-row";
        });
    }
}

</script>
</head>
<body>
	<c:import url="/WEB-INF/views/user/userHeader.jsp" />
	<div class="container pt-5">
		<h2>${ sessionScope.loginUser.userId }님의 마이페이지</h2>
		<br>
		<br>
		<br>
		<div class="row border border-4">
			<div class="col-9 mb-2">
				<h4 class="mt-2 fw-bold">캐릭터 리스트</h4>
				<p>*캐릭터 스텟창</p>
				<table  border="1" cellspacing="0" width="700">
					<tr>
						<th align="center">캐릭터 이름</th>
						<th align="center">레벨</th>
						<th align="center">보유 zeny</th>
						<th align="center">힘(str)</th>
						<th align="center">방어력(vit)</th>
						<th align="center">재주/기교(dex)</th>
						<th align="center">운(luk)</th>
						<th align="center">최대채력</th>
						<th align="center">현재채력</th>
						<th align="center">최대마나</th>
						<th align="center">현재마나</th>
					</tr>
					<c:forEach items="${requestScope.charList}" var="c">
						<tr>
							<td align="center">${c.name}</td>
							<td align="center">${c.baseLevel}</td>
							<td align="center">${c.zeny}</td>
							<td align="center">${c.str}</td>
							<td align="center">${c.vit}</td>
							<td align="center">${c.dex}</td>
							<td align="center">${c.luk}</td>
							<td align="center">${c.maxHp}</td>
							<td align="center">${c.hp}</td>
							<td align="center">${c.maxSp}</td>
							<td align="center">${c.sp}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-3"></div>
		</div>
		<br>
		<div class="row pt-5 mb-5 pb-2">
			<div class="col-5 border border-4 pb-2 pt-1">
				<h4 class="fw-bold">결제 내역</h4>
				<p>*확인할 캐릭터를 선택해 주세요</p>
				<table class="" id="charlist" cellspacing="0" width="700">
				</table>
				<br>
				<table align="center" border="1" cellspacing="0" width="460">
					<tr>
						<th align="center">캐릭터 이름</th>
						<th align="center">아이템 이름</th>
						<th align="center">가격</th>
						<th align="center">결제상태</th>
					</tr>
					<c:forEach items="${requestScope.paymentList}" var="p">
						<tr class="payment-row payment-row-${p.charName}">
							<td>${ p.charName }</td>
							<td>${ p.itemId }</td>
							<td>${ p.amount }</td>
							<c:if test="${ p.paymentStatus eq '1' }">
										<td data-th="Type">결제완료</td>
							</c:if>
							<c:if test="${ p.paymentStatus eq '2' }">
										<td data-th="Type">환불완료</td>
							</c:if>
							<c:if test="${ p.paymentStatus eq '3' }">
										<td data-th="Type">결제오류</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-1"></div>
			<div class="col-6 border border-4 pb-2 pt-1">
				<h4 class="fw-bold">문의 내역</h4>
				<p>*작성한 문의날짜를 선택해주세요</p>
				<div>
				    <label for="startDate">시작 날짜:</label>
				    <input type="date" id="startDate">
				</div>
				<div>
				    <label for="endDate">끝 날짜:</label>
				    <input type="date" id="endDate">
				</div>
				<br>
				<input type="button" value="검색하기" onclick="filterByDateRange()">
				<br><br>
				<table align="center" border="1" cellspacing="0" width="560">
					<tr>
						<th align="center">문의한 id</th>
						<th align="center">종류</th>
						<th align="center">게시날짜</th>
						<th align="center">제목</th>
						<th align="center">답변여부</th>
					</tr>
					<c:forEach items="${requestScope.inquiryList }" var="i">
						<tr class="data-row mousehover" onclick="openInquiryDetail('${i.inquiryId}', '${sessionScope.loginUser.userId}');">
						    <td>${i.userId}</td>
				    		<c:if test="${ i.inquiryType eq '1' }">
								<td data-th="Type">환불문의</td>
							</c:if>
							<c:if test="${ i.inquiryType eq '2' }">
								<td data-th="Type">게임문의</td>
							</c:if>
							<c:if test="${ i.inquiryType eq '3' }">
								<td data-th="Type">기타문의</td>
							</c:if>
						    <td class="date-column">${i.editDate}</td>
						    <td>${i.inquiryTitle}</td>
						    <td class="mb-2" align="center">${i.answerStatus}</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<br>
			</div>
		</div>
	</div>
	<div class="pt-5 pb-5 mt-5"></div>
	<c:import url="/WEB-INF/views/user/userFooter.jsp" />
	<script type="text/javascript">
	function filterByDateRange() {
	    var startDate = new Date(document.getElementById("startDate").value);
	    var endDate = new Date(document.getElementById("endDate").value);

	    var tableRows = document.querySelectorAll("tr.data-row");
	    
	    tableRows.forEach(function (row) {
	        var dateString = row.querySelector("td.date-column").textContent; 
	        var rowDate = new Date(dateString);

	        if (rowDate >= startDate && rowDate <= endDate) {
	            row.style.display = "table-row";
	        } else {
	            row.style.display = "none";
	        }
	    });
	}

	filterByDateRange();
	
	function openInquiryDetail(inquiryId, userId) {
	    // 상세 정보 페이지로 이동
	    window.location.href = 'uuidetail.do?iid=' + inquiryId + '&userId=' + userId;
	}
	</script>
</body>
</html>