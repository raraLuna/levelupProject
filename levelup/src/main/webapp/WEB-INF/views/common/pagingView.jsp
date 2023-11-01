<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<%-- 아래에서 사용할 변수 값들을 선언 --%>
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />
<c:set var="urlMapping" value="${ requestScope.paging.urlMapping }" />
<c:set var="startPage" value="${ requestScope.paging.startPage }" />
<c:set var="endPage" value="${ requestScope.paging.endPage }" />
<c:set var="maxPage" value="${ requestScope.paging.maxPage }" />
<c:set var="teamId" value="${ teamId }" />
<c:set var="departmentId" value="${ departmentId }" />
<c:set var="action" value="${ requestScope.action }" />
<c:set var="keyword" value="${ requestScope.keyword }" />
<c:set var="type" value="${ requestScope.type }"/>
<c:set var="begin" value="${ requestScope.begin }" />
<c:set var="end" value="${ requestScope.end }" />


<%-- 목록 페이징 처리 --%>
<c:if test="${ empty action }">
<ul class="pagination pagination-rounded justify-content-center mb-2">
	<c:if test="${ currentPage eq 1 }" >

	<li class="page-item disabled">
		<a class="page-link" href="javascript: void(0);" aria-label="맨처음">
			<i class="mdi mdi-chevron-double-left"></i>
		</a>
	</li>
<!-- 		[맨처음] &nbsp; -->
	</c:if>
	
	<c:if test="${ currentPage gt 1 }" >
	<li class="page-item">
		<a class="page-link" href="/levelup/${ urlMapping }?page=1" aria-label="맨처음">
			<i class="mdi mdi-chevron-double-left"></i>
		</a>
	</li>
<%-- 		<a href="/levelup/${ urlMapping }?page=1">[맨처음]</a> &nbsp; --%>
	</c:if>
	
	<c:if test="${ (currentPage - 10) lt startPage and (currentPage - 10) gt 1}" >
		<li class="page-item">
		<a class="page-link" href="/levelup/${ urlMapping }?page=${ startPage - 10 }" aria-label="이전그룹">
			<i class="mdi mdi-chevron-left"></i>
		</a>
		</li>
<%--	<a href="/levelup/${ urlMapping }?page=${ startPage - 10 }">[이전그룹]</a> &nbsp; --%>
	</c:if>
	
	<c:if test="${ !((currentPage -10) lt startPage and (currentPage - 10) gt 1) }" >
		<li class="page-item disabled">
		<a class="page-link" href="#" aria-label="이전그룹">
			<i class="mdi mdi-chevron-left"></i>
		</a>
		</li>

<!-- 		[이전그룹] &nbsp; -->
	</c:if>
	
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1" >
		<c:if test="${ p eq currentPage }" >
		<li class="page-item active"><a class="page-link" href="javascript: void(0);">${ p }</a></li>
<%-- 			<font color="blue" size="4"><b>${ p }</b></font> --%>
		</c:if>
		<c:if test="${ p ne currentPage }">
		<li class="page-item"><a class="page-link" href="/levelup/${ urlMapping }?page=${ p }">${ p }</a></li>
<%-- 			<a href="/levelup/${ urlMapping }?page=${ p }">${ p }</a> --%>
		</c:if>
	</c:forEach>
	
	<c:if test="${ ((currentPage + 10) > endPage) and ((currentPage + 10) < maxPage) }">
		<li class="page-item">
		<a class="page-link" href="/levelup/${ urlMapping }?page=${ startPage + 10 }" aria-label="다음그룹">
			<i class="mdi mdi-chevron-right"></i>
		</a>
		</li>
<%-- 		<a href="/levelup/${ urlMapping }?page=${ startPage + 10 }">[다음그룹]</a> &nbsp; --%>
	</c:if>
	
	<c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
		<li class="page-item disabled">
		<a class="page-link" href="#" aria-label="다음그룹">
			<i class="mdi mdi-chevron-right"></i>
		</a>
		</li>
<!-- 		[다음그룹] &nbsp; -->
	</c:if>
	
	<c:if test="${ (currentPage >= maxPage) }">
		<li class="page-item disabled">
		<a class="page-link" href="#" aria-label="맨끝">
			<i class="mdi mdi-chevron-double-right"></i>
		</a>
		</li>

