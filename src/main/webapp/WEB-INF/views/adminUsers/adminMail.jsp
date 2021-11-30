<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ADMIN MAIL</title>

<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--개인 디자인 추가-->
<link href="${pageContext.request.contextPath }/resources/css/admin.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>


</head>
<body>
	
	<%@ include file="../include/admin_menubar.jsp"%>

	<section>
		<div class="admin_common_detail">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="common_detail">

							<div class="common_detail_title">
								<h2>MAIL</h2>
							</div>
							
							<form action="mailSending" method="post">
								<div class="common_detail_table">
									<table class="table table-bordered " id="admin_common_table">
										<tr>
											<th>받는사람</th>
											<td>
												<input type="text" name="mailStr" class="form-control admin_none_border"
														placeholder="쉼표(,)로 구분하여 입력" value="${str }"> 
											</td>
										</tr>
										<tr>
											<th>제목</th>
											<td>
												<input type="text" name="title" class="form-control admin_none_border">
											</td>
										</tr>
										<tr>
											<th>내용</th>
											<td>
												<textarea name="content" class="form-control admin_none_border"></textarea>
											</td>
										</tr>
									</table>
								</div>
	
								<div class="common_detail_footer" style="margin-left: 640px">
									<button type="submit" class="btn">보내기</button>
								</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

    
</body>
</html>