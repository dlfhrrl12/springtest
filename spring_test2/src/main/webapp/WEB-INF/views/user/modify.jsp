<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../layout/header.jsp" />
<div class="container-md">
<h1>Member Modify Page</h1>
<form action="/user/modify" method="post">
		<sec:authentication property="principal.uvo.email" var="authEmail"/>
        <sec:authentication property="principal.uvo.nickName" var="authNick"/>
        <sec:authentication property="principal.uvo.regDate" var="authregDate"/>
        <sec:authentication property="principal.uvo.lastLogin" var="authlastLogin"/>
	<div class="mb-3">
	  <label for="e" class="form-label">E-mail</label>
	  <input type="email" class="form-control" name="email" id="e" value="${authEmail }" placeholder="example@test.com..." readonly="readonly">
	</div>
	<div class="mb-3">
	  <label for="r" class="form-label">REG_DATE</label>
	  <input type="text" class="form-control" name="reg_date" id="r" value="${authregDate }" readonly="readonly">
	</div>
	<div class="mb-3">
	  <label for="l" class="form-label">Last_Login</label>
	  <input type="text" class="form-control" name="last_login" id="l" value="${authlastLogin }" readonly="readonly">
	</div>
	<div class="mb-3">
	  <label for="p" class="form-label">PassWord</label>
	  <input type="password" class="form-control" name="pw" id="p" placeholder="Password...">
	</div>
	<div class="mb-3">
	  <label for="n" class="form-label">NickName</label>
	  <input type="text" class="form-control" name="nickName" id="n" value="${authNick }" placeholder="Name...">
	</div>
	
	
	<button type="submit" class="btn btn-primary">Modify</button>
	<a href="/user/remove"><button type="button" class="btn btn-danger">delete</button></a>
</form>

</div>
<jsp:include page="../layout/footer.jsp" />