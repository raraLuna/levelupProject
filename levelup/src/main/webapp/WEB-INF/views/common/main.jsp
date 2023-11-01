<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${ empty loginEmployee }">
   <c:redirect url="eloginPage.do"/>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/common/title-meta.jsp"/>
<c:import url="/WEB-INF/views/common/head-script.jsp"/>
<script src="resources/js/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script type="text/javascript">
function truncateString(str, maxLength) {
    if (str.length > maxLength) {
        return str.substring(0, maxLength) + "...";
    } else {
        return str;
    }
}

$(function(){
	
	$.ajax({
	    url: "notices5.do",
	    type: "post",
	    data: { keyword: "${loginEmployee.departmentId}" },
	    dataType: "json",
	    success: function(data) {
	        console.log("success: " + data);

	        // object --> string
	        var str = JSON.stringify(data);

	        // string --> json
	        var json = JSON.parse(str);

	        var values = "";
	        for (var i in json.nlist) {
	            values += "<tr><td><a href='ndetail.do?noticeId=" + json.nlist[i].noticeId + "'>" + decodeURIComponent(json.nlist[i].title).replace(/\+/gi, " ") + "</a></td><td>" + json.nlist[i].date + "</td>";

	            if (json.nlist[i].attachementFilename) {
	                values += "<td data-th='Type' class='text-center'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-clipboard-check' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z'/><path d='M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z'/><path d='M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z'/></svg></td>";
	            } else {
	                values += "<td data-th='Type' class='text-center'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-clipboard' viewBox='0 0 16 16'><path d='M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z'/><path d='M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z'/></svg></td>";
	            }

	            values += "</tr>";
	        }

	        $('#denotice').html($('#denotice').html() + values);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log("error: " + jqXHR + ", " + textStatus + ", " + errorThrown);
	    }
	});
	
	$.ajax({
	    url: "communities5.do",
	    type: "post",
	    data: { keyword: "${loginEmployee.departmentId}" },
	    dataType: "json",
	    success: function(data) {
	        console.log("success: " + data);

	        // object --> string
	        var str = JSON.stringify(data);

	        // string --> json
	        var json = JSON.parse(str);

	        values = "";
	        for (var i in json.nlist) {
	            values += "<tr><td><a href='comdetail.do?board_id=" + json.nlist[i].board_id + "'>" + decodeURIComponent(json.nlist[i].title).replace(/\+/gi, " ")
	                    + "</a></td><td>" + json.nlist[i].date + "</td>";

	            if (json.nlist[i].attachementFilename) {
	                values += "<td data-th='Type' class='text-center'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-clipboard-check' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z'/><path d='M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z'/><path d='M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z'/></svg></td>";
	            } else {
	                values += "<td data-th='Type' class='text-center'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-clipboard' viewBox='0 0 16 16'><path d='M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z'/><path d='M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z'/></svg></td>";
	            }

	            values += "</tr>";
	        }

	        $('#decommunity').html($('#decommunity').html() + values);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log("error: " + jqXHR + ", " + textStatus + ", " + errorThrown);
	    }
	});
	

})


</script>
</head>
<body data-sidebar="dark" data-layout-mode="light">


<c:import url="/WEB-INF/views/common/layout.jsp"/>
	<!-- ============================================================== -->
	<!-- Start right Content here -->
	<!-- ============================================================== -->
	<div layout:fragment="content">
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">
		
					<!-- start page title -->
<%-- 					<div th:replace="page-title :: topnavbar(${title},${item},${subitem})"></div> --%>
					<c:import url="/WEB-INF/views/common/page-title.jsp"/>
					<!-- end page title -->
					<div class="row">
						<div class="col-6 border border3 pt-3 pb-10">
							<h4>${loginEmployee.departmentId}부서 공지사항</h4>
							<table id="denotice" class="border border-4" cellspacing="0" width="80%">
								<tr><th>제목</th><th>날짜</th><th class="text-center">첨부파일</th></tr>
							</table>
						</div>
						
						
						<div class="col-6 border border3 pt-3 pb-10">
							<h4>국내 게임 시장 데이터 시각화</h4>
							<iframe src="resources/iframe/index.html" width="100%" height="100%">
							</iframe>
							
						</div>
						
					</div>
		
					
					<br><br>
					<div class="row">
						<div class="col-6 border border3 pt-3 pb-3">
							<h4>${loginEmployee.departmentId}부서 게시글</h4>
							<table id="decommunity" class="border border-4" cellspacing="0" width="80%">
								<tr><th>제목</th><th>날짜</th><th>첨부파일</th></tr>
							</table>
						</div>
						
						
						<div class="col-6 border border3 pt-3 pb-3">
						<div style="width: 280px;height: 280px;text-align: center;">
							<canvas id="myChart" width="400px" height="400px"></canvas>
						</div>
						</div>

					</div>
					
					
					
					
					
					
					<!-- end row -->
				</div>
				<!-- container-fluid -->
			</div>
			<!-- End Page-content -->
			<!-- Start footer -->
<!-- 			<div th:replace='footer :: footer'></div> -->

			<c:import url="/WEB-INF/views/common/footer.jsp"/>
			<!-- end footer -->
			
		</div>
	</div>
	<!-- end main content-->

	<!-- END layout-wrapper -->

<!-- 	<th:block layout:fragment="script"/> -->
<script type="text/javascript">

$(function(){
    $.ajax({
        url: "itemlist5.do",
        type: "post",
        dataType: "json",
        success: function(data) {
            var str = JSON.stringify(data);
            var json = JSON.parse(str);

            var itemId = [];
            var itemCount = [];

            for (var i in json.nlist) {
                itemId.push(json.nlist[i].itemId);
                itemCount.push(json.nlist[i].amount);
            }

            // 차트를 생성하고 데이터를 설정
            var chartArea = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(chartArea, {
                type: 'bar',
                data: {
                    labels: [itemId[0], itemId[1], itemId[2], itemId[3], itemId[4]],
                    datasets: [{
                        label: '# of items',
                        data: [itemCount[0], itemCount[1], itemCount[2], itemCount[3], itemCount[4]],
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        },
        error: function(request, status, errorData) {
            console.log("error code : " + request.status 
                    + "\nMessage : " + request.responseText
                    + "\nError : " + errorData);
        }
    });
});
</script>
</body>
</html>