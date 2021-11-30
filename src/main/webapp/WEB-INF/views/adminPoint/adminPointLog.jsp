<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>PointLog</title>
	
	<link
		href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
		rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	
	<!--개인 디자인 추가-->
	<link href="${pageContext.request.contextPath }/resources/css/admin.css"
		rel="stylesheet">
</head>

<body>
	<%@ include file="../include/admin_menubar.jsp"%>

	<section>
		<div class="admin_common">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="common">

							<div class="common_title">
								<h2>POINT LOG</h2>
							</div>
							<form action="pointlog">
								<div class="common_header">
									<input type="hidden" name="pageNum" value="1">
	                       			<input type="hidden" name="amount" value="${pageVO.cri.amount }">
									<div>
										<button class="btn btn-default" type="submit">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
									<div class="common_search">
										<input type="text" class="form-control" name="searchName"
											placeholder="Search..." value="${pageVO.cri.searchName}">
									</div>

									<div class="common_search_type">
										<select class="form-control" name="searchType" >
											<option value="uno" ${pageVO.cri.searchType eq 'uno' ? 'selected' : '' }>회원번호</option>
										</select>
									</div>
									
									<div class="common_length">
										<select class="form-control " onChange="handleChange(this)">
											<option value="10" ${pageVO.amount eq 10 ? 'selected' : '' }>10개씩 보기</option>
											<option value="25" ${pageVO.amount eq 25 ? 'selected' : '' }>20개씩 보기</option>
											<option value="50" ${pageVO.amount eq 50 ? 'selected' : '' }>30개씩 보기</option>
										</select>
									</div>
								</div>
							</form>

							<div class="common_table">
								<table class="table table-bordered " id="admin_common_table">
									<thead>
										<tr>
											<th>UNO</th>
											<th>ID</th>
											<th>충전포인트</th>
											<th>사용포인트</th>
											<th>비고</th>
											<th>변동시간</th>
											<th>잔여포인트</th>
										</tr>
									</thead>
									<c:forEach var="vo" items="${list }">
										<tbody>
											<tr>
												<td style="width:65px">${vo.uno }</td>
												<td style="width:100px">${vo.my_id }</td>
												<td style="width:100px">${vo.charge }</td>
												<td style="width:100px">${vo.use }</td>
												<td>${vo.title }</td>
												<td style="width:170px">${vo.this_regdate }</td>
												<td style="width:100px">${vo.remainpoint }</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							</div>

							<!--페이지네이션-->
				    		<form name="pageForm">
			                    <div style="text-align: center; margin-top:80px">
				                    <ul class="pagination">
				                    	<c:if test="${pageVO.prev }">
				                        	<li><a href="#" data-pagenum="${pageVO.startPage-1} ">이전</a></li>
				                        </c:if>
				                        	
				                        <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
				                        	<li class="${num eq pageVO.pageNum ? 'active' : '' }">
				                        		<a href="#" data-pagenum="${num}">${num }</a>
				                        	</li>
				                        </c:forEach>
				                        
				                        <c:if test="${pageVO.next }" >
				                        	<li><a href="#" data-pagenum="${pageVO.endPage+1}">다음</a></li>
				                        </c:if> 
				                    </ul>
				                    
				                    <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
				                    <input type="hidden" name="amount"  value="${pageVO.cri.amount }">
				                    <input type="hidden" name="searchType" value="${pageVO.cri.searchType }">
				                    <input type="hidden" name="searchName" value="${pageVO.cri.searchName }">
				                    
			                    </div>
					    	</form>
					    	
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<script>
	//n개 보기 함수
	function handleChange(data){
		//mapper에서는 searchName이 공백인경우의 처리
		location.href="pointlog?pageNum=1&amount="+data.value
						+"&searchType=${pageVO.cri.searchType}"
						+"&searchName=${pageVO.cri.searchName}";
	}
	
	//페이징
	var pagination = document.querySelector(".pagination")
	pagination.onclick = function(){
		
		event.preventDefault();	//a의 고유이벤트 제거
		if(event.target.tagName != 'A') return;
		
		var pageNum = event.target.dataset.pagenum;
		document.pageForm.pageNum.value = pageNum;
		
		document.pageForm.submit();
		
	}
	
	
	</script>
</body>
</html>