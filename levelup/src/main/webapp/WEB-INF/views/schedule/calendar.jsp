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
<c:import url="/WEB-INF/views/common/title-meta.jsp"/>
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp"/>

	<link rel="stylesheet" type="text/css" href="resources/libs/tui-time-picker/tui-time-picker.min.css">
	<link rel="stylesheet" type="text/css" href="resources/libs/tui-date-picker/tui-date-picker.min.css">
	<link href="resources/libs/tui-calendar/tui-calendar.min.css" rel="stylesheet" type="text/css" />

</head>
<body data-sidebar="dark" data-layout-mode="light">
<!-- 내비게이션바, 사이드바 등등 -->
<c:import url="/WEB-INF/views/common/layout.jsp"/>

<div class="main-content">
	<div class="page-content">
		<div class="container-fluid">

<c:import url="/WEB-INF/views/common/page-title.jsp"/>


									
				<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<div id="lnb">

										<div id="right">
											<div id="menu" class="mb-3">

												<span id="menu-navi"
													class="d-sm-flex flex-wrap text-center text-sm-start justify-content-sm-between">
													<div class="d-sm-flex flex-wrap gap-1">
														<div class="btn-group mb-2" role="group"
															aria-label="Basic example">
															<button type="button" class="btn btn-primary move-day"
																data-action="move-prev">
																<i class="calendar-icon ic-arrow-line-left mdi mdi-chevron-left"
																	data-action="move-prev"></i>Previous
															</button>
															<button type="button" class="btn btn-primary move-day"
																data-action="move-next">Next
																<i class="calendar-icon ic-arrow-line-right mdi mdi-chevron-right"
																	data-action="move-next"></i>
															</button>
														</div>


														<button type="button" class="btn btn-primary move-today mb-2"
															data-action="move-today">현재 날짜</button>
													</div>

													<h4 id="renderRange" class="render-range fw-bold pt-1 mx-3"></h4>

													<div class="dropdown align-self-start mt-3 mt-sm-0 mb-2">
														<button id="dropdownMenu-calendarType" class="btn btn-primary"
															type="button" data-bs-toggle="dropdown" aria-haspopup="true"
															aria-expanded="true">
															<i id="calendarTypeIcon" class="calendar-icon ic_view_month"
																style="margin-right: 4px;"></i>
															<span id="calendarTypeName">Dropdown</span>&nbsp;
															<i
																class="calendar-icon tui-full-calendar-dropdown-arrow"></i>
														</button>
														<ul class="dropdown-menu dropdown-menu-end" role="menu"
															aria-labelledby="dropdownMenu-calendarType">
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-daily">
																	<i class="calendar-icon ic_view_day"></i>일간
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-weekly">
																	<i class="calendar-icon ic_view_week"></i>주간
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-monthly">
																	<i class="calendar-icon ic_view_month"></i>월간
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-weeks2">
																	<i class="calendar-icon ic_view_week"></i>2주 단위
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-weeks3">
																	<i class="calendar-icon ic_view_week"></i>3주 단위
																</a>
															</li>
															<li role="presentation" class="dropdown-divider"></li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-workweek">
																	<input type="checkbox"
																		class="tui-full-calendar-checkbox-square"
																		value="toggle-workweek" checked>
																	<span class="checkbox-title"></span>주말 포함 보기
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-start-day-1">
																	<input type="checkbox"
																		class="tui-full-calendar-checkbox-square"
																		value="toggle-start-day-1">
																	<span class="checkbox-title"></span>월요일 시작 보기
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-narrow-weekend">
																	<input type="checkbox"
																		class="tui-full-calendar-checkbox-square"
																		value="toggle-narrow-weekend">
																	<span class="checkbox-title"></span>주말 작게 보기
																</a>
															</li>
														</ul>
													</div>
												</span>

											</div>
										</div>

										<div class="lnb-new-schedule float-sm-end ms-sm-3 mt-4 mt-sm-0">
											<button id="btn-new-schedule" type="button"
												class="btn btn-primary lnb-new-schedule-btn" data-toggle="modal">
												새 일정 추가하기</button>
										</div>
										<div id="calendarList" class="lnb-calendars-d1 mt-4 mt-sm-0 me-sm-0 mb-4"></div>

										

									</div>
								</div>
								<div id="calendar" style="height: 800px;"></div>
						
					<!-- end row -->

	 	<!-- container-fluid -->			
		</div>
	<!-- page-content -->		
	</div>
