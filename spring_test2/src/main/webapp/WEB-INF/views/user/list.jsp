<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<jsp:include page="../layout/header.jsp" />
	<div class="container-md">
	<h1>User List Page</h1>	
	<sec:authentication property="principal.uvo.nickName" var="authNick"/>
	<sec:authentication property="principal.uvo.email" var="authEmail"/>
	
<div class="row">
	<c:forEach items="${userList }" var="uvo">
	<div class="col">
	<div class="card border-primary mb-3" style="max-width: 18rem;">
		  <div class="card-body text-primary">
		   <h5 class="card-title">${uvo.nickName }</h5>
		   <p class="card-text">${uvo.email }</p>
		   <p class="card-text">
		   (<c:forEach items="${uvo.authList }" var="authList">
		   		${authList.auth }
		   </c:forEach>)
		   </p>
		   <p class="card-text">${uvo.lastLogin }</p>
		   <p class="card-text">${uvo.regDate }</p>
	  	</div>
	</div>
	</div>
	
	</c:forEach>
</div>		
	
	
	
	
	</div>
	
	
	<jsp:include page="../layout/footer.jsp" />