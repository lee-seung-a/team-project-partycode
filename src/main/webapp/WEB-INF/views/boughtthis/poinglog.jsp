<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

*{color:black;}
.container-fluid{
text-align:center;

margin-top:500px;


}

</style>
<body>

<%@ include file="../include/header.jsp" %>


      <section>
      <form action="deleteibt" method="post">
        <div class="container container-fluid"  style="width:800px; ">
            <div class="row">
                <!--lg에서 9그리드, xs에서 전체그리드-->   
                <div class="col-lg-9 col-xs-12 board-table">
                    <div class="titlebox">
                        <p> 님이 참여 중인 파티 목록 <button type="submit" class="btn btn-primary">파티참가취소하기</button></p>
                    </div>
                    <hr>
                    
                 
                    
                    
                    
                    
                    <!--select태그에 name을 작성, option이 value를 작성 -->
                 <h1>${users.id }님의 충전 및 사용 로그</h1>
                   
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                             
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${users.list2 }">
                            <tr>
                           
                            <td>${list.chargedpoint} </td>
                           
                            <td>${list.partyattend }</td>
                                   
                           
                            </tr>
                            
                        </c:forEach>
                        </tbody>
               
                       
                    </table>
         <input type="hidden" name="pattend" value="${users.list2[0].partyattend }"/>
                        <input type="hidden" name="id" value="${users.id }"/>
                        <input type="hidden" name="pno" value="${users.list2[0].your_pno }"/>
                        <input type="hidden" name="my_no" value="${users.list2[0].my_no}"  />
                        </form>
 
                    <!--페이지 네이션을 가져옴-->
		    <form action="" name="pageForm">
                    <div class="text-center">
                    <hr>
                    <ul class="pagination pagination-sm" >
                    
                   
                   <c:if test="${pageVO.prev }">
                        <li><a href="freeList?pageNum=${pageVO.startPage - 1}&amount=${pageVO.amount }">이전</a></li>
                        </c:if>
                     <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }" >
                        <li  class="${num eq pageVO.pageNum ? 'active' : ''}">
                        <a href="freeList?pageNum=${num }&amount=${pageVO.amount}">${num }</a>
                        </li>
                      </c:forEach>
                      
                      <c:if test="${pageVO.next }">
                        <li><a href="reviewList?pageNum=${pageVO.endPage+1}&amount=${pageVO.amount}">다음</a></li>
                        </c:if> 
                       
                        
                            <c:if test="${pageVO.prev }">
                        <li><a href="#" data-pagenum="${pageVO.startPage-1 }">이전</a></li>
                        </c:if>
                     <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }" >
                        <li  class="${num eq pageVO.pageNum ? 'active' : ''}">
                        <a href="#" data-pagenum="${num }">${num }</a>
                        </li>
                      </c:forEach>
                      
                      <c:if test="${pageVO.next }">
                        <li><a href="#" data-pagenum="${pageVO.endPage+1 }">다음</a></li>
                        </c:if> 
                    </ul>
                    
                    <!-- freeList에 전달될 값을 hidden으로 처리 -->
                    <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
                    <input type="hidden" name="amount" value="${pageVO.cri.amount }">
                    <input type="hidden" name="searchType" value="${pageVO.cri.searchType }">
                    <input type="hidden" name="searchName" value="${pageVO.cri.searchName }"> 
                    
                    
                    </div>
                    
                      <script>            
               
              
   function handleChange(data){
	   
	   //el태그를 이용해서 href에 경로에 searchName과 searchType을 담아서 보내주면 됩니다.
	   //mapper에서는 searchName이 공백인 경우의 처리	
	   var search = '${pageVO.cri.searchName}'
	   var searchT = '${pageVO.cri.searchType}'
	   
	   var serN=search.trim()
	   var serT=searchT.trim()
	   location.href = "reviewList?searchName="+serN+"&"+"searchType="+serT+"&pageNum=1&amount=" + data.value;
   }
   
   //페이지네이션 a태그에 동일한 이벤트 거는방법(이벤트위임)
   
  var pagination = document.querySelector(".pagination")


  pagination.onclick = function(){
	   event.preventDefault(); // a의 고유이벤트 제거
	   //현재 클릭한 대상	   
	   if(event.target.tagName!='A') return; // a태그가 아니라면 종료
	   
	   
	  // console.dir(event.target);
	  
	  // console.log(event.target.tagName);
	  // console.log(event.target);
	  // console.log(event.target.dataset.pagenum); //태그의 data-이름의 값을 얻는 방법
	   //폼태그는 name속성.name속성으로 input을 선택할 수 있습니다.
	   console.log(document.pageForm.pageNum);
	   var pageNum= event.target.dataset.pagenum;
	   document.pageForm.pageNum.value=pageNum;
	   //폼 서브밋
	   document.pageForm.submit();
	   
	  
   }

</script> 
		    </form>

                </div>
            </div>
        </div>
	</section>

<%@ include file="../include/footer.jsp" %>

</body>
</html>