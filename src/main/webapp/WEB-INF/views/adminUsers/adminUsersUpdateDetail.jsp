<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>USERS DETAIL</title>
	
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
		rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!--개인 디자인 추가-->
	<link href="${pageContext.request.contextPath }/resources/css/admin.css"
		rel="stylesheet">
	<style>
		body { background-color: white; }
	</style>
	
	<script>
		$(document).ready(function() {
			var items = [];
			$("select[name=email2] option").each(function() {
				items.push($(this).val());
			});
			
			items.forEach(function(el, index) {
				if (el === "${vo.email2}") {
					$($('select[name=email2] option:eq('+index+')')).attr("selected", "selected");
				}
			});
	
		});
	</script>


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
								<h2>USERS</h2>
							</div>
							<form action="update" name="updateForm">
								<div class="common_detail_table">
									<table class="table table-bordered " id="admin_common_table">
										<tr>
											<th>회원코드</th>
											<td><input type="text" name="uno" value="${vo.uno }" readonly></td>
										</tr>
										<tr>
											<th>ID</th>
											<td><input type="text" value="${vo.id }" readonly></td>
										</tr>
										<tr>
											<th>이름</th>
											<td><input type="text" name="uname" value="${vo.uname }" required></td>
										</tr>
										<tr>
											<th>연락처</th>
											<td><input type="text" name="tellnum" value="${vo.tellnum }" required></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td id="emailSelect">
												<input type="text" name="email1" value="${vo.email1 }" required>
												<select class="form-control admin_none_border" name="email2" required>
												    <option value="naver.com">@naver.com</option>
												    <option value="gmail.com">@gmail.com</option>
												    <option value="hanmail.com">@hanmail.com</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>주소</th>
											<td id="adressSelect">
												<input type="text" id="addrZipNum" name="addrZipNum" value="${vo.addrZipNum }" readonly>
				                                <button type="button" class="btn" onclick="goPopup()">주소찾기</button>
				                                <input type="text" id="addrBasic" name="addrBasic" value="${vo.addrBasic }">
				                                <input type="text" id="addrDetail" name="addrDetail" value= "${vo.addrDetail }">
											</td>
										</tr>
										<tr>
											<th>가입일</th>
											<td><input type="text" value="${vo.regdate }"  readonly></td>
										</tr>
										<tr>
											<th>포인트</th>
											<td><input type="number" name="point" value="${vo.point }"></td>
										</tr>
										<tr>
											<th style="text-align:center; " colspan="2">예약내역</th>
										</tr>
										<tr>
											<td colspan="2">
												<table class="">
													<tr>
														<th style="background-color: white; text-align:left; padding-bottom:10px">예약번호</th>
														<th>예약일시</th>
														<th>파티이름</th>
														<th>주최자</th>
													</tr>
													<c:forEach var="vo" items="${list }">
														<tr>
															<td>${vo.this_no }</td>
															<td>${vo.this_regdate }</td>
															<td>${vo.your_title }</td>
															<td>${vo.your_id }</td>
														</tr>
													</c:forEach>
												</table>
											</td>
										</tr>
									</table>
								</div>
	
								<div class="common_detail_footer">
									<button type="button" class="btn btn_delete" onclick="location.href='delete?uno=${vo.point }' ">삭제</button>
									<button type="submit" class="btn btn_edit" >수정</button>
								</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<script>
	    //팝업창 띄우기
	    function goPopup(){
			var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570, height=420, scrollbars=yes, resizable=yes"); 
		}
	    
	    //주소정보의 연계데이터를 돌려받는 콜백함수
	    function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			
	    	//console.log(roadAddrPart1,addrDetail,zipNo);
			document.updateForm.addrZipNum.value = zipNo;
			document.updateForm.addrBasic.value = roadAddrPart1;
			document.updateForm.addrDetail.value = addrDetail;
		}
    
    </script>

</body>
</html>