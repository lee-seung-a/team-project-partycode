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
	.answerarea {width:730px; text-align:left;}
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
								<h2>QNA</h2>
							</div>

							<div class="common_detail_table">
									<!-- <form action="adminqnaUpdate" method="post"> -->
								<table class="table table-bordered " id="admin_common_table">
										<tr>
											<th>제목</th>
											<td><input type="text" value="${adminqvo.qtitle }"></td>
										</tr>
										<tr>
											<th>작성자 ID</th>
											<td><input type="text" value="${adminqvo.id }"></td>
										</tr>
										<tr>
											<th>내용</th>
											<td><textarea class="form-control none_border">${adminqvo.qcontent }</textarea></td>
										</tr>
									<!-- </form> -->
								</table>
							</div>
							
									<form action="adminqnaUpdate" method="post">
									<table class="table table-bordered" id="admin_common_table">
										<tbody>	
											<tr>
												<th>답변</th>
												<td><textarea class="form-control none_border" name="answer">${adminqvo.answer }</textarea></td>
											</tr>
										</tbody>
									</table>

											<input type="hidden" name="qno" value="${adminqvo.qno }"/>
											<div class="common_detail_footer">
												<button type="button" class="btn btn_edit" onclick="location.href='adminqnaDelete?qno=${adminqvo.qno}'">삭제</button>
												<button type="submit" class="btn btn_edit">답변작성</button>
											</div>
							</form>					



						</div>
					</div>
				</div>
			</div>
	</section>


</body>
</html>