<!-- 		[맨끝] &nbsp; -->
	</c:if>
	
	<c:if test="${ currentPage < maxPage }" >
		<li class="page-item">
		<a class="page-link" href="/levelup/${ urlMapping }?page=${ maxPage }" aria-label="맨끝">
			<i class="mdi mdi-chevron-double-right"></i>
		</a>
		</li>

<%-- 		<a href="/levelup/${ urlMapping }?page=${ maxPage} ">[맨끝]</a> &nbsp; --%>
	</c:if>
</ul>
</c:if>


<%---------------------------------------------------------------------------------------------------------------------------- --%>

<%-- 검색(작성자) 페이징 처리 --%>
<%-- <c:if test="${ !empty action and action eq 'writer' }">

<div style="text-align:center;">
	<c:if test="${ currentPage eq 1 }" >
		[맨처음] &nbsp;
	</c:if>
	<c:if test="${ currentPage gt 1 }" >
		<a href="/levelup/${ urlMapping }?page=&action=${ action }&keyword=${ keyword }">[맨처음]</a> &nbsp;
	</c:if>
	<c:if test="${ ((currentPage - 10) < startPage) && ((currentPage - 10) > 1) }">
		<c:url var="um1" value="${ urlMapping }">
			<c:param name="page" value="${ startPage -10 }" />
			<c:param name="action" value="${ action }" />
			<c:param name="keyword" value="${ keyword }" />
		</c:url>
		<a href="${ um1 }">[이전그룹]</a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage - 10) < startPage && (currentPage - 10) > 1) }">
		[이전그룹] &nbsp;
	</c:if>
	
	현재 페이지가 속한 페이지그룹 숫자 출력
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
		<c:if test="${ p eq currentPage }">
			<font color="blue" size="4"><b>${ p }</b></font>
		</c:if>
		<c:if test="${ !(p eq currentPage) }">
			<a href="/levelup/${ urlMapping }?page=${ p }&action=${ action }&keyword=${ keyword }">${ p }</a>
		</c:if>
	</c:forEach>
	
	다음 페이지 그룹으로 이동
	<c:if test="${ (currentPage + 10) > endPage && ((currentPage + 10) < maxPage) }">
		<a href="/levelup/${ urlMapping }?page=${ startPage + 10 }&action=${ action }&keyword=${ keyword }">[다음그룹]</a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
		[다음그룹] &nbsp;
	</c:if>
	
	<c:if test="${ currentPage >= maxPage }">
		[맨끝] &nbsp;
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<a href="/levelup/${ urlMapping }?page=${ maxPage }&action=${ action }&keyword=${ keyword }">[맨끝]</a> &nbsp;
	</c:if>
</div>
</c:if> --%>

<%---------------------------------------------------------------------------------------------------------------------------- --%>

