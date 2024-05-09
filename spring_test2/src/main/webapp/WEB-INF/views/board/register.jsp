<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../layout/header.jsp" />

<div class="container-md">
	<h1>Board Register Page</h1>
	<sec:authentication property="principal.uvo.nickName" var="authNick"/>
	<form action="/board/insert" method="post" enctype="multipart/form-data">

		<div class="mb-3">
			<label for="t" class="form-label">title</label> <input type="text"
				class="form-control" id="t" placeholder="title" name="title">
		</div>
		<div class="mb-3">
			<label for="w" class="form-label">writer</label> <input type="text"
				class="form-control" id="n" placeholder="writer" value="${authNick }" name="writer">
		</div>
		<div class="mb-3">
			<label for="c" class="form-label">content</label>
			<textarea class="form-control" id="c" name="content"
				aria-label="With textarea"></textarea>
		</div>

		<!-- 파일 입력라인 추가 -->

		<div class="mb-3">
			<label for="file" class="form-label">Files</label> <input type="file"
				class="form-control" id="file" name="files" multiple="multiple"
				style="display: none"> <br>
			<button type="button" class="btn btn-secondary" id="trigger">FileUplode...</button>
		</div>

		<div class="mb-3" id="fileZone">
		
		</div> 

		<button type="submit" class="btn btn-primary" id="regBtn">등록</button>

	</form>
</div>
<script type="text/javascript" src="/re/js/boardRegister.js"></script>
<jsp:include page="../layout/footer.jsp" />

