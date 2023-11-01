"use strict";
var CalendarList = [];

function CalendarInfo() {
    this.id = null, this.name = null, this.checked = !0, this.color = null, this.bgColor = null, this.borderColor = null, this.dragBgColor = null
}

function addCalendar(r) {
    CalendarList.push(r)
}

function findCalendar(a) {
    var o;
    return CalendarList.forEach(function(r) {
        r.id === a && (o = r)
    }), o || CalendarList[0]
}

function hexToRGBA(r) {
    return "rgba(" + parseInt(r.slice(1, 3), 16) + ", " + parseInt(r.slice(3, 5), 16) + ", " + parseInt(r.slice(5, 7), 16) + ", " + (parseInt(r.slice(7, 9), 16) / 255 || 1) + ")"
}! function() {
    var r = new CalendarInfo;
    r.id = String(1), r.name = "내 일정", r.color = "#ffffff", r.bgColor = "#bbdc00", r.dragBgColor = "#bbdc00", r.borderColor = "#bbdc00", addCalendar(r), (r = new CalendarInfo).id = String(2), r.name = "부서 일정", r.color = "#ffffff", r.bgColor = "#556ee6", r.dragBgColor = "#556ee6", r.borderColor = "#556ee6", addCalendar(r), (r = new CalendarInfo).id = String(3), r.name = "팀 일정", r.color = "#ffffff", r.bgColor = "#f46a6a", r.dragBgColor = "#f46a6a", r.borderColor = "#f46a6a", addCalendar(r)
}();