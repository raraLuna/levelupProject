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

</head>
<body data-sidebar="dark" data-layout-mode="light">
<!-- 내비게이션바, 사이드바 등등 -->
<c:import url="/WEB-INF/views/common/layout.jsp"/>

<div class="main-content">
	<div class="page-content">
		

<c:import url="/WEB-INF/views/common/page-title.jsp"/>

<!-- 여기서부터 내용 작성 -->
<%-- 모든 유저 목록 출력 --%>

<div class="border border-3">
    <label for="departmentSelect">부서 선택:</label>
    <select id="departmentSelect">
        <option value="">전체</option>
        <option value="dev">Development</option>
        <option value="marketing">Marketing</option>
        <option value="trade">Trade</option>
        <option value="accounting">Accounting</option>
        <option value="none">None</option>
    </select>

    <label for="teamSelect">팀 선택:</label>
    <select id="teamSelect">
        <option value="">전체</option>
        <option value="backend">Backend Development</option>
        <option value="webfront">Web Frontend Development</option>
        <option value="anddev">Android Development</option>
        <option value="iosdev">iOS Development</option>
        <option value="cs">Customer Support</option>
    </select>

    <label for="rankSelect">직급 선택:</label>
    <select id="rankSelect">
        <option value="">전체</option>
        <option value="emp">Employee</option>
        <option value="intern">Intern</option>
        <option value="chief">Chief</option>
        <option value="senior">Senior</option>
        <option value="jman">Junior Manager</option>
        <option value="sman">Senior Manager</option>
        <option value="jdirec">Junior Director</option>
        <option value="direc">Director</option>
        <option value="ceo">CEO</option>
    </select>
    <button onclick="filterList()">필터 적용</button>
	<table class="table table-striped container">
		<tr>
			<th>employeeId</th>
			<th>departmentId</th>
			<th>teamId</th>
			<th>rankId</th>
			<th>employeeName</th>
			<th>employeeEmail</th>
			<th>employeeAddress</th>
			<th>employeePhone</th>
			<th>employeeBirthdate</th>
			<th>managerId</th>
		</tr>
		<c:forEach var="b" items="${ list }">
			<tr>
				<td align="center">${ b.employeeId }</td>
				<td align="center">${ b.departmentId }</td>
				<td align="center">${ b.teamId }</td>
				<td align="center">${ b.rankId }</td>
				<td align="center">${ b.employeeName }</td>
				<td align="center">${ b.employeeEmail }</td>
				<td align="center">${ b.employeeAddress }</td>
				<td align="center">${ b.employeePhone }</td>
				<td align="center">${ b.employeeBirthdate }</td>
				<td align="center">${ b.managerId }</td>
			</tr>
		</c:forEach>
	</table>
	
</div>
<br>

	
<c:import url="/WEB-INF/views/common/pagingView.jsp"/>


	 	<!-- container-fluid -->			
		
	<!-- page-content -->		
	</div>
<!-- 푸터(자바스크립트 로딩) -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</div> <!-- main-content -->
<script type="text/javascript">
//필터링하는 함수
function filterList() {
    var departmentId = document.getElementById("departmentSelect").value;
    var teamId = document.getElementById("teamSelect").value;
    var rankId = document.getElementById("rankSelect").value;

    var tableRows = document.querySelectorAll("table tr");
    
    tableRows.forEach(function (row) {
        var rowDepartmentId = row.getAttribute("data-departmentId");
        var rowTeamId = row.getAttribute("data-teamId");
        var rowRankId = row.getAttribute("data-rankId");

        if ((departmentId === "" || departmentId === rowDepartmentId) &&
            (teamId === "" || teamId === rowTeamId) &&
            (rankId === "" || rankId === rowRankId)) {
            row.style.display = "table-row";
        } else {
            row.style.display = "none";
        }
    });
}

// 초기에도 필터링 함수를 호출하여 전체 리스트를 표시
filterList();
</script>
</body>
</html>

