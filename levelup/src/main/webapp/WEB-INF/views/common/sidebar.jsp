<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

		<div class="vertical-menu">
			<div data-simplebar class="h-100">

				<!--- Sidemenu -->
				<div id="sidebar-menu">
					<!-- Left Menu Start -->
					<ul class="metismenu list-unstyled" id="side-menu">
						<li class="menu-title" key="t-menu">Menu</li>
						<!-- 고객센터 -->
						<li>
							<a href="javascript: void(0);" class="has-arrow waves-effect">
								<i class="bx bx-home-circle"></i>
								<span key="t-dashboards">고객센터</span>
							</a>
							<ul class="sub-menu" aria-expanded="false">
								<li><a href="${pageContext.servletContext.contextPath}/ilist.do" key="t-default">유저 문의</a></li>
								<li><a href="${pageContext.servletContext.contextPath}/moveusearch.do" key="t-default">유저 검색</a></li>
								<li><a href="${pageContext.servletContext.contextPath}/chardetailview.do" key="t-default">캐릭터 검색</a></li>
								<li><a href="ulist.do" key="t-default">유저 목록</a></li>
								<li><a href="listChar.do" key="t-default">게임캐럭터 목록</a></li>
								<li><a href="getLogs.do" key="t-default">캐럭터 게임로그 출력</a></li>
								<li><a href="${pageContext.servletContext.contextPath}/plist.do" key="t-default">전체 결제 내역</a></li>
							</ul>
						</li>
						
						<li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect" aria-expanded="true">
                                    <i class="bx bx-detail"></i>
                                    <span key="t-dashboards">기안관리</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false" style="">
                                    <li><a href="${pageContext.servletContext.contextPath}/mclist.do?employeeId=${ sessionScope.loginEmployee.employeeId }" key="t-blog-list">My 기안함</a></li>
                                    <li><a href="${pageContext.servletContext.contextPath}/clist.do" key="t-blog-list">전체 기안 목록</a></li>
                                </ul>
                            </li>
						
						
						<li>
								
								<a class="waves-effect" href="calendarList.do">
								<i class="dripicons-calendar"></i>
								<span key="t-dashboards">일정관리</span></a>
							
						</li>
						
						<li>
							<a href="javascript: void(0);" class="has-arrow waves-effect">
								<i class="dripicons-view-list-large"></i>
								<span key="t-dashboards">공지사항</span>
							</a>
							<ul class="sub-menu" aria-expanded="false">
								<li><a href="nlist.do" key="t-default">공지사항</a></li>
								<li><a href="ntlist.do" key="t-default">팀 공지사항</a></li>
								<li><a href="ndlist.do" key="t-default">부서 공지사항</a></li>
							</ul>
						</li>	
						
						<li>
								
								<a class="waves-effect" href="comlist.do">
								<i class="fas fa-file-alt"></i>
								<span key="t-dashboards">게시판</span></a>
							</a>
						</li>	
						
						<c:if test="${loginEmployee.rankId eq 'senior' || loginEmployee.rankId eq 'jman' || loginEmployee.rankId eq 'sman' || loginEmployee.rankId eq 'jdirec' || loginEmployee.rankId eq 'direc' || loginEmployee.rankId eq 'ceo'}">
						<li>
							<a href="javascript: void(0);" class="has-arrow waves-effect">
								<i class="fas fa-people-arrows"></i>
								<span key="t-dashboards">직원관리</span>
							</a>
							<ul class="sub-menu" aria-expanded="false">
								<li><a href="enrollEmppage.do" key="t-default">신규 직원 등록</a></li>
								<li><a href="elist.do" key="t-default">직원 리스트</a></li>
							</ul>
						</li>						
						</c:if>
						
						
						<li>
							<a href="javascript: void(0);" class="has-arrow waves-effect">
								<i class="far fa-chart-bar"></i>
								<span key="t-dashboards">데이터크롤링시각화</span>
							</a>
							<ul class="sub-menu" aria-expanded="false">
								<li><a href="runCrawling.do" key="t-default">데이터크롤링실행</a></li>
								<li><a href="steam.do" key="t-default">데이터시각화</a></li>
							</ul>
						</li>	

					<li>
						<a href="umain.do" class="waves-effect" >
						<i class="fas fa-store"></i>
						<span key="t-dashboards">유저 홈페이지</span></a></li>
					</ul>
				</div>
			</div>
			<!-- Sidebar -->


		</div>
