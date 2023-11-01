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

<!-- 여기서부터 내용 작성 -->

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
																	data-action="move-prev"></i>
															</button>
															<button type="button" class="btn btn-primary move-day"
																data-action="move-next">
																<i class="calendar-icon ic-arrow-line-right mdi mdi-chevron-right"
																	data-action="move-next"></i>
															</button>
														</div>


														<button type="button" class="btn btn-primary move-today mb-2"
															data-action="move-today">Today</button>
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
																	<i class="calendar-icon ic_view_day"></i>Daily
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-weekly">
																	<i class="calendar-icon ic_view_week"></i>Weekly
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-monthly">
																	<i class="calendar-icon ic_view_month"></i>Month
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-weeks2">
																	<i class="calendar-icon ic_view_week"></i>2 weeks
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-weeks3">
																	<i class="calendar-icon ic_view_week"></i>3 weeks
																</a>
															</li>
															<li role="presentation" class="dropdown-divider"></li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-workweek">
																	<input type="checkbox"
																		class="tui-full-calendar-checkbox-square"
																		value="toggle-workweek" checked>
																	<span class="checkbox-title"></span>Show weekends
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-start-day-1">
																	<input type="checkbox"
																		class="tui-full-calendar-checkbox-square"
																		value="toggle-start-day-1">
																	<span class="checkbox-title"></span>Start Week on
																	Monday
																</a>
															</li>
															<li role="presentation">
																<a class="dropdown-item" role="menuitem"
																	data-action="toggle-narrow-weekend">
																	<input type="checkbox"
																		class="tui-full-calendar-checkbox-square"
																		value="toggle-narrow-weekend">
																	<span class="checkbox-title"></span>Narrower than
																	weekdays
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
												New schedule</button>
										</div>
										<div id="calendarList" class="lnb-calendars-d1 mt-4 mt-sm-0 me-sm-0 mb-4"></div>

										<div id="calendar" style="height: 800px;"></div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end row -->

	 	<!-- container-fluid -->			
		</div>
	<!-- page-content -->		
	</div>
<!-- 푸터(자바스크립트 로딩) -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>

			<!-- Transaction Modal -->
			<div class="modal fade transaction-detailModal" tabindex="-1" role="dialog"
				aria-labelledby="transaction-detailModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="transaction-detailModalLabel">Order Details</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p class="mb-2">Product id: <span class="text-primary">#SK2540</span></p>
							<p class="mb-4">Billing Name: <span class="text-primary">Neal Matthews</span></p>

							<div class="table-responsive">
								<table class="table align-middle table-nowrap">
									<thead>
										<tr>
											<th scope="col">Product</th>
											<th scope="col">Product Name</th>
											<th scope="col">Price</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">
												<div>
													<img src="resources/images/product/img-7.png" alt=""
														class="avatar-sm">
												</div>
											</th>
											<td>
												<div>
													<h5 class="text-truncate font-size-14">Wireless Headphone
														(Black)
													</h5>
													<p class="text-muted mb-0">$ 225 x 1</p>
												</div>
											</td>
											<td>$ 255</td>
										</tr>
										<tr>
											<th scope="row">
												<div>
													<img src="resources/images/product/img-4.png" alt=""
														class="avatar-sm">
												</div>
											</th>
											<td>
												<div>
													<h5 class="text-truncate font-size-14">Phone patterned cases
													</h5>
													<p class="text-muted mb-0">$ 145 x 1</p>
												</div>
											</td>
											<td>$ 145</td>
										</tr>
										<tr>
											<td colspan="2">
												<h6 class="m-0 text-right">Sub Total:</h6>
											</td>
											<td>
												$ 400
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<h6 class="m-0 text-right">Shipping:</h6>
											</td>
											<td>
												Free
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<h6 class="m-0 text-right">Total:</h6>
											</td>
											<td>
												$ 400
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end modal -->

			<!-- subscribeModal -->
			<div class="modal fade" id="subscribeModal" tabindex="-1" aria-labelledby="subscribeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header border-bottom-0">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="text-center mb-4">
								<div class="avatar-md mx-auto mb-4">
									<div class="avatar-title bg-light rounded-circle text-primary h1">
										<i class="mdi mdi-email-open"></i>
									</div>
								</div>

								<div class="row justify-content-center">
									<div class="col-xl-10">
										<h4 class="text-primary">Subscribe !</h4>
										<p class="text-muted font-size-14 mb-4">Subscribe our newletter and get
											notification to stay update.</p>

										<div class="input-group bg-light rounded">
											<input type="email" class="form-control bg-transparent border-0"
												placeholder="Enter Email address" aria-label="Recipient's username"
												aria-describedby="button-addon2">

											<button class="btn btn-primary" type="button" id="button-addon2">
												<i class="bx bxs-paper-plane"></i>
											</button>

										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end modal -->

</div> <!-- main-content -->



		<script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>
		<script src="resources/libs/tui-dom/tui-dom.min.js"></script>

		<script src="resources/libs/tui-time-picker/tui-time-picker.min.js"></script>
		<script src="resources/libs/tui-date-picker/tui-date-picker.min.js"></script>

		<script src="resources/libs/moment/min/moment.min.js"></script>
		<script src="resources/libs/chance/chance.min.js"></script>

		<script src="resources/libs/tui-calendar/tui-calendar.min.js"></script>

		<script src="resources/js/pages/calendars.js"></script>
		<script src="resources/js/pages/schedules.js"></script>
		<script src="resources/js/pages/calendar.init.js"></script>

</body>
</html>

