<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>

<style>
.container-md{
	display: flex;
	justify-content: center;
	flex-direction: column;
	text-align: center;
}
.clock{
	font-size: 30px;
	font-weight: 700;
	color: green;
}
</style>
<jsp:include page="layout/header.jsp"></jsp:include>

<br>

<div class="container-md">
<h1>
	My first Spring Project  
</h1>
<br>
<div class="clock">
	<p id="date"></p>
	<p id="time"></p>
</div>


</div>

<br>
<script type="text/javascript">
const WEEK = ["SUN","MUN","TUE","WED","THU","FRI","SAT"];

function updatetime(){
	let now = new Date();
document.getElementById('time').innerText = 
        zerroPadding(now.getHours(), 2) + ":" +
        zerroPadding(now.getMinutes(), 2) + ":" +
        zerroPadding(now.getSeconds(), 2);

document.getElementById('date').innerText = 
        now.getFullYear() + "-" +
        zerroPadding(now.getMonth() +1, 2) + "-" +
        zerroPadding(now.getDate(), 2) + " " +
        WEEK[now.getDay()];
}
updatetime();
setInterval(updatetime,1000);

function zerroPadding(num, digit){
    return String(num).padStart(digit, '0');
}
	
	

</script>
<jsp:include page="layout/footer.jsp"></jsp:include>