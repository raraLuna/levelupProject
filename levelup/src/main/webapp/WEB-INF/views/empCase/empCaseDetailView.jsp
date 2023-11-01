<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- 타이틀 -->
<c:import url="/WEB-INF/views/common/title-meta.jsp" />
<!-- 헤드 스크립트 -->
<c:import url="/WEB-INF/views/common/head-script.jsp" />

<c:url var="caseApprove" value="caseApprove.do">
	<c:param name="caseId" value="${ requestScope.casedetail.caseId }" />
	<c:param name="employeeId" value="${ sessionScope.loginEmployee.employeeId }" />	
	<c:param name="charId" value="${ requestScope.casedetail.charId }" />		
</c:url>

<c:url var="caseReject" value="caseReject.do">
	<c:param name="caseId" value="${ requestScope.casedetail.caseId }" />
	<c:param name="employeeId" value="${ sessionScope.loginEmployee.employeeId }" />
	<c:param name="charId" value="${ requestScope.casedetail.charId }" />
</c:url>
</head>
<style>
.table-responsive {
	overflow-y: auto;
	height: 200px;
}

.table-responsive thead th {
	position: sticky;
	top: 0px;
}
</style>
<body data-sidebar="dark" data-layout-mode="light">

<c:if test="${ empty loginEmployee }">
   <c:redirect url="eloginPage.do"/>
