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
	<title>NOTICE</title>

	<link
		href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
		rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>

</head>
        <style>
          
            * {text-decoration: none; list-style: none; padding: 0; margin: 0;}

            .faq {text-align: center; margin: 0 auto; width: 600px;}
            .title {text-align: center; margin: 60px 0;}
            .title > p {font-size: 50px; font-weight: bolder;}
            .title > p img {margin: 0 20px; opacity: 0.8;}
            .title h5 {color: cornflowerblue;}

            .accordion {
                background-color: #ffffff;
                cursor: pointer;
                width: 600px;
                outline: none;
                border: none;
                text-align: left;
                font-size: 16px;
                transition: 0.4s;  
                margin-bottom: 20px;              
            }
            
            .accordion > p {margin-top: 22.4px; margin-bottom:0; line-height:42.4px;}
            
            .active, .accordion:hover {background-color: #f5f5f5; font-weight: bold; }            
            .accordion:after {content: '\002B'; font-weight: bold; float: right;}            
            .active:after {content: "\2212";}
            
            .panel {
                width: 602px;
                text-align: left;
                padding: 0 0;
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.2s ease-out;
                box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
                border: none;
                
            }

            .panel p {  margin-bottom:20px; padding:0 15px; width: 600px; color: #FFF; background-color:cornflowerblue; border-radius: 4px;}
            .panel:after { margin: 50px; color: #FFF; box-radius:10px;}

            .qna {margin: 0 auto;}
            .qna_form {width: 600px; overflow: hidden; margin-top: 0;}
            .qna_form_type {height:40px;}
            .qna_form .form-title, .qna_form .form-content {margin: 10px 0; float: left;}
            .qna_form_box h3{text-align:center;margin:15px 0;padding:10px 0;border-top: 1px dotted #f5f5f5;}
            .form-title input { width: 590px; margin-bottom: 10px;padding: 10px;border: 1px solid #777;border-radius: 5px;}
            .form-content textarea{ width: 590px; margin-bottom: 10px;padding: 10px;border: 1px solid #777;border-radius: 5px;box-shadow: 0 1px 1px #CCC inset, 0 1px 0 #FFF;}
            .qna_form_area {display: block; margin: 0 auto; width: 600px;}
            .users_footer {float: right; margin: 40px 0;}
            
            .qna_table {width:800px; margin:30px auto;}
            .table-bordered>thead>tr>th {text-align: center;}

        </style>
            
            
            
<body>
	<%@ include file="../include/header.jsp" %>
           
		<div class="qna" style="margin-top:400px">
               <div class="title">
                   <p><strong>NOTICE</strong></p>
               </div>
   
		</div>            
         
		<div class="qna_table">
			<table class="table table-bordered " id="qna_table">
			<caption>총게시글: ${total }건 </caption>
				<thead>
					<tr >
						<th style="width: 50px;">번호</th>
						<th style="width: 400px;">제목</th>
						<th style="width: 100px">작성자</th>
						<th style="width: 100px;">등록일</th>
						<th style="width: 50px;">조회</th>
					</tr>
				</thead>
	
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.nno }</td>
							<td><a href="notice/detail?nno=${vo.nno }">[${vo.category }] ${vo.ntitle }</a></td>
							<td>${vo.nid }</td>
							<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" /></td>
							<td>${vo.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
               
               
<%@ include file="../include/footer.jsp" %>

	<script>
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