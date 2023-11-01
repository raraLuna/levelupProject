<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

		<footer class="footer" th:fragment="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<script>document.write(new Date().getFullYear())</script> © Team GS
					</div>
					<div class="col-sm-6">
						<div class="text-sm-end d-none d-sm-block">
							Design & Develop by Team GS
						</div>
					</div>
				</div>
			</div>
		</footer>


		<script src="resources/libs/jquery/jquery.min.js"></script>
		<script src="resources/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="resources/libs/metismenu/metisMenu.min.js"></script>
		<script src="resources/libs/simplebar/simplebar.min.js"></script>
		<script src="resources/libs/node-waves/waves.min.js"></script>
		<script src="resources/js/app.js"></script>
		
		<script type="text/javascript">
    var dataObj;
    $(function() {
        // 페이지 로딩 시 자동으로 데이터 가져오기
        $.ajax({
            url: 'calendarTDList.do',
            type: 'post',
            dataType: "json",
            success: function(data) {
            	dataObj = data;
                // JSON 데이터를 가져온 후 원하는 작업을 수행
                console.log(dataObj); // 데이터를 콘솔에 출력
                
                var output = $('#here').html();
                for (var i in dataObj.sclist) {
                    var schedule = dataObj.sclist[i];
                    output += '<a href="javascript: void(0);" onclick="updateSchedule(' + i + ')" class="text-reset notification-item"><div class="d-flex"><div class="avatar-xs me-3"><span class="avatar-title bg-primary rounded-circle font-size-16"><i class="fas fa-calendar-check"></i></span></div><div class="flex-grow-1"><h6 class="mb-1" key="t-your-order"></h6><div class="font-size-12 text-muted"><p class="mb-1" key="t-grammer">'
                    + decodeURIComponent(schedule.scheduleTitle).replace(/\+/gi, " ")
                    +'</p><p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span key="t-min-ago">' +
                    + schedule.scheduleStartday + '~' + schedule.scheduleEndday
                    + '</span></p></div></div></div></a>';
                }
                // 데이터 개수를 설정
                $('#notification-count').text(dataObj.sclist.length);
                
                // 테이블에 기록 처리
                $('#here').html(output);
            },
            error: function(request, status, errorData) {
                console.log("error code : " + request.status
                        + "\nMessage : " + request.responseText
                        + "\nError : " + errorData);
            }
        });
    });

    function updateSchedule(index) {
        // index를 사용하여 해당 스케줄에 대한 업데이트 작업 수행
        var schedule = dataObj.sclist[index];
        var t = "1";
        var scheduleData = {
        	scheduleId : schedule.scheduleId,
            read: t
        };

        $.ajax({
            type: "POST",
            url: "sreadup.do", // 스케줄을 업데이트하는 서버의 엔드포인트 URL
            contentType: "application/json; charset=utf-8", // 데이터 타입 설정
            data: JSON.stringify(scheduleData), // JSON 데이터 전송
            success: function (response) {
                if (response === "success") {
                    // 업데이트 성공 처리
                    window.location.href = "calendarList.do";
                    
                    // 필요한 추가 작업 수행
                } else {
                    // 업데이트 실패 처리
                    alert("스케줄 업데이트에 실패했습니다.");
                }
            },
            error: function (xhr, status, error) {
                // 에러 처리
                console.error("에러 발생: " + status + ", " + error);
            }
        });
    }
</script>
	