</c:if>
	<!-- 내비게이션바, 사이드바 등등 -->
	<c:import url="/WEB-INF/views/common/layout.jsp" />

	<div class="main-content">
		<div class="page-content">
			<div class="container-fluid">

				<c:import url="/WEB-INF/views/common/page-title.jsp" />

				<h2 align="center"></h2>
				<br>
				<!-- 여기부터 내용 작성 -->

				
				
				<div class="card">
                <div class="card-body">
                    <div class="pt-4">
                        <div class="row justify-content-center">
                            <div class="col-xl-10">
                                <div>
                                
                                
                                
							<!-- 기안 제목 -->
                                
                                    <div class="text-center">
                                        <div class="mb-4">                                      
                                        </div>
                                        <h4>기안 제목 : ${ requestScope.casedetail.caseTitle }</h4>
                                     </div>

                                    <hr>
                             <!-- ---------------------------------------------- -->       
                                    
                             <!-- 기안 분류 -->
                                    <div class="text-center" align="center">
                                        <div class="row">                                    
                                        
                                            <div class="col-sm-2">
                                                <div>
                                                    <p class="text-muted mb-2">기안 분류</p>
                                                    <c:if test="${ requestScope.casedetail.caseType eq 1}">
                                                    	<h5 class="font-size-15">아이템 변경 기안</h5>
                                                   	</c:if>
                                                   	 <c:if test="${ requestScope.casedetail.caseType eq 2}">
                                                    	<h5 class="font-size-15">아이템 삭제 기안</h5>
                                                   	</c:if>
                                                   	 <c:if test="${ requestScope.casedetail.caseType eq 3}">
                                                    	<h5 class="font-size-15">아이템 환불 기안</h5>
                                                   	</c:if>
                                                </div>
                                            </div>
                                            
                             <!-- 기안 작성 날짜 -->
                                       <div class="col-sm-3">
                                           <div class="mt-4 mt-sm-0">
                                               <p class="text-muted mb-2">기안 작성 날짜</p>
                                               <h5 class="font-size-15"><fmt:formatDate value="${ requestScope.casedetail.editDate }" pattern="yyyy-MM-dd HH:mm:ss" /></h5>
                                           </div>
                                       </div>
                                       
                              <!-- 기안 작성자 -->
                                       <div class="col-sm-2">
                                           <div class="mt-4 mt-sm-0">
                                               <p class="text-muted mb-2">기안 작성자</p>
                                               <h5 class="font-size-15">${ requestScope.casedetail.caseWriterName }</h5>
                                           </div>
                                       </div>
                                       
                               <!-- 기안 처리 상태 -->                                      
                                       <div class="col-sm-2">
                                           <div class="mt-4 mt-sm-0">
                                               <p class="text-muted mb-2">기안 처리 상태</p>
                                               <c:if test="${ requestScope.casedetail.caseStatus eq 0 }" >
                                               		<span class="badge badge-pill badge-soft-warning font-size-15">처리필요</span>
                                               </c:if>
                                               <c:if test="${ requestScope.casedetail.caseStatus eq 1 }" >
                                               		<span class="badge badge-pill bg-success font-size-15">승인완료</span>
                                               </c:if>
                                               <c:if test="${ requestScope.casedetail.caseStatus eq 2 }" >
                                               		<span class="badge badge-pill bg-danger font-size-15">반려</span>
                                               </c:if>
                                           </div>
                                       </div>
                                       
                                 <!-- 기안 처리 상태 -->                                      
                                       <div class="col-sm-2">
                                           <div class="mt-4 mt-sm-0">
                                               <p class="text-muted mb-2">기안 처리자</p>
                                               <c:if test="${ requestScope.casedetail.caseStatus eq 0 }" >
                                               		<h5 class="font-size-15"> &nbsp; </h5>
                                               </c:if>
                                               <c:if test="${ requestScope.casedetail.caseStatus eq 1  || requestScope.casedetail.caseStatus eq 2 }" >
                                               		<h5 class="font-size-15">${ requestScope.casedetail.caseManagerName }</h5>
                                               </c:if>
                                           </div>
                                       </div>
                                       
                                       
                                       </div><!-- ROW -->
                                    </div>
                                    
                               <!-- ------------------------------------------------------------------ -->     
                                    <hr>

                                    <div class="my-5">
                                        <img src="assets/images/small/img-2.jpg" alt="" class="img-thumbnail mx-auto d-block">
                                    </div>

                                    <hr>
                                    
                              <!-- -----------------------------기안 내용 -------------------------------------- -->

                                    <div class="mt-4">
                                        <div class="text-muted font-size-14">
                                  
                               <!-- 유저 정보 -->	
                                		<h5 class="mb-3">유저 정보</h5>									
									<div class="row">
										<div class="mb-3 col-lg-2">											
												<label>계정 ID</label>
												<input type="text" name="" id="disabledTextInput" class="form-control"
												placeholder="${ requestScope.casedetail.accountId }" disabled>
										</div>
										<div class="mb-3 col-lg-2">
											<label>캐릭터 ID</label><input type="text"
												id="disabledTextInput" class="form-control"
												placeholder="${ requestScope.casedetail.charId }"
												disabled>
										</div>
										<div class="mb-3 col-lg-2">
											<label>캐릭터 이름</label><input type="text"
												id="disabledTextInput" class="form-control"
												placeholder="${ requestScope.casedetail.charName }"
												disabled>
										</div>
									</div>
									
									<br><br>
                                		  	
                                	
                                <!-- 변경 전 아이템 정보 -->  
                                		
                                		<h5 class="mb-3">아이템 정보</h5>
                                
                             			<div id="currentItems">
                                   		<div class="row" >
                                     		<div class="mb-3 col-lg-2">아이템 ID</div>        
                                            <div class="mb-3 col-lg-3">아이템 이름</div> 
                                            <div class="mb-3 col-lg-2">UNIQUE ID</div>	        
                                            <div class="mb-3 col-lg-2">수량</div>                 
                                        </div>  
                                        
                                             
                                		<div class="row">	
                                			<div class="mb-3 col-lg-2">	                                        	
	                                            <input type="text" name="" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.originalItemId }" disabled>
	                                        </div>        
	                                        <div class="mb-3 col-lg-3">		                                        
		                                            <input type="text" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.originalItemName }" disabled>		                                 
	                                        </div>  
	                                        <div class="mb-3 col-lg-2">
	                                            <input type="text" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.uniqueId }" disabled>
	                                        </div>        
	                                        <div class="mb-3 col-lg-2">
	                                            <input type="text" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.originalItemAmount }" disabled>
	                                        </div>  	                                       	
                                			
                                		</div>	 
                                		
                                		<br><br>
                                		
                                	
                                	 <c:if test="${ requestScope.casedetail.caseType eq 1}">	
                                <!-- 변경 후 아이템 정보 -->	
                                
                                	
                                		<h5 class="mb-3">변경 후 아이템 정보</h5>
                                
                             			<div id="newItems">
                                   		<div class="row" >
                                     		<div class="mb-3 col-lg-2">아이템 ID</div>        
                                            <div class="mb-3 col-lg-3">아이템 이름</div>         
                                            <div class="mb-3 col-lg-2">수량</div>              
                                        </div>  
                                        
                                             
                                		<div class="row">	
                                			<div class="mb-3 col-lg-2">	                                        	
	                                            <input type="text" name="" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.newItemId }" disabled>
	                                        </div>        
	                                        <div class="mb-3 col-lg-3">		                                        
		                                            <input type="text" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.newItemName }" disabled>		                                 
	                                        </div>          
	                                        <div class="mb-3 col-lg-2">
	                                            <input type="text" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.newItemAmount }" disabled>
	                                        </div>  	                          
                                			
                                		</div>	  
                                		</div>
                                		<!-- 변경 후 아이템 끝 -->
                                		</c:if>
                                		
                                		
                                		
                                		<!-- 아이템 환불 -->
                                		<c:if test="${ requestScope.casedetail.caseType eq 3}">
	                                		<h5 class="mb-3">아이템 구매 정보</h5>
	                                
	                             			<div id="refundItems">
	                                   		<div class="row" >
	                                     		<div class="mb-3 col-lg-2">구매날짜</div>        
	                                            <div class="mb-3 col-lg-2">구매상태</div>         
	                                            <div class="mb-3 col-lg-2">구매수량</div> 	                                                                                      	                                                
	                                            <div class="mb-3 col-lg-2">Payment Key</div>         
	                                        </div>  
	                                        
	                                             
	                                		<div class="row">	
	                                			<div class="mb-3 col-lg-2">	                                        	
		                                            <input type="text" name="" id="disabledTextInput" class="form-control" placeholder="<fmt:formatDate value="${ requestScope.casedetail.paymentDate }" pattern="yyyy-MM-dd HH:mm:ss" />" disabled>
		                                        </div>        
		                                        <div class="mb-3 col-lg-2">
		                                               <c:if test="${ requestScope.casedetail.paymentStatus eq 1 }" >
		                                               		<input type="text" id="disabledTextInput" name="paymentStatus"
															class="form-control" placeholder="결제 완료" disabled>
															<input type="hidden" name="paymentStatus" value="1">
		                                               </c:if>
		                                               <c:if test="${ requestScope.casedetail.paymentStatus eq 2 }" >
		                                               		<input type="text" id="disabledTextInput" name="paymentStatus"
															class="form-control" placeholder="환불 완료" disabled>
															<input type="hidden" name="paymentStatus" value="2">
		                                               </c:if>
		                                                <c:if test="${ requestScope.casedetail.paymentStatus eq 3 }" >
		                                               		<input type="text" id="disabledTextInput" name="paymentStatus"
															class="form-control" placeholder="결제 대기" disabled>
															<input type="hidden" name="paymentStatus" value="3">
		                                               </c:if>
												</div>	 
		                                        <div class="mb-3 col-lg-2">
		                                            <input type="text" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.paymentAmount }" disabled>
		                                        </div>  		                                        
		                                         <div class="mb-3 col-lg-6">
		                                            <input type="text" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.paymentKey }" disabled>
		                                        </div>  	                          
	                                			
	                                		</div>	
	                                		<div class="row" >
	                                     		<div class="mb-3 col-lg-2">환불날짜</div>        
	                                            <div class="mb-3 col-lg-2">환불사유</div>           
	                                        </div>    
	                                        <div class="row" >
	                                         	<div class="mb-3 col-lg-2">
		                                            <input type="text" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.refundDate }" disabled>
		                                        </div>                                      	
	                                            <div class="mb-3 col-lg-4">
		                                            <input type="text" id="disabledTextInput" class="form-control" placeholder="${ requestScope.casedetail.refundCause }" disabled>
		                                        </div> 
		                                     </div>
		                                     
	                                        </div>       
	                                		                               		
	                                
                                		</c:if>
                                	
                                		
                                		</div> <!-- 아이템 환불  끝-->
                                		
                                		
                                		      
                                      <!-- 기안 내용 -->   

                                            <div class="mt-4">
                                                <h5 class="mb-3">기안 내용</h5>

                                                <div>                                                   
                                                   <div class="flex-grow-1 overflow-hidden">
                                                   <input type="text" id="disabledTextInput" class="form-control" style="height:100px;" placeholder="${ requestScope.casedetail.caseContent }" disabled>
													</div>                                                 
                                                   
                                                </div>
                                            </div>
                                            
                                      <!-- 첨부된 파일 -->   
					
										<div class="mt-4">
											<h5 class="mb-3">첨부 파일</h5>
											<div class="table-responsive">
												<table class="table table-nowrap align-middle table-hover mb-0">
													<tbody>
														<tr>
															<c:if test="${ !empty requestScope.casedetail.attachmentFileName }">
																<c:url var="cdown" value="cfdown.do">
																	<c:param name="file" value="${ requestScope.casedetail.attachmentFileName }" />												
																</c:url>
															<td>
																<h5 class="font-size-14 mb-1">
																	<a href="${ cdown }" class="text-dark">${ requestScope.casedetail.attachmentFileName }</a>
																</h5>
															</td>
															<td>
																<div class="text-center">
																	<a href="${ cdown }" class="text-dark"><i
																		class="bx bx-download h3 m-0"></i></a>
																</div>
															</td>
															</c:if>
															<c:if test="${ empty requestScope.casedetail.attachmentFileName }">
															첨부파일 없음
															</c:if>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								

									 <!-- ----------------------------기안 내용 끝------------------------------------------------- -->			

									 			
									</div>				
								</div>
								
								<hr>
								
								<!-- 수정하기 버튼, 기안 올리기 버튼, 삭제하기버튼, 목록으로 버튼 -->
								
								<div class="col-lg-10" align="center">
									<!-- 기안 결재자가 아닌 경우 -->
									<c:if test="${ sessionScope.loginEmployee.employeeId != requestScope.casedetail.caseManagerId }">
                                  <button type="button" class="btn btn-secondary waves-effect waves-light" onclick="golist();">목록으로</button>
                                  
                                   </c:if>
                                   
                                   <!-- 기안 결재자인 경우 -->
									<c:if test="${ sessionScope.loginEmployee.employeeId == requestScope.casedetail.caseManagerId }">
										<c:if test="${ requestScope.casedetail.caseStatus eq 0 }" >
		                                  <button type="button" class="btn btn-secondary waves-effect waves-light" onclick="golist();">목록으로</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                  
		                                  	<!-- 아이템 변경/삭제 기안의 경우의 승인처리 -->
		                                  	<c:if test="${ requestScope.casedetail.caseType eq 1 || requestScope.casedetail.caseType eq 2 }"> 
		                                 		 <button type="button" class="btn btn-success waves-effect waves-light" onclick="caseApprove();">기안 승인</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                  	</c:if>
		                                  	
		                                  	<!-- 아이템 환불 기안의 경우의 승인처리 -->
		                                  	<c:if test="${ requestScope.casedetail.caseType eq 3 }">
		                                  		<button type="button" class="btn btn-success waves-effect waves-light" onclick="cancelPayment();">기안 승인</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                  	</c:if>
		                                  
		                                  <button type="button" class="btn btn-danger waves-effect waves-light" onclick="caseReject();">기안 반려</button>   										
										</c:if>
										
										<!-- 이미 승인된 기안 -->
										<c:if test="${ requestScope.casedetail.caseStatus eq 1 }" >										  
										  <button type="button" class="btn btn-secondary waves-effect waves-light" onclick="golist();">목록으로</button>										
                                  		</c:if> 
                                  		
                                  		<!-- 이미 반려된 기안 -->
                                  		<c:if test="${ requestScope.casedetail.caseStatus eq 2 }" >										  
										  <button type="button" class="btn btn-secondary waves-effect waves-light" onclick="golist();">목록으로</button>										
                                  		</c:if>                              
                                   </c:if>
                              </div>
								
							</div>	
                          </div>
                    	</div>
                    </div>
                </div>
                <!-- end card body -->
            </div>
				



	
			</div>
			<!-- container-fluid -->
		</div>
		<!-- page-content -->

	<c:import url="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- main-content -->

	<script type="text/javascript">
		function cancelPayment(){
			
			var ans = confirm("기안을 승인하시겠습니까? 바로 환불이 진행됩니다");
			if(ans) {
			
				/* form */
				let f = document.createElement('form');	
				
				/* caseId hidden input */
				let caseIdHiddenInput = document.createElement('input');
				caseIdHiddenInput.setAttribute('type', 'hidden');
				caseIdHiddenInput.setAttribute('name', 'caseId');
				caseIdHiddenInput.setAttribute('value', '${ requestScope.casedetail.caseId }');
				
				/* charId hidden input */
				let charIdHiddenInput = document.createElement('input');
				charIdHiddenInput.setAttribute('type', 'hidden');
				charIdHiddenInput.setAttribute('name', 'charId');
				charIdHiddenInput.setAttribute('value', '${ requestScope.casedetail.charId }');
				
				/* employeeId hidden input */
				let employeeIdHiddenInput = document.createElement('input');
				employeeIdHiddenInput.setAttribute('type', 'hidden');
				employeeIdHiddenInput.setAttribute('name', 'employeeId');
				employeeIdHiddenInput.setAttribute('value', '${ sessionScope.loginEmployee.employeeId }');
				
				
				/* paymentKey hidden input */
				let paymentKeyHiddenInput = document.createElement('input');
				paymentKeyHiddenInput.setAttribute('type', 'hidden');
				paymentKeyHiddenInput.setAttribute('name', 'paymentKey');
				paymentKeyHiddenInput.setAttribute('value', '${ requestScope.casedetail.paymentKey }');
				
			    /* cancel reason hidden input */
				let cancelReasonHiddenInput = document.createElement('input');
				cancelReasonHiddenInput.setAttribute('type', 'hidden');
				cancelReasonHiddenInput.setAttribute('name', 'cancelReason');
				/* 환불 사유는 나중에 손보면댐 */
				cancelReasonHiddenInput.setAttribute('value', '테스트 환불');
			    
				/* nowpage hidden input */
				let nowpageHiddenInput = document.createElement('input');
				nowpageHiddenInput.setAttribute('type', 'hidden');
				nowpageHiddenInput.setAttribute('name', 'page');
				nowpageHiddenInput.setAttribute('value', '1');
				
			    f.appendChild(caseIdHiddenInput);
			    f.appendChild(charIdHiddenInput);
			    f.appendChild(employeeIdHiddenInput);	
			    f.appendChild(paymentKeyHiddenInput);
			    f.appendChild(cancelReasonHiddenInput);
			    f.appendChild(nowpageHiddenInput);
			    
			    
			    f.setAttribute('method', 'post');
				f.setAttribute('action', 'caserfApprove.do');
				
				console.log(paymentKeyHiddenInput.value);
				console.log(cancelReasonHiddenInput.value);
				console.log(nowpageHiddenInput.value);
				
				document.body.appendChild(f);
				f.submit();
			}else {
				return false;
			}
		}
		
		function golist(){
			location.href = "${pageContext.servletContext.contextPath}/clist.do?page=${ param.page }";
		}

		function caseApprove(){
			if(${ requestScope.casedetail.caseType eq 1}){
				
				var ans = confirm("기안을 승인하시겠습니까? 아이템의 정보가 변경됩니다.");
					if(ans) { location.href = "${ caseApprove }";
					}
			}else if(${ requestScope.casedetail.caseType eq 2}){
				var ans = confirm("기안을 승인하시겠습니까? 아이템이 삭제됩니다.");
					if(ans) { location.href = "${ caseApprove }";		
					}
			}
			return false;
		}

		function caseReject(){
			var ans = confirm("기안을 반려하시겠습니까?");
			if(ans) { location.href = "${ caseReject }";
			}	
			return false;
		}
	</script>

</body>
</html>