<%-- 검색(제목, 작성자, 내용) 페이징 처리 --%>
<c:if test="${ !empty action and !empty keyword and action eq 'title' }">
  <ul class="pagination pagination-rounded justify-content-center mb-2">
    <c:if test="${ currentPage eq 1 }">
      <li class="page-item disabled">
        <a class="page-link" href="javascript: void(0);" aria-label="맨처음">
          <i class="mdi mdi-chevron-double-left"></i>
        </a>
      </li>
    </c:if>
    <c:if test="${ currentPage gt 1 }">
      <li class="page-item">
        <a class="page-link" href="/levelup/${ urlMapping }?action=${ action }&limit=10&teamId=${ teamId }&departmentId=${ departmentId }&keyword=${ keyword }&page=1&currentPage=1" aria-label="맨처음">
          <i class="mdi mdi-chevron-double-left"></i>
        </a>
      </li>
    </c:if>
    
    <!-- 이전 페이지 그룹으로 이동 -->
    <c:if test="${ (currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
      <li class="page-item">
        <a class="page-link" href="/levelup/${ urlMapping }?action=${ action }&limit=10&teamId=${ teamId }&departmentId=${ departmentId }&keyword=${ keyword }&page=${ startPage-10 }&currentPage=1" aria-label="이전그룹">
          <i class="mdi mdi-chevron-left"></i>
        </a>
      </li>
    </c:if>
    <c:if test="${ !((currentPage - 10) lt startPage and (currentPage - 10) gt 1) }">
      <li class="page-item disabled">
        <a class="page-link" href="javascript: void(0);" aria-label="이전그룹">
          <i class="mdi mdi-chevron-left"></i>
        </a>
      </li>
    </c:if>

    <c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
      <c:choose>
        <c:when test="${ p eq currentPage }">
          <li class="page-item active">
            <a class="page-link" href="javascript: void(0);">${ p }</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link" href="/levelup/${ urlMapping }?action=${ action }&limit=10&teamId=${ teamId }&departmentId=${ departmentId }&keyword=${ keyword }&page=${ p }&currentPage=1">${ p }</a>
          </li>
        </c:otherwise>
      </c:choose>
    </c:forEach>

    <!-- 다음 페이지 그룹으로 이동 -->
    <c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) < maxPage }">
      <li class="page-item">
        <a class="page-link" href="/levelup/${ urlMapping }?action=${ action }&limit=10&teamId=${ teamId }&departmentId=${ departmentId }&keyword=${ keyword }&page=${ startPage + 10 }&currentPage=1" aria-label="다음그룹">
          <i class="mdi mdi-chevron-right"></i>
        </a>
      </li>
    </c:if>
    <c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
      <li class="page-item disabled">
        <a class="page-link" href="javascript: void(0);" aria-label="다음그룹">
          <i class="mdi mdi-chevron-right"></i>
        </a>
      </li>
    </c:if>

    <c:if test="${ currentPage >= maxPage }">
      <li class="page-item disabled">
        <a class="page-link" href="javascript: void(0);" aria-label="맨끝">
          <i class="mdi mdi-chevron-double-right"></i>
        </a>
      </li>
    </c:if>
    <c:if test="${ currentPage < maxPage }">
      <li class="page-item">
        <a class="page-link" href="/levelup/${ urlMapping }?action=${ action }&limit=10&teamId=${ teamId }&departmentId=${ departmentId }&keyword=${ keyword }&page=${ maxPage }&currentPage=1" aria-label="맨끝">
          <i class="mdi mdi-chevron-double-right"></i>
        </a>
      </li>
    </c:if>
  </ul>
</c:if>



<%---------------------------------------------------------------------------------------------------------------------------- --%>

<%-- 검색(문의 타입) 페이징 처리 --%>
<%-- <c:if test="${ !empty action and action eq 'type' }">

<div style="text-align:center;">
	<c:if test="${ currentPage eq 1 }" >
		[맨처음] &nbsp;
	</c:if>
	<c:if test="${ currentPage gt 1 }" >
		<a href="/levelup/${ urlMapping }?page=&action=${ action }&type=${ type }">[맨처음]</a> &nbsp;
	</c:if>
	<c:if test="${ ((currentPage - 10) < startPage) && ((currentPage - 10) > 1) }">
		<c:url var="um1" value="${ urlMapping }">
			<c:param name="page" value="${ startPage -10 }" />
			<c:param name="action" value="${ action }" />
			<c:param name="keyword" value="${ keyword }" />
		</c:url>
		<a href="${ um1 }">[이전그룹]</a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage - 10) < startPage && (currentPage - 10) > 1) }">
		[이전그룹] &nbsp;
	</c:if>
	
	현재 페이지가 속한 페이지그룹 숫자 출력
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
		<c:if test="${ p eq currentPage }">
			<font color="blue" size="4"><b>${ p }</b></font>
		</c:if>
		<c:if test="${ !(p eq currentPage) }">
			<a href="/levelup/${ urlMapping }?page=${ p }&action=${ action }&type=${ type }">${ p }</a>
		</c:if>
	</c:forEach>
	
	다음 페이지 그룹으로 이동
	<c:if test="${ (currentPage + 10) > endPage && ((currentPage + 10) < maxPage) }">
		<a href="/levelup/${ urlMapping }?page=${ startPage + 10 }&action=${ action }&type=${ type }">[다음그룹]</a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
		[다음그룹] &nbsp;
	</c:if>
	
	<c:if test="${ currentPage >= maxPage }">
		[맨끝] &nbsp;
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<a href="/levelup/${ urlMapping }?page=${ maxPage }&action=${ action }&type=${ type }">[맨끝]</a> &nbsp;
	</c:if>
</div>
</c:if> --%>


<%---------------------------------------------------------------------------------------------------------------------------- --%>


