<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- mebubar -->
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>NOTICE REGIST</title>

	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
		rel="stylesheet">
	
	<!--개인 디자인 추가-->
	<link href="${pageContext.request.contextPath }/resources/css/admin.css"
		rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/admin.js"></script>

	<script>
		$(document).ready(function() {
			if(${!empty vo.fileloca }){
				$(".preview").css("display","block");
				$($("#previewImg")[0]).attr("src","display/${vo.fileloca }/${vo.filename}");
			}
	
		});
	</script>

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
								<h2>NOTICE</h2>
							</div>
							
							<form action="registForm" method="post" enctype="multipart/form-data">
								<div class="common_detail_table">
									<table class="table table-bordered " id="admin_common_table">
										
											<tr>
												<th>카테고리</th>
												<td>
													<div>
														<label class="radio-inline">
															<input type="radio" name="category" value="공지" style="width: 20px;" required>공지
														</label>
														<label class="radio-inline">
															<input type="radio" name="category" value="이벤트" style="width: 20px;" required>이벤트
														</label>
													</div>
												</td>
											</tr>
											<tr>
												<th>제목</th>
												<td><input type="text" name="ntitle" required></td>
											</tr>
											<tr>
												<th>내용</th>
												<td>
													<div id="imgUpload">
														<img src="${pageContext.request.contextPath }/resources/img/admin_imgupload.png" >
														<label for="imgfile">사진업로드</label>
														<input type="file" id="imgfile" name="imgfile" style="display:none" onchange="check_file(this)">
													</div>
													<!-- 미리보기 -->
													<div class="preview" style="margin:10px 0px; display:none">
														<img id="previewImg" src="" style="width:150px; height:100px; object-fit: cover">
													</div>
													<textarea class="form-control admin_none_border" name="ncontent" required></textarea>
												</td>
											</tr>
											
										
									</table>
								</div>
	
								<div class="common_detail_footer" >
									<button type="button" class="btn btn_list" onclick="location.href='/partycode/admin/notice/list'">목록</button>
									<button type="submit" class="btn btn_reg">등록</button>
								</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<script>
		//확장자 & 파일용량 체크 후에 미리보기 부르기
		function check_file(data){
			var imgs = data.value;
			
			var first = imgs.lastIndexOf(".");
			var last = imgs.length;
			var file = imgs.substring(first, last).toLowerCase();
			
			if(file != '.jpg' && file != '.png' && file != '.bmp'){
				alert("jpg, png, bmp만 업로드가 가능합니다.");
				imgs="";
				return false;	//함수종료
			}
			
			var maxSize = 50 * 1024 * 1024;
			if(data.files[0].size > maxSize){
				alert("용량 초과. 50M 이내로 등록 가능합니다.");
				imgs="";
				return false;	//함수종료
			}
			readURL(data);
		}
		
		//미리보기
		function readURL(input){
			if(input.files && input.files[0]){
				
				var reader = new FileReader();
				reader.readAsDataURL(input.files[0]);
				
				reader.onload = function(event) {
					$(".preview").css("display","block");
					$("#previewImg").attr("src",event.target.result);
				}
			}
		}
		
	</script>

</body>
</html>