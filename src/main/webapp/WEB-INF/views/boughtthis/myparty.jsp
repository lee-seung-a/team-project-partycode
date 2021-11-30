<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

*{}
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
                <div class=" board-table">
                    <div class="titlebox">
                        <p>${users.id } 님이 참여 중인 파티 목록 <button type="submit" class="btn btn-primary">가장최근파티참가취소하기</button></p>
                    </div>
                    <hr>
                    
                 
                    
                    
                    
                    
                    <!--select태그에 name을 작성, option이 value를 작성 -->
              
                   
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>파티번호</th>
                                <th>파티코드</th>
                                <th >주최자</th>
                                <th>파티제목</th>
                                <th>파티일자</th>
                                <th>파티참가액</th>
                                <th>충전금액</th>
                                <th>삭제</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${users.list2 }">
                            <tr>
                           <td> <input type="checkbox" name="this_no" value="${list.this_no}"/></td>
                            <td><a href="/partycode/partyboard/party_detail?pno=${list.your_pno }">${list.your_pno}</a> </td>
                            <td>${list.your_pcode }</td>
                            <td>${list.your_id }</td>
                            <td>${list.your_title }</td>
                            <td>${list.this_regdate }</td>
                            <td>${list.partyattend }</td>
                            <td>${list.chargedpoint }</td>
                            </tr>
                        </c:forEach>
                        </tbody>
               
                       
                    </table>
         <input type="hidden" name="pattend" value="${users.list2[0].partyattend }"/>
                        <input type="hidden" name="id" value="${users.id }"/>
                        <input type="hidden" name="pno" value="${users.list2[0].your_pno }"/>
                        <input type="hidden" name="my_no" value="${users.list2[0].my_no}"  />
                        <input type="hidden" name="remainpoint" value="${users.point }"/>
                        <input type="hidden" name="your_pno" value="${users.list2[0].your_pno }"/>
                        <input type="hidden" name="my_id" value="${users.id }"/>
                        <input type="hidden" name="partyattend" value="${users.list2[0].partyattend }"/>
                        <input type="hidden" name="your_title" value="${users.list2[0].your_title }" />
                        <input type="hidden" name="your_id" value="${users.list2[0].your_id }" />
                    
                        </form>
 
                    <!--페이지 네이션을 가져옴-->
		   
                    
                      <script>    
                      
                      (function(){
                		  var msg = "${msg}";
                		  
                		  if(msg !==''){
                			  alert(msg);
                		  }
                	})();
                	          
               
              
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
		   

                </div>
            </div>
        </div>
	</section>

<%@ include file="../include/footer.jsp" %>

</body>
</html>