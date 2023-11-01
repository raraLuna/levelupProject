<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="./resources/css/empListView.css">
<script type="text/javascript"
	src="/levelup/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

</script>
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp" />
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp" />

</head>
<body data-sidebar="dark" data-layout-mode="light">
	<!-- 내비게이션바, 사이드바 등등 -->
	<c:import url="/WEB-INF/views/common/layout.jsp" />

	<div class="main-content">
		<div class="page-content">
			<div class="container-fluid">

				<c:import url="/WEB-INF/views/common/page-title.jsp" />

				<!-- 여기서부터 내용 작성 -->
				<div class="container">

					<!-- 타입별 검색 1. 전제, 환불문의, 게임문의, 기타문의 -->
					<!-- 타입별 검색 내 keyword  종류 : 유저ID, 제목, 날짜 -->
					<form action="usearch.do" method="post">
						<div class="container">
							<div class="inputs">
								<input type="radio" name="action" value="accound_id"><label>accound_id</label> <input
									type="radio" name="action" value="userid"><label>userid</label> <input
									type="radio" name="action" value="email"><label>email</label>
								<input id="keywordInputbox" type="search" name="keyword" required>
								<input id="searchSubmitButton" type="submit" value="SEARCH">
							</div>
						</div>
					</form>
					<!-- 유저 정보 테이블 -->
					<p><b> USER INFO </b></p>
					<table class="rwd-table">
						<tbody>
							<tr>
								<th>Account ID</th>
								<th>User ID</th>
								<th>Email</th>
								<th>Last login date</th>
								<th>Login count</th>
								<th>Last Login IP</th>
							</tr>
								<c:if test="${ !empty user }">
									<tr>
										<!-- ACCOUNT ID COLUMN -->
										<td data-th="Account ID">${ user.accountId }</td>
										<!-- USER ID COLUMN -->
										<td data-th="User ID">${ user.userId }</td>
										<!-- EMAIL COLUMN -->
										<td data-th="Email">${ user.email }</td>
										<!-- Last login date COLUMN -->
										<td data-th="Last login date"><fmt:formatDate
												value="${ user.lastlogin }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<!-- Login count COLUMN -->
										<td data-th="Login count">${ user.logincount }</td>
										<td data-th="Last Login IP">${ user.lastIp }</td>
									</tr>
								</c:if>
						</tbody>
					</table>
					<c:if test="${ !empty requestScope.message1 }">
						<p><b>${ requestScope.message1 }</b></p>>
					</c:if>
					<br>
					<!-- 유저의 캐릭터 정보 테이블 -->
					<p><b>USER'S CHARACTER INFO</b></p>
					<table class="rwd-table">
						<tbody>
							<tr>
								<th>Char ID</th>
								<th>Char Name</th>
								<th>Level</th>
								<th>Job Level</th>
								<th>Zeny</th>
								<th>Str</th>
								<th>Agi</th>
								<th>Vit</th>
								<th>Int</th>
								<th>Dex</th>
								<th>Luk</th>
								<th>Action</th>
							</tr>
								<c:if test="${ !empty list }">
									<c:forEach items="${ requestScope.list }" var="c">
										<tr>
											<!-- Char ID COLUMN -->
											<td data-th="Char ID">${ c.charId }</td>
											<!-- Char Name COLUMN -->
											<td data-th="Char Name">${ c.name }</td>
											<!-- Level COLUMN -->
											<td data-th="Level">${ c.baseLevel }</td>
											<!-- Job Level COLUMN -->
											<td data-th="Job Level">${ c.jobLevel }</td>
											<!-- Zeny COLUMN -->
											<td data-th="Zeny">${ c.zeny }</td>
											<!-- Str COLUMN -->
											<td data-th="Str">${ c.str }</td>
											<!-- Agi COLUMN -->
											<td data-th="Agi">${ c.agi }</td>
											<!-- Vit COLUMN -->
											<td data-th="Vit">${ c.vit }</td>
											<!-- Int COLUMN -->
											<td data-th="Int">${ c.int_ }</td>
											<!-- Dex COLUMN -->
											<td data-th="Dex">${ c.dex }</td>
											<!-- Luk COLUMN -->
											<td data-th="Luk">${ c.luk }</td>
											<td data-th="Action"><a href="javascript:location.href='${ pageContext.servletContext.contextPath }/charsearch.do?keyword=${ c.charId }'" class="btn btn-primary waves-effect waves-light">View Details</a></td>
										</tr>
									</c:forEach>
								</c:if>
						</tbody>
					</table>
					<c:if test="${ !empty requestScope.message2 }">
						<p><b>${ requestScope.message2 }</b></p>>
					</c:if>
				</div>
				<!-- container-fluid -->
			</div>
			<!-- page-content -->
		</div>
		<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- main-content -->

</body>
</html>

