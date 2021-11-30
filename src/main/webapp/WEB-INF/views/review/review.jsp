<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


      <section>
        <div class="container-fluid">
            <div class="row">
                <!--lg에서 9그리드, xs에서 전체그리드-->   
                <div class="col-lg-9 col-xs-12 board-table">
                    <div class="titlebox">
                        <p>  파티 리뷰 보기</p>
                    </div>
                    <hr>
                    
                    
                    <div class="search-wrap" >
                        <select class="form-control search-select"  style="width:150px" onChange="handleChange(this)">
                                                     
                           <option value="10" ${pageVO.amount eq 10 ? 'selected' : ''}>10개 보기</option>
                            <option value="20" ${pageVO.amount eq 20 ? 'selected' : ''}>20개 보기</option>
                            <option value="50" ${pageVO.amount eq 50 ? 'selected' : ''}>50개 보기</option>
                            <option value="100" ${pageVO.amount eq 100 ? 'selected' : ''}>100개 보기</option>
                       </select>
                    </div>
                    
                    
                    
                    
                    <!--select태그에 name을 작성, option이 value를 작성 -->
                    <form action="freeList" method="get">
		    <div class="search-wrap">
                       <button type="submit" class="btn btn-danger search-btn">검색</button>
                       <input type="text" class="form-control search-input" name="searchName" value="${pageVO.cri.searchName }">
                       <select class="form-control search-select" name="searchType">
                            <option value="title" ${pageVO.cri.searchType eq 'title' ? 'selected' : '' }>제목</option>
                            <option value="content"${pageVO.cri.searchType eq 'content' ? 'selected' : '' }>내용</option>
                            <option value="writer"${pageVO.cri.searchType eq 'writer' ? 'selected' : '' }>작성자</option>
                            <option value="titcont"${pageVO.cri.searchType eq 'titcont' ? 'selected' : '' }>제목+내용</option>
                       </select>
                       
                       <input type="hidden" name="pageNum" value="1">
                       <input type="hidden" name="amount"  value="${pageVO.cri.amount }">
                    </div>
		    </form>
                   
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>작성자</th>
                                <th >내용</th>
                                
                                <th>등록일</th>
                                <th>삭제</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach var="vo"  items="${reviewlist }" varStatus="i" >
                            <tr>
                                <td>${vo.revwriter }</td>
                                <td><a href="freeDetail?bno=${vo.revno}">${vo.rating }</a></td>
                                <td class="reviewContent">${vo.revcontent }</td>
                                
                                <td><button type="button" class="btn btn-delete">삭제</button>
                                </td>
                                
                            </tr>
                            </c:forEach>
                        </tbody>
                      
                    </table>
   
 
                    <!--페이지 네이션을 가져옴-->
		 <   <form action="reviewList" name="pageForm">
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
                    
                    <button type="button" class="btn btn-danger" onclick="location.href='freeRegist'">글쓰기</button>
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

	
