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
	<title>FAQ & QNA | 관리자페이지</title>
	
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!--개인 디자인 추가-->
	<link href="${pageContext.request.contextPath }/resources/css/admin.css" rel="stylesheet">
	
	<style>
	
  .common_header {
    margin-bottom: 50px;
  }
  .common_header {
    overflow: hidden;
  }
  .common_header div:not(:last-of-type) {
    display: inline;
    float: right;
  }
  .common_search_type {
    margin-right: 10px;
  }
  
  .common_length{
    float: left;
    width: 130px;
    margin-left: 10px;
  }
  
  #noanswer {margin:0 20px;}
  #noanswer button { background-color:cornflowerblue; color:#fff;}
	
	</style>
	
		<script>
	
/* 	//체크박스 전체선택/해제
	function checkAll(){
	      if( $("#th_checkAll").is(':checked') ){
	        $("input[name=checkRow]").prop("checked", true);
	      }else{
	        $("input[name=checkRow]").prop("checked", false);
	      }
	} */
	



 			//카테고리 선택시 검색창 -> 카테고리 선택창 
			function change(a) {
				console.log(a.value)

				var searchselect = document.querySelector('.common_search_type');
				var commonsearch = document.querySelector('.common_search');
				if (a.value != "category") {
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
	<%@ include file="../include/admin_menubar.jsp"%>



	<section>
		<div class="admin_faq_qna">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="faq_qna">
						
						
						
						

		<!-- FAQ============================================================================================================================== -->
		
		
		
		
							<div class="faq_qna_title">
								<h2>
									CUSTOMER SERVICE<small style="margin-left: 20px;">FAQ / QNA</small>
								</h2>
							</div>

							<div class="faq_title">
								<br> <br>
								<h3>FAQ</h3>
							</div>
							<div class="faq_table">
								<table class="table table-bordered " id="admin_faq_table">
									<thead>
										<tr>
											<th><input type="checkbox" id="check-all" class="flat"></th>
											<th>번 호</th>
											<th>질 문</th>
											<th>내 용</th>
										</tr>
									</thead>

									<tbody>
									<c:forEach var="faq" items="${faqlist }">
										<tr>
											<th><input type="checkbox" class="flat"></th>
											<td>${faq.fno }</td>
											<td><a href="adminQNAdetail?fno=${faq.fno }">${faq.ask }</a></td>
											<td>${faq.fcontent }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="qna_footer">
								<button type="button" class="btn btn_edit">선택 삭제</button>
								<button type="button" class="btn btn_edit" onclick="location.href='adminFAQregist'">새로 작성</button>
							</div>
							
							
							
							
							
							
							
							
		<!-- QNA============================================================================================================================== -->
		
		
		
		

		
							<div class="qna_title">
								<br> <br>
								<h3>QNA</h3>
							</div>
							<form action="list">
									<div class="faq_qna_footer" id="noanswer">
									
										<form action="list">
											<button type="submit" class="btn btn_noanswer"  name="searchType"
												value="noanswer"${pageVO.cri.searchType eq 'noanswer' ? 'selected' : '' }>미응답보기</button>
													<input type="hidden" class="form-control" name="searchName"
															placeholder="Search..." value="${pageVO.cri.searchName}">
													
											<input type="hidden" name="pageNum" value="1">
		                       				<input type="hidden" name="amount" value="${pageVO.cri.amount }">
										</form>
									</div>		
										
									<input type="hidden" name="pageNum" value="1">
	                       			<input type="hidden" name="amount" value="${pageVO.cri.amount }">
							</form>					
							<form action="list">
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
											<option value="신청">모집신청</option>
				                            <option value="결제">결제/환불</option>
				                            <option value="기타">기타문의</option>
				                        </select>
									</div>
									
									
									<div class="common_search_type">
										<select class="form-control" name="searchType" id="selectType" onChange="change(this)">
											<option value="title" ${pageVO.cri.searchType eq 'title' ? 'selected' : '' }>제목</option>
				                            <option value="content"${pageVO.cri.searchType eq 'content' ? 'selected' : '' }>내용</option>
				                            <option value="writer"${pageVO.cri.searchType eq 'writer' ? 'selected' : '' }>작성자</option>
				                            <option value="category"${pageVO.cri.searchType eq 'category' ? 'selected' : '' }>카테고리</option>		
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
								<form>
									<table class="table table-bordered " id="admin_common_table">
										<thead >
											<tr >
												<th><input type="checkbox"  onclick="checkAll(this,'1');"  id="th_checkAll" class="flat" name="check-all"></th>
												<th style="width: 50px;">카테고리</th>
												<th style="width: 300px;">제목</th>
												<th style="width: 100px">작성자</th>
												<th style="width: 100px;">작성일시</th>
												<th style="width: 50px;">조회</th>
											</tr>
										</thead>
																			
										<tbody>
											<c:forEach var="qna" items="${qnalist }" varStatus="status">
												<tr>
	           										<th style="width: 0px;"><input type="checkbox" id="check-all" class="flat" name="checkRow" value=${qna.qno }></th>
													<td>${qna.category }</td>
													<td><a href="adminFAQdetail?qno=${qna.qno }">${qna.qtitle }</a></td>
													<td>${qna.id }</td>
													<td><fmt:formatDate value="${qna.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
													<td>
													<c:choose>
															<c:when test="${qna.answer == null}">
																미응답
															</c:when>
															<c:otherwise>
																
															</c:otherwise>										
														
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
							
							<div class="faq_qna_footer">
								<button type="button" class="btn btn_del" onclick="location.href='qnamultiDel?qno=${qna.qno}'">선택 삭제</button>
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