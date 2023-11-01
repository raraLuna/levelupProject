<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<header id="page-topbar">
	<div class="navbar-header">
		<div class="d-flex">
			<!-- LOGO -->
			<div class="navbar-brand-box">
				<a href="main.do" class="logo logo-dark"> <span class="logo-sm">
						<img src="resources/images/logo/levelup_logo.png" alt=""
						height="60">
				</span> <span class="logo-lg"> <img
						src="resources/images/logo/rubik.png" alt="" height="60">
				</span>
				</a> <a href="main.do" class="logo logo-light"> <span
					class="logo-sm"> <img
						src="resources/images/logo/levelup_logo.png" alt="" height="22">
				</span> <span class="logo-lg"> <img
						src="resources/images/logo/levelup_logo.png" alt="" height="60">
				</span>
				</a>
			</div>

			<button type="button"
				class="btn btn-sm px-3 font-size-16 d-lg-none header-item waves-effect waves-light"
				data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
				<i class="fa fa-fw fa-bars"></i>
			</button>

			<!-- App Search-->
			<form class="app-search d-none d-lg-block" action="comSearch.do">
				<div class="position-relative">
					<input type="search" name="keyword" class="form-control" placeholder="게시판 검색(제목, 본문, 작성자, 파일명)">
					<span class="bx bx-search-alt"></span>
				</div>
			</form>

			
		</div>

		<div class="d-flex">

			<div class="dropdown d-inline-block d-lg-none ms-2">
				<button type="button" class="btn header-item noti-icon waves-effect"
					id="page-header-search-dropdown" data-bs-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">
					<i class="mdi mdi-magnify"></i>
				</button>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
					aria-labelledby="page-header-search-dropdown">

					<form class="p-3"  action="comSearch.do">
						<div class="form-group m-0">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="게시판 검색(제목, 본문, 작성자, 파일명)"
									aria-label="Search input">

								<button class="btn btn-primary" type="submit">
									<i class="mdi mdi-magnify"></i>
								</button>
								
							</div>
						</div>
					</form>
				</div>
			</div>

			
			<div class="dropdown d-none d-lg-inline-block ms-1">
				<button type="button" class="btn header-item noti-icon waves-effect"
					data-bs-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
					<i class="bx bx-customize"></i>
				</button>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
					<div class="px-lg-2">
						<div class="row g-0">
							<div class="px-lg-2">
								<div class="row g-0">
									<div class="col">
										<a class="dropdown-icon-item"
											href="https://github.com/kazz900/levelup" target="_blank">
											<img src="resources/images/brands/github.png" alt="Github">
											<span>GitHub</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="dropdown d-none d-lg-inline-block ms-1">
				<button type="button" class="btn header-item noti-icon waves-effect"
					data-bs-toggle="fullscreen">
					<i class="bx bx-fullscreen"></i>
				</button>
			</div>

			<div class="dropdown d-inline-block">
				<button type="button" class="btn header-item noti-icon waves-effect"
					id="page-header-notifications-dropdown" data-bs-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">
					<i class="bx bx-bell bx-tada"></i> <span class="badge bg-danger rounded-pill" id="notification-count">0</span>
				</button>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
					aria-labelledby="page-header-notifications-dropdown">
					<div class="p-3">
						<div class="row align-items-center">
							<div class="col">
								<h6 class="m-0" key="t-notifications">오늘 일정</h6>
							</div>
							<div class="col-auto">
								<a href="calendarList.do" class="small" key="t-view-all">일정 페이지로</a>
							</div>
						</div>
					</div>
					<div data-simplebar="init" style="max-height: 230px;">
						<div class="simplebar-wrapper" style="margin: 0px;">
							<div class="simplebar-height-auto-observer-wrapper">
								<div class="simplebar-height-auto-observer"></div>
							</div>
							<div class="simplebar-mask">
								<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
									<div class="simplebar-content-wrapper"
										style="height: auto; overflow: hidden;">
										
										<!-- 여기! -->
										
										<div class="simplebar-content" id="here" style="padding: 0px;">

											
											
												
											


										</div>
										
									</div>
								</div>
							</div>
							<div class="simplebar-placeholder"
								style="width: 0px; height: 0px;"></div>
						</div>
						<div class="simplebar-track simplebar-horizontal"
							style="visibility: hidden;">
							<div class="simplebar-scrollbar"
								style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
						</div>
						<div class="simplebar-track simplebar-vertical"
							style="visibility: hidden;">
							<div class="simplebar-scrollbar"
								style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
						</div>
					</div>
					<div class="p-2 border-top d-grid">
						<a class="btn btn-sm btn-link font-size-14 text-center"
							href="calendarList.do"> <i
							class="mdi mdi-arrow-right-circle me-1"></i> <span
							key="t-view-more">View More..</span>
						</a>
					</div>
				</div>
			</div>
			<div class="text">
				<button type="button" class="btn header-item waves-effect"
					id="departmentName">
					<span class="d-none d-xl-inline-block ms-1" key="t-henry">${ sessionScope.loginEmployee.departmentId }</span>
					<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
				</button>
				
			</div>
			<div class="text">
				<button type="button" class="btn header-item waves-effect"
					id="teamName">
					<span class="d-none d-xl-inline-block ms-1" key="t-henry">${ sessionScope.loginEmployee.teamId }</span>
					<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
				</button>
				
			</div>
			<div class="text">
				<button type="button" class="btn header-item waves-effect"
					id="rankName">
					<span class="d-none d-xl-inline-block ms-1" key="t-henry">${ sessionScope.loginEmployee.rankId }</span>
					<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
				</button>
				
			</div>
			
			<div class="dropdown d-inline-block">
				<button type="button" class="btn header-item waves-effect"
					id="page-header-user-dropdown" data-bs-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">
					<span class="d-none d-xl-inline-block ms-1" key="t-henry">${ sessionScope.loginEmployee.employeeName }</span>
					<i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
				</button>
				<div class="dropdown-menu dropdown-menu-end">
					<!-- item-->
					<!-- 
					<a class="dropdown-item" href="#"><i
						class="bx bx-user font-size-16 align-middle me-1"></i> <span
						key="t-profile">Profile</span></a> <a class="dropdown-item" href="#"><i
						class="bx bx-wallet font-size-16 align-middle me-1"></i> <span
						key="t-my-wallet">My Wallet</span></a> <a
						class="dropdown-item d-block" href="#"><span
						class="badge bg-success float-end">11</span><i
						class="bx bx-wrench font-size-16 align-middle me-1"></i> <span
						key="t-settings">Settings</span></a> <a class="dropdown-item"
						href="/auth/lock-screen"><i
						class="bx bx-lock-open font-size-16 align-middle me-1"></i> <span
						key="t-lock-screen">Lock screen</span></a>
					<div class="dropdown-divider"></div>
					 -->
					<a class="dropdown-item text-danger"
						href="${pageContext.servletContext.contextPath}/elogout.do"><i
						class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i>
						<span key="t-logout">Logout</span></a>
				</div>
			</div>

			<div class="dropdown d-inline-block">
				<button type="button"
					class="btn header-item noti-icon right-bar-toggle waves-effect">
					<i class="bx bx-cog bx-spin"></i>
				</button>
			</div>

		</div>
	</div>
	<script>
	var rankId = "${ sessionScope.loginEmployee.rankId }";
	var teamId = "${ sessionScope.loginEmployee.teamId }";
	var departmentId = "${ sessionScope.loginEmployee.departmentId }";

	var rankName = "";
	if (rankId === "emp") {
	    rankName = "사원";
	} else if (rankId === "intern") {
	    rankName = "인턴";
	} else if (rankId === "chief") {
	    rankName = "주임";
	} else if (rankId === "senior") {
	    rankName = "대리";
	} else if (rankId === "jman") {
	    rankName = "과장";
	} else if (rankId === "sman") {
	    rankName = "차장";
	} else if (rankId === "jdirec") {
	    rankName = "전무";
	} else if (rankId === "direc") {
	    rankName = "이사";
	} else if (rankId === "ceo") {
	    rankName = "CEO";
	} else {
	    // 기타 경우에 대한 처리
	}

	var teamName = "";
	if (teamId === "none") {
	    teamName = "총괄";
	} else if (teamId === "backend") {
	    teamName = "백엔드";
	} else if (teamId === "webfront") {
	    teamName = "프론트개발";
	} else if (teamId === "anddev") {
	    teamName = "안드로이드개발";
	} else if (teamId === "iosdev") {
	    teamName = "iOS개발";
	} else if (teamId === "cs") {
	    teamName = "고객서비스";
	} else {
	    // 기타 경우에 대한 처리
	}

	var departmentName = "";
	if (departmentId === "dev") {
	    departmentName = "개발부";
	} else if (departmentId === "marketing") {
	    departmentName = "영업부";
	} else if (departmentId === "trade") {
	    departmentName = "무역부";
	} else if (departmentId === "accounting") {
	    departmentName = "경리부";
	} else if (departmentId === "none") {
	    departmentName = "총괄";
	} else {
	    // 기타 경우에 대한 처리
	}

    document.getElementById("rankName").innerHTML = rankName;
    document.getElementById("teamName").innerHTML = teamName;
    document.getElementById("departmentName").innerHTML = departmentName	;
</script>
	


</header>
