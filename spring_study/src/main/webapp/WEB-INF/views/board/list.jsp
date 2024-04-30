<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	
	<jsp:include page="../layout/header.jsp"/>

<div class="container-md">
	<h1>Board List Page</h1>
	<form action="/board/list" method="get" class="row g-3">
      <div class="input-group mb-3">
        <select class="form-select" name="type" id="autoSizingSelect">
          <option ${ph.pgvo.type == null ? 'selected' : '' } selected>Choose...</option>
          <option ${ph.pgvo.type eq 't' ? 'selected' : '' } value="t">title</option>
          <option ${ph.pgvo.type eq 'w' ? 'selected' : '' } value="w">writer</option>
          <option ${ph.pgvo.type eq 'c' ? 'selected' : '' } value="c">content</option>
          <option ${ph.pgvo.type eq 'tc' ? 'selected' : '' } value="tc">title&content</option>
          <option ${ph.pgvo.type eq 'wc' ? 'selected' : '' } value="wc">writer&content</option>
          <option ${ph.pgvo.type eq 'tw' ? 'selected' : '' } value="tw">title&writer</option>
          <option ${ph.pgvo.type eq 'twc' ? 'selected' : '' } value="twc">All</option>
        </select>
		
        <input type="text" name="keyword" class="form-control" value="${ph.pgvo.keyword }" placeholder="search..." aria-label="Recipient's username" aria-describedby="button-addon2" />
        <input type="hidden" name="pageNo" value="1">
        <input type="hidden" name="qty" value="10">
        <button type="submit" class="btn btn-primary position-relative">
          search
          <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
           	${ph.totalCount }
            <span class="visually-hidden">unread messages</span>
          </span>
        </button>
      </div>
    </form>
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th>#</th>
				<th>title</th>
				<th>writer</th>
				<th>reg_date</th>
				<th>read_count</th>
				<th>cmt_qty</th>
				<th>has_file</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="bvo">
			<tr>
				<th>${bvo.bno }</th>
				<th><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></th>
				<th>${bvo.writer }</th>
				<th>${bvo.reg_date }</th>
				<th>${bvo.read_count }</th>
				<th>${bvo.cmt_qty }</th>
				<th>${bvo.has_file }</th>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
      <c:if test="${ph.prev }">
        <li class="page-item">
          <a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
            <span aria-hidden="true">«</span>
          </a>
        </li>
        </c:if>
        
        <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
        	<li class="page-item"><a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>
        </c:forEach>
        
        <c:if test="${ph.next }">
        <li class="page-item">
          <a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
            <span aria-hidden="true">»</span>
          </a>
        </li>
        </c:if>
      </ul>
    </nav>

</div>

	

	<jsp:include page="../layout/footer.jsp" />