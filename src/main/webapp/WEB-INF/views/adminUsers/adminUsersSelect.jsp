<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>고객조회</title>
	
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<!--개인 디자인 추가-->
	<link href="${pageContext.request.contextPath }/resources/css/admin.css"
		rel="stylesheet">

	<!--  쓸지 안쓸지 모르겠다 모달~~ -->
	<script>
	$(document).ready(function(){
		$("#admin_common_table").on("click", "tr", function(){
			$(this).siblings().removeAttr("id");
		    $(this).attr("id","clicked"); 
		    
		    let checkedNo = $(this).children().first().next().html();
		    
		    $("#clicked").click(function(){
		      $("#clicked_modal").modal();
		    })
		})
		
		//로드되고 가입일이 선택되어 있을 때... 
		if($("select[name=searchType] option:selected").val()==="regdate"){
			document.querySelector("#search_others").style.display = "none";
			document.querySelector("#search_others input").disabled =true;
			document.querySelector("#search_date").style.display = "block";
			document.querySelector("#search_date input").disabled =false;
		}
		
	});
	</script>


	<script >
	$(function () {
		//console.log($(".date"))
		$(".date").datepicker({
			dateFormat:"yy-mm-dd",
			dayNamesMin:["일", "월", "화", "수", "목", "금", "토"],
			monthNames:["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		});
	});
	</script>		
</head>
<body>
	<%@ include file="../include/admin_menubar.jsp"%>

	<section >
		<div class="admin_common" >
			<div class="container">
				<div class="row">
					<div class="col-sm-12" >
						<div class="common">

							<div class="common_title">
								<h2>USERS <small style="margin-left: 20px;">고객조회</small></h2>
							</div>
							<form action="inquiryList">
								<div class="common_header">
									<div>
										<button class="btn btn-default" type="submit">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
									<div class="common_search" id="search_others">
										<input type="text" class="form-control" name="searchName"
											placeholder="Search..." value="${pageVO.cri.searchName}">
									</div>
									<div class="common_search" id="search_date" style="display:none ">
										<div>
											<input type="text" class="form-control date" name="searchName1"
												placeholder="Search..." value="${pageVO.cri.searchName1}">
										</div>
										<div style="width:20px;">
											<span>~</span>
										</div>
										<div>
											<input type="text" class="form-control date" name="searchName2"
												placeholder="Search..." value="${pageVO.cri.searchName2}">
										</div>
									</div>

									<div class="common_search_type">
										<select class="form-control " name="searchType" onChange="regdateChange(this.value)">
											<option value="all" ${pageVO.cri.searchType eq 'all' ? 'selected' : '' }>전체</option>
											<option value="uno" ${pageVO.cri.searchType eq 'uno' ? 'selected' : '' }>회원코드</option>
											<option value="uname" ${pageVO.cri.searchType eq 'uname' ? 'selected' : '' }>이름</option>
											<option value="regdate" ${pageVO.cri.searchType eq 'regdate' ? 'selected' : '' }>가입일</option>
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
								<table class="table table-bordered " id="admin_common_table">
									<thead>
										<tr>
											<th>UNO.</th>
											<th>ID</th>
											<th>이름</th>
											<th>연락처</th>
											<th>이메일</th>
											<th>주소</th>
											<th>가입일</th>
											<th>포인트</th>
											<th style="width:150px">최근예약</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="vo" items="${list }" >
											<tr>
												<td>${vo.uno }</td>
												<td>${vo.id }</td>
												<td>${vo.uname }</td>
												<td>${vo.tellnum }</td>
												<td>
													<c:choose>
														<c:when test="${fn:length(vo.email1) > 10}">
															${vo.email1 }${fn:substring(vo.email2, 0, 2)}..
														</c:when>
														<c:otherwise>
															${vo.email1 }${vo.email2 }
														</c:otherwise>										
													</c:choose>
												</td>
												<td>(${vo.addrZipNum })
													<c:choose>
														<c:when test="${fn:length(vo.addrBasic) > 15}">
															${fn:substring(vo.addrBasic, 0, 15)}...
														</c:when>
														<c:otherwise>
															${vo.addrBasic }
														</c:otherwise>										
													</c:choose>
												</td>
												<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /></td>
												<td>${vo.point }</td>
												<td>
													<c:choose>
														<c:when test="${fn:length(vo.recentReserv) > 10}">
															${fn:substring(vo.recentReserv, 0, 10)}...
														</c:when>
														<c:otherwise>
															${vo.recentReserv }
														</c:otherwise>										
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div style = "text-align:center; font-size:15px; margin-top:60px" >
									<c:if test="${empty list}">
										조회결과가 없습니다.
									</c:if>
								</div>
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
				                    <input type="hidden" name="searchName1" value="${pageVO.cri.searchName1 }">
				                    <input type="hidden" name="searchName2" value="${pageVO.cri.searchName2 }">
				                    
			                    </div>
					    	</form>


						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 회원클릭시 예약정보 못할것같은디-->
	<section>
		<!-- Trigger the modal with a button -->
		<div class="admin_users_modal">
			<!-- Modal -->
			<div class="modal fade" id="clicked_modal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">고객예약정보</h4>
						</div>
						<div class="modal-body">
							<table class="modal_users_reserv">
								<tr>
									<th>예약번호</th>
									<th>예약일시</th>
									<th>결제번호</th>
									<th>결제금액</th>
								</tr>
								<tr>
									<td>R2345678</td>
									<td>2021.07.15</td>
									<td>P1234567</td>
									<td>50,000</td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
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
			location.href="inquiryList?pageNum=1&amount="+data.value
							+"&searchType=${pageVO.cri.searchType}"
							+"&searchName=${pageVO.cri.searchName}"
							+"&searchName1=${pageVO.cri.searchName1}"
							+"&searchName2=${pageVO.cri.searchName2}";
		}
		
		
		//searchType-regdate 함수
		function regdateChange(searchType){
			if(searchType==="regdate"){
				document.querySelector("#search_others").style.display = "none";
				document.querySelector("#search_others input").disabled =true;
				document.querySelector("#search_date").style.display = "block";
				document.querySelector("#search_date input").disabled =false;
			}else{
				document.querySelector("#search_date").style.display = "none";
				document.querySelector("#search_date input").disabled =true;
				document.querySelector("#search_others").style.display = "block";
				document.querySelector("#search_others input").disabled =false;
			}
			
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