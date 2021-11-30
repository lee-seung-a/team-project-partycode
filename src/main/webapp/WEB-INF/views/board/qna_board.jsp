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
        <title>FAQ-QnA</title>
        

<link
		href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
		rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>

</head>
        <style>
          
            * {text-decoration: none; list-style: none; padding: 0; margin: 0;}

            .faq {text-align: center; margin: 0 auto; width: 600px; margin-top:400px;}
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
            .qna_form_type select {opacity: 1; border:1px solid; width:auto;}
            .qna_form .form-title, .qna_form .form-content {margin: 10px 0; float: left;}
            .qna_form_box h3{text-align:center;margin:15px 0;padding:10px 0;border-top: 1px dotted #f5f5f5;}
            .form-title input { width: 590px; margin-bottom: 10px;padding: 10px;border: 1px solid #777;border-radius: 5px;}
            .form-content textarea{ width: 590px; line-height:20px; margin-bottom: 10px;padding: 10px;border: 1px solid #777;border-radius: 5px;box-shadow: 0 1px 1px #CCC inset, 0 1px 0 #FFF;}
            .qna_form_area {display: block; margin: 0 auto; width: 600px;}
            .users_footer {float: right; margin: 40px 0;}
            .form-writer {border:none; margin:10px;}
            
            .qna_table {width:800px; margin:30px auto;}
            .table-bordered>thead>tr>th {text-align: center;}
            .table-bordered>tbody>tr>td {text-align: center;}
            
            .pagination .active:after {content:none;}

        </style>
            
            
            
            <body>
            
            <%@ include file="../include/header.jsp" %>
            
            
            
                <div class="faq">
                    <div class="top">
                        <div class="title">
                            <p><img src="${pageContext.request.contextPath }/resources/img/qna_faq.png"><strong>FAQ&nbsp;&nbsp;&nbsp;</strong></p>
                            <h5>자주묻는 질문</h5>
                        </div>
                    </div>
                    
                    <c:forEach var="faq" items="${faqlist }" >                    
	                    <button class="accordion">
	                        <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;Q.</strong>&nbsp;&nbsp;&nbsp;&nbsp;${faq.ask }</p>
	                    </button>
	                    <div class="panel">
	                        <p><br><strong>&nbsp;&nbsp;A.</strong><b>&nbsp;&nbsp;&nbsp;&nbsp;${faq.fcontent }</b><br/><br/></p>
	                    </div>
	                </c:forEach>
                </div>
                
               
                    <div class="qna">
                        <div class="title">
                            <p><strong>Q&A</strong></p>
                            <h5>문의사항을 제출하시면 답변해드리겠습니다.</h5>
                        </div>
            
                        <div class="qna_area">
            
                            <div class="qna_form_area">
                                <form class="qna_form" action="qnaregistForm" method="post">
                                    <div class="qna_form_type">
                                        <select class="type" name="category" style="color:black;">
                                            <option selected="selected">- - 카테고리를 선택하세요 - -</option>
                                            <option value="모집신청">모집신청</option>
                                            <option value="결제/환불">결제/환불</option>
                                            <option value="기타문의">기타문의</option>
                                        </select>
                                    </div>
                                    
                                    <div>
                                    	<span>작성자 <input class="form-writer" name="id" value="${users.id }" readonly required></span>
                                    </div>
            
                                    <div class="form-title">
                                        <span>제목</span>
                                        <input class="form-title" id="form-title" name="qtitle" size="30" type="text" required/>
                                    </div>
                                    <div class="form-content">
                                        <span>문의내용</span>
                                        <textarea class="form-content" cols="10" id="form-content" name="qcontent"
                                            rows="5"></textarea>
                                    </div>
            
                                    <div class="users_footer">
                                        
                                        <button type="submit" class="btn btn_submit">작성하기</button>
                                    </div>
                                </form>            
                            </div>  
                        </div>
                    </div>            
                    </div>
          
                
				
<%-- 			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="amount" value="${pageVO.cri.amount }">

			<div class="common_length">
				<select class="form-control " onChange="handleChange(this)">
					<option value="10" ${pageVO.amount eq 10 ? 'selected' : '' }>10개씩 보기</option>
					<option value="20" ${pageVO.amount eq 20 ? 'selected' : '' }>20개씩 보기</option>
					<option value="30" ${pageVO.amount eq 30 ? 'selected' : '' }>30개씩 보기</option>
				</select>
			</div> --%>
				<div class="qna_table">
						
                <table class="table table-bordered " id="qna_table">
                  <thead>
                    <!-- 전체선택기능 넣어야 함 -->
                    <tr>
                      <th>번호</th>
                      <th>카테고리</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>확인</th>
                    </tr>
                  </thead>

                  <tbody>
                  <c:forEach var="qna" items="${qnalist }" >
                   <tr>
                      <td>${qna.qno }</td>
                      <td>${qna.category }</td>
                      <td><a href="qna_detail?qno=${qna.qno}" target="_blank">${qna.qtitle }</td>
                      <td>${qna.id }</td>
                      <td><fmt:formatDate value="${qna.regdate }" pattern="yy/MM/dd"/></td>
                      <td>
	                      <c:choose>
							<c:when test="${qna.answer == null}">
								
							</c:when>
							<c:otherwise>
								답변완료					
							</c:otherwise>			
							</c:choose>
                      </td>
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
                       	<li class="${num eq pageVO.pageNum ? 'active' : '' } ">
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
                
            </body>
            
	<script>
         var acc = document.getElementsByClassName("accordion");
         var i;

         for (i = 0; i < acc.length; i++) {
             acc[i].addEventListener("click", function () {
                 this.classList.toggle("active");
                 var panel = this.nextElementSibling;
                 if (panel.style.maxHeight) {
                     panel.style.maxHeight = null;
                 } else {
                     panel.style.maxHeight = panel.scrollHeight + "px";
                 }
             });
         }
         
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
</html>