<%-- 검색(등록날짜) 페이징 처리 --%>
<%-- <c:if test="${ !empty action and action eq 'date' }">
<div style="text-align:center;">
	<c:if test="${ currentPage <= 1 }">
		[맨처음] &nbsp;
	</c:if>
	<c:if test="${ currentPage > 1 }">
		<a href="/levelup/${ urlMapping }?page=1&action=${ action }&begin=${ begin }&end=${ end }">[맨처음]</a> &nbsp;
	</c:if>
	이전 페이지 그룹으로 이동
	<c:if test="${ (currentPage - 10) < startPage && (currentPage - 10) > 1 }">
		<a href="/levelup/${ urlMapping }?page=${ startPage - 10 }&action=${ action }&begin=${ begin }&end=${ end }">[이전그룹]</a> &nbsp;
	</c:if>
	<% }else{ //이전그룹이 없다면 %>
	<c:if test="${ !((currentPage - 10) < startPage && (currentPage - 10) > 1) }">
		[이전그룹] &nbsp;
	</c:if>
	
	현재 페이지가 속한 페이지그룹 숫자 출력
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
		<c:if test="${ p eq currentPage }">
			<font color="blue" size="4"><b>${ p }</b></font>
		</c:if>
		<c:if test="${ p ne currentPage }">
			<a href="/levelup/${ urlMapping }?page=${ p }&action=${ action }&begin=${ begin }&end=${ end }">${ p }</a>
		</c:if>
	</c:forEach>
	
	다음 페이지 그룹으로 이동
	<c:if test="${ (currentPage + 10) > endPage && ((currentPage + 10) < maxPage) }">
		<a href="/levelup/urlMapping${ urlMapping }?page=${ startPage + 10}">[다음그룹]</a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
		[다음그룹] &nbsp;
	</c:if>
	
	<c:if test="${ currentPage >= maxPage }">
		[맨끝] &nbsp;
		</c:if>
	<c:if test="${ currentPage < maxPage }">
		<a href="/levelup/${ urlMapping }?page=${ maxPage }&action=${ action }&begin=${ begin }&end=${ end }">[맨끝]</a> &nbsp;
	</c:if>
</div>
<<<<<<< HEAD
</c:if> --%>


<!-- ------------------------------------------------------------------- -->
<%-- 결제리스트 출력용 페이징 처리(결제 상태)--%>
<c:if test="${ !empty action and action eq 'status' }">

<div style="text-align:center;">
	<c:if test="${ currentPage eq 1 }" >
		[맨처음] &nbsp;
	</c:if>
	<c:if test="${ currentPage gt 1 }" >
		<a href="/levelup/${ urlMapping }?page=&action=${ action }&type=${ type }">[맨처음]</a> &nbsp;
	</c:if>
	<c:if test="${ ((currentPage - 10) < startPage) && ((currentPage - 10) > 1) }">
		<c:url var="um1" value="${ urlMapping }">
			<c:param name="page" value="${ startPage -10 }" />
			<c:param name="action" value="${ action }" />
			<c:param name="keyword" value="${ keyword }" />
		</c:url>
		<a href="${ um1 }">[이전그룹]</a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage - 10) < startPage && (currentPage - 10) > 1) }">
		[이전그룹] &nbsp;
	</c:if>
	
	<%-- 현재 페이지가 속한 페이지그룹 숫자 출력 --%>
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
		<c:if test="${ p eq currentPage }">
			<font color="blue" size="4"><b>${ p }</b></font>
		</c:if>
		<c:if test="${ !(p eq currentPage) }">
			<a href="/levelup/${ urlMapping }?page=${ p }&action=${ action }&type=${ type }">${ p }</a>
		</c:if>
	</c:forEach>
	
	<%-- 다음 페이지 그룹으로 이동 --%>
	<c:if test="${ (currentPage + 10) > endPage && ((currentPage + 10) < maxPage) }">
		<a href="/levelup/${ urlMapping }?page=${ startPage + 10 }&action=${ action }&type=${ type }">[다음그룹]</a> &nbsp;
	</c:if>
	<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
		[다음그룹] &nbsp;
	</c:if>
	
	<c:if test="${ currentPage >= maxPage }">
		[맨끝] &nbsp;
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<a href="/levelup/${ urlMapping }?page=${ maxPage }&action=${ action }&type=${ type }">[맨끝]</a> &nbsp;
	</c:if>
</div>
</c:if>
</body>
</html>