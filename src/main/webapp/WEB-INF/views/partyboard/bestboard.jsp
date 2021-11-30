<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


  <!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/party_board.css" rel="stylesheet">

      
    
    
 <style>
 
 .partyisover{
   position:absolute;
   left:0px;
   top:0px;
 }
 .ilike{
   display:inline;
   background-image:url(${pageContext.request.contextPath }/resources/img/heart2.png);
       width:22px;
       height:22px;
    position:absolute;
   left:93%;
   top:9px;
   background-repeat: no-repeat;
   background-size:20px;
 }
 </style> 
    
	 
</head>
<body>
<%@ include file="../include/header.jsp" %>



 <div id="myCarousel" style="height:500px;" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
    
        <!-- Wrapper for slides -->
        <div id="carouselInner" class="carousel-inner" role="listbox">
          <div class="item active">
            <img id="innerimg" src="${pageContext.request.contextPath }/resources/img/unnamed.gif" alt="New York" width="100%" height="100%">
            <div class="carousel-caption">
              <h3>방탈출파티</h3>
              <p>강남역 2번출구에서 봐요.</p>
            </div>      
          </div>
    
          <div class="item">
            <img id="innerimg" src="${pageContext.request.contextPath }/resources/img/흑백.gif" alt="Chicago" width="600" height="800">
            <div class="carousel-caption">
              <h3></h3>
              <p></p>
            </div>      
          </div>
        
          <div class="item">
            <img id="innerimg" src="${pageContext.request.contextPath }/resources/img/흑백2.gif" alt="Los Angeles" width="600" height="800">
            <div class="carousel-caption">
              <h3>루프탑파티</h3>
              <p>풀장딸린 루프탑에서 파티하실분!</p>
            </div>      
          </div>
        </div>
    
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>

      
    </div>
    
    <div class="container text-center">
      <h3>파티 모집 게시판</h3>
      <p><em>지금 파티 참여시 500포인트적립!</em></p>
      <p>We are not alone!</p>
      <br>
      <div class="row">
   
      </div>
    </div>   
    

                    
                    
                    
                    
                    <!--select태그에 name을 작성, option이 value를 작성 -->
                    <form action="party_board" method="get">
		    <div class="search-wrap" style="text-align:center;">
		      <button type="button" class="btn btn" onclick="location.href='party_regist'">파티등록하기</button>
                        <select class="form search-select"  style="border:1px solid black; width:150px; color:black;" onChange="handleChange(this)">
                                                     
                           <option value="12" ${pageVO.amount eq 12 ? 'selected' : ''}>12개 보기</option>
                            <option value="20" ${pageVO.amount eq 20 ? 'selected' : ''}>20개 보기</option>
                            <option value="50" ${pageVO.amount eq 50 ? 'selected' : ''}>50개 보기</option>
                            <option value="100" ${pageVO.amount eq 100 ? 'selected' : ''}>100개 보기</option>
                       </select>
                    
		     <select style="color:black; border:1px solid black;" class="search-select" name="searchType">
                            <option value="ptitle" ${pageVO.cri.searchType eq 'title' ? 'selected' : '' }>제목</option>
                            <option value="pcontent" ${pageVO.cri.searchType eq 'content' ? 'selected' : '' }>내용</option>
                            <option value="pid" ${pageVO.cri.searchType eq 'writer' ? 'selected' : '' }>작성자</option>
                            <option value="titcont" ${pageVO.cri.searchType eq 'titcont' ? 'selected' : '' }>제목+내용</option>
                       </select>
                       
                     
                       <input type="text" style="width:250px; height:38px;" class="search-input" name="searchName" value="${pageVO.cri.searchName }">
                         <button type="submit" class="btn" style="width:100px;"><i class="fas fa-search"></i></button>
                      
                       <input type="hidden" name="pageNum" value="1">
                       <input type="hidden" name="amount"  value="${pageVO.cri.amount }">
                    </div>
		    </form>



    <div class="bg-1">
    
    


  
 
       
    <div id="container2" >
    <div class="row container" style="width:1800px; margin-left:-250px;">

    <c:forEach var="vo" items="${list}">
      
      
      <c:if test="${vo.padmin==0}">
        <div id="colla" class="col-sm-4">
          <div id="thumbnel" class="thumbnail">
       
            <img onclick="location.href='party_detail?pno=${vo.pno}'" src="display/${vo.fileloca }/${vo.filename }" class="img"  alt="${vo.pid }" data-image="안녕하세요" >
             <div class="ilike" id="ilike" onclick="img_change(this);"></div>
            <c:if test="${vo.remain <=0 }">
            <img class="partyisover" src="${pageContext.request.contextPath }/resources/img/partyover.png"/>
            
            </c:if>
            <p><strong style="color:black;">${vo.ptitle }</strong></p>
            <p><span style="font-size:15px;">like:${vo.plike }</span> <div class="like"><a href="/partycode/users/othersprofile?id=${vo.pid }"><img style="background-color:lightgray; border-radius:70%;" class="like" src="${pageContext.request.contextPath }/resources/img/admin_person.png" alt=""/></a></div></p>
            <p style="color:black; height:40px;">PLACE:${vo.plocation2 }</p>
            <h3 style="color:black; margin-bottom:20px; font-style:normal; font-weight:700;"><fmt:formatNumber value="${vo.pattend }" pattern="###,###,###"/> </h3>
           
          </div>
        </div>
        </c:if>
       </c:forEach>
      
      
        
      </div>
    
    </div>
    