<!-- 푸터(자바스크립트 로딩) -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>


</div> <!-- main-content -->
		
		<!-- Add jQuery -->

		<script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>
		<script src="resources/libs/tui-dom/tui-dom.min.js"></script>
		<script src="resources/libs/tui-time-picker/tui-time-picker.min.js"></script>
		<script src="resources/libs/tui-date-picker/tui-date-picker.min.js"></script>
		<script src="resources/libs/moment/min/moment.min.js"></script>
		<script src="resources/libs/chance/chance.min.js"></script>
		<script src="resources/libs/tui-calendar/tui-calendar.min.js"></script>
		<script src="resources/js/pages/calendars.js"></script>
		<!-- <script src="resources/js/pages/calendar.init.js"></script> -->

		
<script type="text/javascript">
var scheduleList = [];


<c:forEach var="s" items="${ calendarList }">
 var schedule = {
	 id: "${s.scheduleId}",
     calendarId: "${s.scheduleType}",
     title: "${s.scheduleTheme}",
     isAllDay: "${s.scheduleContent}" == "false" ? false : true, // 
     start: "${s.scheduleStartday}",
     end: "${s.scheduleEndday}",
     category: 'time',
     isReadOnly: "${loginEmployee.employeeId}" != "${s.employeeId}" ? true : false // schedule is read-only
	};
	scheduleList.push(schedule);
</c:forEach>


