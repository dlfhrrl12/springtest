<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"/>
	<div class="container-md">
	<h1>Board modify Page</h1>
	<c:set value="${bdto.bvo}" var="bvo"></c:set>
			<form action="/board/modify" method="post" enctype="multipart/form-data">
			<div class="mb-3">
		  		<label for="n" class="form-label">bno</label>
		  		<input type="text" class="form-control" name="bno" id="n" value="${bvo.bno }" readonly="readonly" placeholder="bno..">
			</div>
			<div class="mb-3">
		  		<label for="t" class="form-label">title</label>
		  		<input type="text" class="form-control" name="title" id="t" value="${bvo.title }" placeholder="titl..">
			</div>
			<div class="mb-3">
		  		<label for="w" class="form-label">writer</label>
		  		<input type="text" class="form-control" name="writer" value="${bvo.writer }" id="w" readonly="readonly" placeholder="writer..">
			</div>
			<div class="mb-3">
			  <label for="c" class="form-label">content</label>
			  <textarea class="form-control" id="c" name="content" aria-label="With textarea">${bvo.content }</textarea>
			</div>
			<!-- 파일 추가 -->
			
			
			
			<!-- 파일 표시 -->
			<c:set value="${bdto.flist}" var="flist"></c:set>
			<div class="mb-3">
				<ul class="list-group list-group-flush">
	  				<!-- 파일 개수만큼 li를 반복하여 파일 표시 타입이 1인경우만 표시 -->
	  				<!-- li => div => img -->
	  				<!-- => div => 파일이름, 작성일, span size -->
	  				<c:forEach items="${flist }" var="fvo">
	  				<li class="list-group-item">
	  					<c:choose>
		  					<c:when test="${fvo.file_type > 0 }">
			  					<div>
			  						<img alt="그림없음" src="/upload/${fvo.save_dir }/${fvo.uuid}_${fvo.file_name}">
			  					</div>
		  					</c:when>
		  					<c:otherwise>
		  						<div>
		  							<!-- 파일 타입이 0인경우 아이콘 모양 하나 가져와서 넣기 -->
		  						</div>
		  					</c:otherwise>
	  					</c:choose>
	  					<div>
	  						<!-- 파일이름 작성이 사이즈 -->
	  						<div>${fvo.file_name }</div>
	  						${fvo.reg_date }
	  						<span class="badge text-bg-warning">${fvo.file_size }Byte</span>
	  						<button type="button" data-uuid="${fvo.uuid }" class="btn btn-outline-danger file-x">X</button>
	  					</div>
	  				</li>
					</c:forEach>
	  			</ul>
	  			</div>
	  			
	  			<!-- 파일 입력 라인 추가 -->
			<div class="mb-3">
		  		<label for="file" class="form-label">files...</label>
		  		<input type="file" class="form-control" name="files" id="file" multiple="multiple" style="display: none"> <br>
		  		<button type="button" class="btn btn-info" id="trigger">FileUpload</button>
			</div>
			<!-- 파일 목록 표시라인 -->
			<div class="mb-3" id="fileZone">
				
			</div>
	  			
			<button type="submit" class="btn btn-secondary" id="regBtn">수정</button>			
			<a href="/board/list"><button type="button" class="btn btn-primary">list</button></a>
			</form>
		
	</div>
	<script type="text/javascript" src="/resources/js/boardModify.js"></script>
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp" />