</div>

<form action="party_board" name="pageForm">
  <div class="text-center">
  <hr>
  <ul class="pagination" style="background-color:black;">
  
<%--  
 <c:if test="${pageVO.prev }">
      <li><a href="freeList?pageNum=${pageVO.startPage - 1}&amount=${pageVO.amount }">이전</a></li>
      </c:if>
   <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }" >
      <li  class="${num eq pageVO.pageNum ? 'active' : ''}">
      <a href="freeList?pageNum=${num }&amount=${pageVO.amount}">${num }</a>
      </li>
    </c:forEach>
    
    <c:if test="${pageVO.next }">
      <li><a href="freeList?pageNum=${pageVO.endPage+1}&amount=${pageVO.amount}">다음</a></li>
      </c:if> 
      --%>
      
          <c:if test="${pageVO.prev }">
      <li><a style="background-color:pink;" href="#" data-pagenum="${pageVO.startPage-1 }">이전</a></li>
      </c:if>
   <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }" >
      <li  class="${num eq pageVO.pageNum ? 'active' : ''}">
      <a style="background: linear-gradient(to left , gray,black); border-color:white;"  href="#" data-pagenum="${num }"><span>${num }</span></a>
      </li>
    </c:forEach>
    
    <c:if test="${pageVO.next }">
      <li style="background-color:darkblue;"><a style="background-color:black; " href="#" data-pagenum="${pageVO.endPage+1 }">다음</a></li>
      </c:if> 
  </ul>
  
  <!-- freeList에 전달될 값을 hidden으로 처리 -->
  <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
  <input type="hidden" name="amount" value="${pageVO.cri.amount }">
  <input type="hidden" name="searchType" value="${pageVO.cri.searchType }">
  <input type="hidden" name="searchName" value="${pageVO.cri.searchName }"> 
  
 
  </div>
</form>


<br>




  </script>

 

<%@ include file="../include/footer.jsp" %>


      
               
   <script>            
   function img_change(a){
		  a.style.backgroundImage="url(${pageContext.request.contextPath }/resources/img/heart.png)";
	  }           
              
   function handleChange(data){
	   
	   //el태그를 이용해서 href에 경로에 searchName과 searchType을 담아서 보내주면 됩니다.
	   //mapper에서는 searchName이 공백인 경우의 처리	
	   var search = '${pageVO.cri.searchName}'
	   var searchT = '${pageVO.cri.searchType}'
	   
	   var serN=search.trim()
	   var serT=searchT.trim()
	   location.href = "party_board?searchName="+serN+"&"+"searchType="+serT+"&pageNum=1&amount=" + data.value;
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
              
         
              
           
</body>
</html>