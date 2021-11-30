<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>      
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
	.admin_common .common_footer .txt_mail {
		margin: 0;
		padding: 4px 12px;
	}
	
	.admin_common .btn_edit {float:none; margin:0; background-color:cornflowerblue; color:#fff; padding:3px 8px;}
	.table-bordered tbody tr td {padding:4px;}
	</style>
	<script>
 			//카테고리 선택시 검색창 -> 카테고리 선택창 
			function change(a) {
				console.log(a.value)

				var searchselect = document.querySelector('.common_search_type');
				var commonsearch = document.querySelector('.common_search');
				if (a.value != "theme") {
					searchselect.style.display = "none";
					console.dir(searchselect.firstElementChild)

					searchselect.firstElementChild.disabled = true;
					commonsearch.style.display = "block";
					commonsearch.firstElementChild.disabled = false;
					return;
				} else {

					searchselect.style.display = "block";
					searchselect.firstElementChild.disabled = false;

					commonsearch.style.display = "none";
					commonsearch.firstElementChild.disabled = true;
				}

			}
 			
 		
		</script>
</head>

<body>
	<%@ include file="../include/admin_menubar.jsp" %>

	<section>
		<div class="admin_common">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="common">

							<div class="common_title">
								<h2>
									CUSTOMER SERVICE<small style="margin-left: 20px;">approval</small></small>
								</h2>
							</div>
						</div>		
										
						<input type="hidden" name="pageNum" value="1">
	                    <input type="hidden" name="amount" value="${pageVO.cri.amount }">
	                    	
						<form action="adminApproval">
							<div class="common_header">
								<div>
									<button class="btn btn-default" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
								<div id="changeselect"  class="common_search">
									<input type="text" class="form-control" name="searchName"
										  placeholder="Search..." value="${pageVO.cri.searchName}">
								</div>
								
								<div class="common_search_type" style="display:none;">
									<select class="form-control" name="searchName" disabled>
										<option value="hobby">취미</option>
				                        <option value="travel">여행</option>
				                    	<option value="food">맛집</option>
				                    	<option value="study">스터디</option>
				                    	<option value="party">파티</option>
				                    	<option value="etc">기타</option>
				                	</select>
								</div>
									
								<div class="common_search_type">
									<select class="form-control" name="searchType" id="selectType" onChange="change(this)">
										<option value="code" ${pageVO.cri.searchType eq 'code' ? 'selected' : '' }>코드</option>
				                        <option value="title"${pageVO.cri.searchType eq 'title' ? 'selected' : '' }>제목</option>
				                        <option value="writer"${pageVO.cri.searchType eq 'writer' ? 'selected' : '' }>신청자</option>
				                        <option value="theme"${pageVO.cri.searchType eq 'theme' ? 'selected' : '' }>테마</option>		
				                    </select>
								</div>

									
								<input type="hidden" name="pageNum" value="1">
	                  			<input type="hidden" name="amount" value="${pageVO.cri.amount }">
	                       		
								
								<div class="common_length">
									<select class="form-control " onChange="handleChange(this)">
										<option value="10" ${pageVO.amount eq 10 ? 'selected' : '' }>10개씩 보기</option>
										<option value="20" ${pageVO.amount eq 20 ? 'selected' : '' }>20개씩 보기</option>
										<option value="30" ${pageVO.amount eq 30 ? 'selected' : '' }>30개씩 보기</option>
									</select>
								</div>
								

							</div>
						</form>

						<div class="common_table">
							<form action="adminpartyUpdate" method="post">
							<table class="table table-bordered " id="admin_common_table">
								<thead>
									<!-- 전체선택기능 넣어야 함 -->
									<tr>
										<th style="width: 30px;"><input type="checkbox"
											id="check-all" class="flat"></th>
										<th>테마</th>
										<th>코드</th>
										<th>제목</th>
										<th>신청일</th>
										<th>개최예정일</th>
										<th>신청자</th>
										<th>관리자확인</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="party" items="${partylist}">
										<tr>
											<th><input type="checkbox" class="flat"></th>
											<td>${party.ptheme }</td>
											<td>${party.partycode }</td>
											<td><a href="party_detail?pno=${party.pno }">${party.ptitle }</a></td>
											<td><fmt:formatDate value="${party.pregdate }" pattern="yyyy-MM-dd"/></td>
											<td>${party.pdate }</td>
											<td>${party.pid }</td>
											<td style="text-align:center;"><button type="submit" class="btn btn_edit">
											승인</button></td>
											<input type="hidden" name="pno" value="${party.pno }">
											<input type="hidden" name="padmin" value="${party.padmin }">
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
						</div>
							
						<!--페이지 네이션-->
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
				                    
				               <!-- freeList에 전닫될 값을 hidden으로 처리 -->
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
	</section>


	<script>
	//msg처리
	(function(){
		var msg = "${msg}";
		
		if(msg !==""){
			alert(msg);
		}
	})();
	
	
	
	//n개 보기 함수
	function handleChange(data){
		//mapper에서는 searchName이 공백인경우의 처리
		location.href="list?pageNum=1&amount="+data.value
						+"&searchType=${pageVO.cri.searchType}"
						+"&searchName=${pageVO.cri.searchName}";
	}
	
	//페이지네이션 a태그에 동일한 이벤트 거는 방법 (이벤트위임)
	var pagination = document.querySelector(".pagination")
	/* console.log(pagenation) */
	pagination.onclick = function(){
		
		event.preventDefault();	//a의 고유이벤트 제거
		if(event.target.tagName != 'A') return;
		
		
		//폼태그는 name속성.name속성 input을 선택할 수 있습니다.
		var pageNum = event.target.dataset.pagenum;
		document.pageForm.pageNum.value = pageNum;
		
		//폼서브밋
		document.pageForm.submit();
		
	}	
	</script>
</body>
</html>


