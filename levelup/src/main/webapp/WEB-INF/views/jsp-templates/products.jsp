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
		<div class="container-fluid">

<c:import url="/WEB-INF/views/common/page-title.jsp"/>

<!-- 여기서부터 내용 작성 -->
					<div class="row">
						<div class="col-lg-3">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title mb-4">Filter</h4>

									<div>
										<h5 class="font-size-14 mb-3">Clothes</h5>
										<ul class="list-unstyled product-list">
											<li><a href="javascript: void(0);"><i
														class="mdi mdi-chevron-right me-1"></i> T-shirts</a></li>
											<li><a href="javascript: void(0);"><i
														class="mdi mdi-chevron-right me-1"></i> Shirts</a></li>
											<li><a href="javascript: void(0);"><i
														class="mdi mdi-chevron-right me-1"></i> Jeans</a></li>
											<li><a href="javascript: void(0);"><i
														class="mdi mdi-chevron-right me-1"></i> Jackets</a></li>
										</ul>
									</div>
									<div class="mt-4 pt-3">
										<h5 class="font-size-14 mb-3">Price</h5>
										<input type="text" id="pricerange">
									</div>

									<div class="mt-4 pt-3">
										<h5 class="font-size-14 mb-3">Discount</h5>
										<div class="form-check mt-2">
											<input class="form-check-input" type="checkbox" id="productdiscountCheck1">
											<label class="form-check-label" for="productdiscountCheck1">
												Less than 10%
											</label>
										</div>

										<div class="form-check mt-2">
											<input class="form-check-input" type="checkbox" id="productdiscountCheck2">
											<label class="form-check-label" for="productdiscountCheck2">
												10% or more
											</label>
										</div>

										<div class="form-check mt-2">
											<input class="form-check-input" type="checkbox" id="productdiscountCheck3"
												checked>
											<label class="form-check-label" for="productdiscountCheck3">
												20% or more
											</label>
										</div>

										<div class="form-check mt-2">
											<input class="form-check-input" type="checkbox" id="productdiscountCheck4">
											<label class="form-check-label" for="productdiscountCheck4">
												30% or more
											</label>
										</div>

										<div class="form-check mt-2">
											<input class="form-check-input" type="checkbox" id="productdiscountCheck5">
											<label class="form-check-label" for="productdiscountCheck5">
												40% or more
											</label>
										</div>

										<div class="form-check mt-2">
											<input class="form-check-input" type="checkbox" id="productdiscountCheck6">
											<label class="form-check-label" for="productdiscountCheck6">
												50% or more
											</label>
										</div>

									</div>

									<div class="mt-4 pt-3">
										<h5 class="font-size-14 mb-3">Customer Rating</h5>
										<div>
											<div class="form-check mt-2">
												<input class="form-check-input" type="checkbox"
													id="productratingCheck1">
												<label class="form-check-label" for="productratingCheck1">
													4 <i class="bx bxs-star text-warning"></i> & Above
												</label>
											</div>
											<div class="form-check mt-2">
												<input class="form-check-input" type="checkbox"
													id="productratingCheck2">
												<label class="form-check-label" for="productratingCheck2">
													3 <i class="bx bxs-star text-warning"></i> & Above
												</label>
											</div>
											<div class="form-check mt-2">
												<input class="form-check-input" type="checkbox"
													id="productratingCheck3">
												<label class="form-check-label" for="productratingCheck3">
													2 <i class="bx bxs-star text-warning"></i> & Above
												</label>
											</div>

											<div class="form-check mt-2">
												<input class="form-check-input" type="checkbox"
													id="productratingCheck4">
												<label class="form-check-label" for="productratingCheck4">
													1 <i class="bx bxs-star text-warning"></i>
												</label>
											</div>

										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="col-lg-9">

							<div class="row mb-3">
								<div class="col-xl-4 col-sm-6">
									<div class="mt-2">
										<h5>Clothes</h5>
									</div>
								</div>
								<div class="col-lg-8 col-sm-6">
									<form class="mt-4 mt-sm-0 float-sm-end d-sm-flex align-items-center">
										<div class="search-box me-2">
											<div class="position-relative">
												<input type="text" class="form-control border-0"
													placeholder="Search...">
												<i class="bx bx-search-alt search-icon"></i>
											</div>
										</div>
										<ul class="nav nav-pills product-view-nav justify-content-end mt-3 mt-sm-0">
											<li class="nav-item">
												<a class="nav-link active" href="#"><i class="bx bx-grid-alt"></i></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#"><i class="bx bx-list-ul"></i></a>
											</li>
										</ul>


									</form>
								</div>
							</div>
							<div class="row">
								<div class="col-xl-4 col-sm-6">
									<div class="card">
										<div class="card-body">
											<div class="product-img position-relative">
												<div class="avatar-sm product-ribbon">
													<span class="avatar-title rounded-circle  bg-primary">
														- 25 %
													</span>
												</div>
												<img src="resources/images/product/img-1.png" alt=""
													class="img-fluid mx-auto d-block">
											</div>
											<div class="mt-4 text-center">
												<h5 class="mb-3 text-truncate"><a href="javascript: void(0);"
														class="text-dark">Half sleeve T-shirt </a></h5>

												<p class="text-muted">
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
												</p>
												<h5 class="my-0"><span class="text-muted me-2"><del>$500</del></span>
													<b>$450</b></h5>

											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-sm-6">
									<div class="card">
										<div class="card-body">
											<div class="product-img position-relative">
												<img src="resources/images/product/img-2.png" alt=""
													class="img-fluid mx-auto d-block">
											</div>
											<div class="mt-4 text-center">
												<h5 class="mb-3 text-truncate"><a href="javascript: void(0);"
														class="text-dark">Light blue T-shirt</a></h5>

												<p class="text-muted">
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star"></i>
												</p>
												<h5 class="my-0"><span class="text-muted me-2"><del>$240</del></span>
													<b>$225</b></h5>

											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-sm-6">
									<div class="card">
										<div class="card-body">
											<div class="product-img position-relative">
												<div class="avatar-sm product-ribbon">
													<span class="avatar-title rounded-circle  bg-primary">
														- 20 %
													</span>
												</div>
												<img src="resources/images/product/img-3.png" alt=""
													class="img-fluid mx-auto d-block">
											</div>
											<div class="mt-4 text-center">
												<h5 class="mb-3 text-truncate"><a href="javascript: void(0);"
														class="text-dark">Black Color T-shirt</a></h5>

												<p class="text-muted">
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star"></i>
												</p>
												<h5 class="my-0"><span class="text-muted me-2"><del>$175</del></span>
													<b>$152</b></h5>

											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-sm-6">
									<div class="card">
										<div class="card-body">
											<div class="product-img position-relative">
												<img src="resources/images/product/img-4.png" alt=""
													class="img-fluid mx-auto d-block">
											</div>
											<div class="mt-4 text-center">
												<h5 class="mb-3 text-truncate"><a href="javascript: void(0);"
														class="text-dark">Hoodie (Blue)</a></h5>

												<p class="text-muted">
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star"></i>
												</p>
												<h5 class="my-0"><span class="text-muted me-2"><del>$150</del></span>
													<b>$145</b></h5>

											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-sm-6">
									<div class="card">
										<div class="card-body">

											<div class="product-img position-relative">
												<div class="avatar-sm product-ribbon">
													<span class="avatar-title rounded-circle  bg-primary">
														- 22 %
													</span>
												</div>
												<img src="resources/images/product/img-5.png" alt=""
													class="img-fluid mx-auto d-block">
											</div>
											<div class="mt-4 text-center">
												<h5 class="mb-3 text-truncate"><a href="javascript: void(0);"
														class="text-dark">Half sleeve T-Shirt</a></h5>

												<p class="text-muted">
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star"></i>
												</p>
												<h5 class="my-0"><span class="text-muted me-2"><del>$145</del></span>
													<b>$138</b></h5>

											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-4 col-sm-6">
									<div class="card">
										<div class="card-body">
											<div class="product-img position-relative">
												<div class="avatar-sm product-ribbon">
													<span class="avatar-title rounded-circle bg-primary">
														- 28 %
													</span>
												</div>
												<img src="resources/images/product/img-6.png" alt=""
													class="img-fluid mx-auto d-block">
											</div>
											<div class="mt-4 text-center">
												<h5 class="mb-3 text-truncate"><a href="javascript: void(0);"
														class="text-dark">Green color T-shirt</a></h5>

												<p class="text-muted">
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star text-warning"></i>
													<i class="bx bxs-star"></i>
												</p>
												<h5 class="my-0"><span class="text-muted me-2"><del>$138</del></span>
													<b>$135</b></h5>

											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- end row -->

							<div class="row">
								<div class="col-lg-12">
									<ul class="pagination pagination-rounded justify-content-center mt-3 mb-4 pb-1">
										<li class="page-item disabled">
											<a href="javascript: void(0);" class="page-link"><i
													class="mdi mdi-chevron-left"></i></a>
										</li>
										<li class="page-item">
											<a href="javascript: void(0);" class="page-link">1</a>
										</li>
										<li class="page-item active">
											<a href="javascript: void(0);" class="page-link">2</a>
										</li>
										<li class="page-item">
											<a href="javascript: void(0);" class="page-link">3</a>
										</li>
										<li class="page-item">
											<a href="javascript: void(0);" class="page-link">4</a>
										</li>
										<li class="page-item">
											<a href="javascript: void(0);" class="page-link">5</a>
										</li>
										<li class="page-item">
											<a href="javascript: void(0);" class="page-link"><i
													class="mdi mdi-chevron-right"></i></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- end row -->
	
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


	 	<!-- container-fluid -->			
		</div>
	<!-- page-content -->		
	</div>
<!-- 푸터(자바스크립트 로딩) -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</div> <!-- main-content -->


	<!-- Ion Range Slider-->
        <script src="resources/libs/ion-rangeslider/js/ion.rangeSlider.min.js"></script>

        <!-- init js -->
        <script src="resources/js/pages/product-filter-range.init.js"></script>

</body>
</html>