"use strict";
! function(e, t) {
    var l, n, c, i, a = !0;
    
    function o(e, t) {
        var n = [],
            a = moment(e.start.toUTCString());
        return t || n.push("<strong>" + a.format("HH:mm") + "</strong> "), e.isPrivate ? (n.push('<span class="calendar-font-icon ic-lock-b"></span>'), n.push(" Private")) : (e.isReadOnly ? n.push('<span class="calendar-font-icon ic-readonly-b"></span>') : e.recurrenceRule ? n.push('<span class="calendar-font-icon ic-repeat-b"></span>') : e.attendees.length ? n.push('<span class="calendar-font-icon ic-user-b"></span>') : e.location && n.push('<span class="calendar-font-icon ic-location-b"></span>'), n.push(" " + e.title)), n.join("")
    }

    function r(e) {
        var t = $(e.target).closest('a[role="menuitem"]')[0],
            n = f(t),
            a = l.getOptions(),
            o = "";
        switch (console.log(t), console.log(n), n) {
            case "toggle-daily":
                o = "day";
                break;
            case "toggle-weekly":
                o = "week";
                break;
            case "toggle-monthly":
                a.month.visibleWeeksCount = 0, o = "month";
                break;
            case "toggle-weeks2":
                a.month.visibleWeeksCount = 2, o = "month";
                break;
            case "toggle-weeks3":
                a.month.visibleWeeksCount = 3, o = "month";
                break;
            case "toggle-narrow-weekend":
                a.month.narrowWeekend = !a.month.narrowWeekend, a.week.narrowWeekend = !a.week.narrowWeekend, o = l.getViewName(), t.querySelector("input").checked = a.month.narrowWeekend;
                break;
            case "toggle-start-day-1":
                a.month.startDayOfWeek = a.month.startDayOfWeek ? 0 : 1, a.week.startDayOfWeek = a.week.startDayOfWeek ? 0 : 1, o = l.getViewName(), t.querySelector("input").checked = a.month.startDayOfWeek;
                break;
            case "toggle-workweek":
                a.month.workweek = !a.month.workweek, a.week.workweek = !a.week.workweek, o = l.getViewName(), t.querySelector("input").checked = !a.month.workweek
        }
        l.setOptions(a, !0), l.changeView(o, !0), k(), p(), w()
    }

    function d(e) {
        switch (f(e.target)) {
            case "move-prev":
                l.prev();
                break;
            case "move-next":
                l.next();
                break;
            case "move-today":
                l.today();
                break;
            default:
                return
        }
        p(), w()
    }

    function s() {
        var e = $("#new-schedule-title").val(),
            t = $("#new-schedule-location").val(),
            n = document.getElementById("new-schedule-allday").checked,
            a = c.getStartDate(),
            o = c.getEndDate(),
            r = i || CalendarList[0];
        e && (l.createSchedules([{
            id: String(chance.guid()),
            calendarId: r.id,
            title: e,
            isAllDay: n,
            start: a,
            end: o,
            category: n ? "allday" : "time",
            dueDateClass: "",
            color: r.color,
            bgColor: r.bgColor,
            dragBgColor: r.bgColor,
            borderColor: r.borderColor,
            raw: {
                location: t
            },
            state: "Busy"
        }]), $("#modal-new-schedule").modal("hide"))
    }

    function u(e) {
        var t, n, a, o, r = f($(e.target).closest('a[role="menuitem"]')[0]);
        t = r, n = document.getElementById("calendarName"), a = findCalendar(t), (o = []).push('<span class="calendar-bar" style="background-color: ' + a.bgColor + "; border-color:" + a.borderColor + ';"></span>'), o.push('<span class="calendar-name">' + a.name + "</span>"), n.innerHTML = o.join(""), i = a
    }

    function g(e) {
        var t = e.start ? new Date(e.start.getTime()) : new Date,
            n = e.end ? new Date(e.end.getTime()) : moment().add(1, "hours").toDate();
        a && l.openCreationPopup({
            start: t,
            end: n
        })
    }

    function m(e) {
        var t = e.target.value,
            n = e.target.checked,
            a = document.querySelector(".lnb-calendars-item input"),
            o = Array.prototype.slice.call(document.querySelectorAll("#calendarList input")),
            r = !0;
        "all" === t ? (r = n, o.forEach(function(e) {
            var t = e.parentNode;
            e.checked = n, t.style.backgroundColor = n ? t.style.borderColor : "transparent"
        }), CalendarList.forEach(function(e) {
            e.checked = n
        })) : (findCalendar(t).checked = n, r = o.every(function(e) {
            return e.checked
        }), a.checked = !!r), h()
    }

    function h() {
        var e = Array.prototype.slice.call(document.querySelectorAll("#calendarList input"));
        CalendarList.forEach(function(e) {
            l.toggleSchedules(e.id, !e.checked, !1)
        }), l.render(!0), e.forEach(function(e) {
            var t = e.nextElementSibling;
            t.style.backgroundColor = e.checked ? t.style.borderColor : "transparent"
        })
    }

    function k() {
        var e = document.getElementById("calendarTypeName"),
            t = document.getElementById("calendarTypeIcon"),
            n = l.getOptions(),
            a = l.getViewName(),
            o = "day" === a ? (a = "Daily", "calendar-icon ic_view_day") : "week" === a ? (a = "Weekly", "calendar-icon ic_view_week") : 2 === n.month.visibleWeeksCount ? (a = "2 weeks", "calendar-icon ic_view_week") : 3 === n.month.visibleWeeksCount ? (a = "3 weeks", "calendar-icon ic_view_week") : (a = "Monthly", "calendar-icon ic_view_month");
        e.innerHTML = a, t.className = o
    }

    function p() {
        var e = document.getElementById("renderRange"),
            t = l.getOptions(),
            n = l.getViewName(),
            a = [];
        "day" === n ? a.push(moment(l.getDate().getTime()).format("YYYY.MM.DD")) : "month" === n && (!t.month.visibleWeeksCount || 4 < t.month.visibleWeeksCount) ? a.push(moment(l.getDate().getTime()).format("YYYY.MM")) : (a.push(moment(l.getDateRangeStart().getTime()).format("YYYY.MM.DD")), a.push(" ~ "), a.push(moment(l.getDateRangeEnd().getTime()).format(" MM.DD"))), e.innerHTML = a.join("")
    }
    
    function w() {
        l.clear(), l.createSchedules(scheduleList);
    }
    
    

	   
    function f(e) {
        return e.dataset ? e.dataset.action : e.getAttribute("data-action")
    }(l = new t("#calendar", {
        defaultView: "month",
        useCreationPopup: a,
        useDetailPopup: !0,
        calendars: CalendarList,
        template: {
            milestone: function(e) {
                return '<span class="calendar-font-icon ic-milestone-b"></span> <span style="background-color: ' + e.bgColor + '">' + e.title + "</span>"
            },
            allday: function(e) {
                return o(e, !0)
            },
            time: function(e) {
                return o(e, !1)
            }
        }
    })).on({
        clickMore: function(e) {
            console.log("clickMore", e)
        },
        clickSchedule: function(e) {
            console.log("clickSchedule", e)
        },
        clickDayname: function(e) {
            console.log("clickDayname", e)
        },
        beforeCreateSchedule: function(e) {
            console.log("beforeCreateSchedule", e),
                function(e) {
                    var t = e.calendar || findCalendar(e.calendarId),
                        n = {
                            id: String(chance.guid()),
                            title: e.title,
                            isAllDay: e.isAllDay,
                            start: e.start,
                            end: e.end,
                            category: e.isAllDay ? "allday" : "time",
                            dueDateClass: "",
                            color: t.color,
                            bgColor: t.bgColor,
                            dragBgColor: t.bgColor,
                            borderColor: t.borderColor,
                            location: e.location,
                            raw: {
                                class: e.raw.class
                            },
                            state: e.state
                        };
                    t && (n.calendarId = t.id, n.color = t.color, n.bgColor = t.bgColor, n.borderColor = t.borderColor);
                    console.log("n" + n);
                    console.log("t" + t);
                    console.log("e" + e);
                    nnn = n, ttt = t, eee = e;
                    
                    
                    //이부분
                    var scheduleData = {
				    scheduleId: n.id,
				    employeeId: "${loginEmployee.employeeId}",
				    departmentId: "${loginEmployee.departmentId}",
				    teamId: "${loginEmployee.teamId}",
				    rankId: "${loginEmployee.rankId}",
				    scheduleStartday: e.start._date,
				    scheduleEndday: e.end._date,
				    scheduleType: t.id,
				    scheduleAddress: n.isAllDay == "allday" ? "allday" : "time",
				    scheduleTheme: n.title,
				    scheduleContent: n.isAllDay
				    // 나머지 필드를 추가
					};
                    
                    $.ajax({
                        type: "POST",
                        url: "sinsert.do", // 스케줄을 등록하는 서버의 엔드포인트 URL
                        contentType: "application/json; charset=utf-8", // 데이터 타입 설정
                        data: JSON.stringify(scheduleData), // JSON 데이터 전송
                        success: function (response) {
                            if (response === "success") {
                                // 등록 성공 처리
                                alert("스케줄이 성공적으로 등록되었습니다.");
                                l.createSchedules([n]), h()
                                // 추가로 필요한 작업 수행
                            } else {
                                // 등록 실패 처리
                                alert("스케줄 등록에 실패했습니다.");
                            }
                        },
                        error: function (xhr, status, error) {
                            // 에러 처리
                            console.error("에러 발생: " + status + ", " + error);
                        }
                    });
                    
                    
                   // l.createSchedules([n]), h()
                }(e)
        },
        beforeUpdateSchedule: function(e) {
            var t = e.schedule,
                n = e.changes;
            e
            console.log("t" + t);
            console.log("n" + n);
            nnn = e.changes, ttt = e.schedule;
          //이부분
          
            /* var scheduleData = {
		    scheduleId: t.id,
		    employeeId: "${loginEmployee.employeeId}",
		    departmentId: "${loginEmployee.departmentId}",
		    teamId: "${loginEmployee.teamId}",
		    rankId: "${loginEmployee.rankId}",
		    scheduleStartday: t.start._date,
		    scheduleEndday: t.end._date,
		    scheduleType: t.calendarId,
		    scheduleAddress: "",
		    scheduleTheme: (n.title != null) ? n.title : t.title,
		    scheduleContent: (n.isAllDay != null) ? n.isAllDay : t.isAllDay
            }; */
            
            var scheduleData = {
   		    scheduleId: t.id,
   		    employeeId: "${loginEmployee.employeeId}",
   		    departmentId: "${loginEmployee.departmentId}",
   		    teamId: "${loginEmployee.teamId}",
   		    rankId: "${loginEmployee.rankId}",
   			scheduleStartday: e.start._date,
		    scheduleEndday: e.end._date,
   		    scheduleType: (n.calendarId != null) ? n.calendarId : t.calendarId,
   		    scheduleAddress: "",
   			scheduleTheme: (n.title != null) ? n.title : t.title,
   			scheduleContent: (n.isAllDay != null) ? n.isAllDay : t.isAllDay	
            
            };
                 
		    // 나머지 필드를 추가
			
            
            $.ajax({
                type: "POST",
                url: "supdate.do", // 스케줄을 등록하는 서버의 엔드포인트 URL
                contentType: "application/json; charset=utf-8", // 데이터 타입 설정
                data: JSON.stringify(scheduleData), // JSON 데이터 전송
                success: function (response) {
                    if (response === "success") {
                        // 등록 성공 처리
                        alert("스케줄이 성공적으로 수정되었습니다.");
                        l.updateSchedule(t.id, t.calendarId, n)
                        // 추가로 필요한 작업 수행
                    } else {
                        // 등록 실패 처리
                        alert("스케줄 수정에 실패했습니다.");
                    }
                },
                error: function (xhr, status, error) {
                    // 에러 처리
                    console.error("에러 발생: " + status + ", " + error);
                }
            });
            console.log("beforeUpdateSchedule", e), l.updateSchedule(t.id, t.calendarId, n), h()
        },
        beforeDeleteSchedule: function(e) {
            var t = e.schedule;
            ttt = t;
            var confirmation = confirm("스케줄을 삭제하시겠습니까?");
            if (confirmation) {
                $.ajax({
                    type: "POST",
                    url: "sdelete.do", // 스케줄을 등록하는 서버의 엔드포인트 URL
                    contentType: "application/json; charset=utf-8", // 데이터 타입 설정
                    data: JSON.stringify({ scheduleId: t.id }),
                    dataType: "text", 
                    success: function (response) {
                        if (response === "success") {
                            // 등록 성공 처리
                            alert("스케줄이 성공적으로 삭제되었습니다.");
                            l.deleteSchedule(e.schedule.id, e.schedule.calendarId);
                        } else {
                            // 등록 실패 처리
                            alert("스케줄 삭제에 실패했습니다.");
                        }
                    },
                    error: function (xhr, status, error) {
                        // 에러 처리
                        console.error("에러 발생: " + status + ", " + error);
                        l.deleteSchedule(e.schedule.id, e.schedule.calendarId);
                    }
                });
            } else {
                console.log("사용자가 삭제를 취소했습니다.");
            }
            console.log("beforeDeleteSchedule", e); 
        }
,
        afterRenderSchedule: function(e) {
            e.schedule
        },
        clickTimezonesCollapseBtn: function(e) {
            return console.log("timezonesCollapsed", e), e ? l.setTheme({
                "week.daygridLeft.width": "77px",
                "week.timegridLeft.width": "77px"
            }) : l.setTheme({
                "week.daygridLeft.width": "60px",
                "week.timegridLeft.width": "60px"
            }), !0
        }
    }), n = tui.util.throttle(function() {
        l.render()
    }, 50), e.cal = l, k(), p(), w(), $("#menu-navi").on("click", d), $('.dropdown-menu a[role="menuitem"]').on("click", r), $("#lnb-calendars").on("change", m), $("#btn-save-schedule").on("click", s), $("#btn-new-schedule").on("click", g), $("#dropdownMenu-calendars-list").on("click", u), e.addEventListener("resize", n)
}(window, tui.Calendar),
function() {
    var e = document.getElementById("calendarList"),
        t = [];
    CalendarList.forEach(function(e) {
        t.push('<div class="lnb-calendars-item"><label><input type="checkbox" class="tui-full-calendar-checkbox-round" value="' + e.id + '" checked><span style="border-color: ' + e.borderColor + "; background-color: " + e.borderColor + ';"></span><span>' + e.name + "</span></label></div>")
    }), e.innerHTML = t.join("\n")
}();



</script>





</body>
</html>

