<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" 	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link rel="stylesheet" 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
.container {
	text-align: center;
}

.card1 {
	width: 500px;
	margin: 0 auto;
}

.container #presentpoint {
	text-align: right;
}
</style>
<title>인증번호</title>
</head>
<body>
<h1>인증번호</h1>
	 <h1><%String value1 = request.getParameter("authKey"); %></h1> 
	 <h1><%=value1 %></h1>
</body>


</html>