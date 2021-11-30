<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>로그인</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
<!-- 	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/> -->

	<link rel="stylesheet"  href="${pageContext.request.contextPath }/resources/css/login.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Candal&display=swap" rel="stylesheet">
	<style>
	.wrap-login100 {width: 960px;}
	  
	
	</style>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100"><!--로그인 상자-->
				<div style="position:relative;">
				<!--div class="login100-pic js-tilt" data-tilt--><!--트렌스폼 -->
					<%-- <img src="${pageContext.request.contextPath }/resources/img/꼼데.png" alt="IMG"> --%>
					<div style="width:400px; font-family: 'Noto Serif Display', serif; font-size:65px; position:absolute; left:-20px; top:100px;">PARTYCODE</div>
				</div>

				<form class="login100-form validate-form" action="login" method="post">
					<span class="login100-form-title">
						Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "ID를 입력해주세요">
						<input class="input100" type="text" name="id" placeholder="ID">
						<span class="focus-input100"></span>
						
					</div>

					<div class="wrap-input100 validate-input" data-validate = "password를 입력해 주세요">
						<input class="input100" type="password" name="pw" placeholder="Password">
						<span class="focus-input100"></span>
						
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							로그인
						</button>
					</div>

					<div class="text-center p-t-12">
						<a class="txt2" href="#">
							아이디 / 비밀번호 찾기
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="usersignUp">
							회원가입
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
							
							<button type="submit"></button>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>