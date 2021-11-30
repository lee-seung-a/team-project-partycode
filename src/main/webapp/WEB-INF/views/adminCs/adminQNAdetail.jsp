<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- mebubar -->
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	
	<link
		href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
		rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<!--개인 디자인 추가-->
	<link href="${pageContext.request.contextPath }/resources/css/admin.css"
		rel="stylesheet">
	<style>
		body { background-color: white; }
	</style>
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
								<h2>FAQ</h2>
							</div>
							<form action="adminfaqUpdate" method="post">
								<div class="common_detail_table">
									<table class="table table-bordered " id="admin_common_table">
											<tr>
												<th>질문</th>
												<td><input type="text" name="ask" value="${fvo.ask}"></td>
											</tr>
											<tr>
												<th>답변</th>
												<td><textarea class="form-control none_border" name="fcontent">${fvo.fcontent}</textarea></td>
											</tr>	
									</table>
								</div>
								<input type="hidden" name="fno" value="${fvo.fno }"/>
								<div class="common_detail_footer">
									<button type="button" class="btn btn_del" onclick="location.href='adminfaqDelete?fno=${fvo.fno}'">삭제</button>
									<button type="submit" class="btn btn_edit">수정</button>
								</div>
							</form>
							

						</div>
					</div>
				</div>
			</div>
	</section>


</body>
</html>