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
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp"/>
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

</head>
<body data-sidebar="dark" data-layout-mode="light">
<!-- 내비게이션바, 사이드바 등등 -->
<c:import url="/WEB-INF/views/common/layout.jsp"/>

<div class="main-content">
	<div class="page-content">
		<div class="container-fluid">

<c:import url="/WEB-INF/views/common/page-title.jsp"/>

<!-- 여기서부터 내용 작성 -->

	
						<div class="col-6 border border3 pt-3 pb-3">
						<div text-align: center;">
							<canvas id="myChart" width="100%" height="100%"></canvas>
						</div>
						</div>



	 	<!-- container-fluid -->			
		</div>
	<!-- page-content -->		
	</div>
<!-- 푸터(자바스크립트 로딩) -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</div> <!-- main-content -->
<c:if test=""></c:if>

<script type="text/javascript">

$(function(){

            var itemId = [];
            var itemCount = [];
            
<c:forEach var="b" items="${ list }">
            itemId.push(`${b.name}`);
            itemCount.push(${b.meta});
</c:forEach>
            // 차트를 생성하고 데이터를 설정
            var chartArea = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(chartArea, {
                type: 'bar',
                data: {
                    labels: itemId,
                    datasets: [{
                        label: '전세계 온라인 게임 동시접속자수 (Steam)',
                        data: itemCount,
                        //backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        //borderColor: 'rgba(255, 99, 132, 1)',
                        backgroundColor: 'rgba(11, 238, 49, 0.49)',
                        borderColor: 'rgba(11, 238, 49, 0.9)',
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
        });
//    });
//});
</script>
</body>
</html>

