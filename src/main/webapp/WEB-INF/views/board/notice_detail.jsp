<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>NOTICE DETAIL</title>
	
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
			rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>

	<style>
	 * {
	 	text-decoration: none; list-style: none; padding: 0; margin: 0;
	 }
	.notice_detail {
		width: 800px;
		margin: 0 auto;
	}
	#notice_table th {
		background-color: #e9ecef;
		width: 150px;
	}
	
	</style>
	<script>
		//이미지파일 있다면 불러오기
		$(document).ready(function() {
			if(${!empty vo.fileloca }){
				$(".preview").css("display","block");
				$($("#previewImg")[0]).attr("src","../display/${vo.fileloca }/${vo.filename}");
			}
		});
		
	</script>

</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
	<section>
		<div class="notice_detail" style="margin-top:400px">
			<div class="container" style="margin-left:-200px;">
				<div class="">
						<div class="notice_detail">

							<div class="notice_detail_title">
								<h2>공지사항</h2>
							</div>
							
							<div class="notice_detail_table">
								<table class="table table-bordered " id="notice_table">
									<tr>
										<th>번호</th>
										<td>${vo.nno}</td>
										<th>조회수</th>
										<td style="width :299px">${vo.hit}</td>
									</tr>
									<tr>
										<th>작성일</th>
										<td colspan="3">${vo.regdate}</td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">[${vo.category}] ${vo.ntitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">
											<!-- 미리보기 -->
											<div class="preview" style="margin:10px 0px; display:none">
												<img id="previewImg" src="" style="width:400px; height:300px; object-fit: cover">
											</div>
											<div style="white-space:pre-line;">${vo.ncontent}</div>
										</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td colspan="3">${vo.nid}</td>
									</tr>
									<tr>
										
									</tr>
								</table>
							</div>

							<div class="notice_detail_footer" style="margin-left:750px">
								<button type="button" class="btn btn_list" onclick="location.href='/partycode/board/notice'">목록</button>
							</div>
							
						</div>
					</div>
				</div>
			</div>
	</section>
	
	
</body>
</html>