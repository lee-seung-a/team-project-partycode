<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>

<!--개인 디자인 추가-->
<style>
</style>
</head>

<body>
<%@ include file="../include/header.jsp" %>


<form class="detailform" method="post" action="partyup" enctype="multipart/form-data" style="margin-top:400px; border:1px solide black;">
 <div class="Background"> 
    <div class="container Container">
      <div class="Wrapper">
        <div class="TopTitle" style="font-size:22px">
          <div class="TopInner" style="text-align: left; margin-left:20%">
          <input type="hidden" name="pno" value="${vo.pno}" />
          <div>
          카테고리  <select class="little" style="color:black; width:400px; height:50px; font-size:20px;" type="text"
								name="ptheme" placeholder="카테고리" value="${vo.ptheme }" >
								<option  selected="selected">카테고리 </option>
								<option value="취미">취미</option>
								<option value="여행">여행</option>
								<option value="맛집">맛집</option>
								<option value="파티">파티</option>
								<option value="스터디">스터디</option>
								<option value="기타">기타</option>
								</select>
            </div>
            <div>
     파티제목       <input style="width:400px; margin:5px 0px; height:40px;" type="text" name="ptitle" value="${vo.ptitle }"   class="Title"/>
            </div>
            <div>
     주 &nbsp;최 &nbsp;자       <input style="width:400px; height:40px; margin:5px 0px;" type="text" name="pid" class="name" value="${vo.pid }" readonly/>
            </div>
          </div>
        </div>
        <div class="ImgAside">
        <div class="ImgOut">
          <figure class="ImgFigure">
             <div class="ImgInner2" >
             <input type="file" name="file"
								id="file">		
								<img id="fileImg" src="display/${vo.fileloca }/${vo.filename }"/>						
             </div>
          </figure>
        </div>
        <aside class="Aside">
          <div class="StatusWrapper">
            <div class="StatusInner">
              <div class="StatusTitle">모인금액</div>
              <div class="Statu" name="charity"><b>${vo.psum }</b><span>원</span>/<b class="Statu" name="goal">${vo.pgoal }</b> <span>원</span><span class="percent">${percent }%</span></div>
            </div>
            <div class="StatusInner">
              <div class="StatusTitle">변경할 파티날짜</div>
              <div class="Status" name="remainday"><input type="date" name="pdate" value="${vo.pdate }" /></div>
            </div>
            <div class="StatusInner">
           
            </div>
         <%--    <div class="funding">
                <div>펀딩진행중</div>
                <div>목표금액인 ${vo.pgoal}원이 모여야 결제됩니다.</div>
                <div>결제는 ${vo.pdate}에 결제됩니다.</div>
            </div> --%>
            <div class="Buttons">
              <div class="InnerButtons">
               <div>
                 <div>
    <%--              <c:choose >
                 <c:when test="${remain<=0 }">
                   <button type="button" class="btn btn-danger">종료된 파티입니다.</button>
                   </c:when>
                    <c:when test="${remain!=0 && users.point >= vo.pattend }">
                   <button type="submit" class="btn btn-primary">파티 참가하기</button>
                   </c:when> 
                   <c:when test="${remian!=0 && users.point < vo.pattend}">
                   <button type="button" class="btn" oclick="point">포인트부족 -충전하러가기</button>
                   </c:when>
                   </c:choose> --%>
                  </div>
                   <button type="submit" class="btn">수정</button>
                           <button type="button" class="btn" oclick="point">삭제</button>
               </div>

            </div>

      

            <div class="InnerButtons">
               <div class="ButtonsWrap">
                 
                   <div class="heart" id="heartlike" onclick="bg_chage()"><span></span></div>
                 
               </div>

            </div>
           
          </div>
 <!-- <div><svg id="logosm" viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M27.3343 2.24555C15.2931 0.443311 4.05474 8.75365 2.24857 20.8687C0.442397 32.9838 8.67052 44.1978 20.7117 46V30.4807H15.1928V24.0727H20.7117V19.1666V17.6647C21.0127 13.3594 24.7254 10.1554 29.0401 10.4558C30.6456 10.4558 32.3514 10.656 33.9579 10.8563V16.3631H31.047H30.3446C28.5384 16.5634 27.3343 18.0652 27.4356 19.8675V23.9726H33.5556L32.5521 30.3816H27.535V46C32.6525 45.199 37.3686 42.4956 40.6799 38.5908C44.0916 34.5858 45.9991 29.3803 45.9991 24.0727C46.0984 13.1591 38.071 3.84755 27.3343 2.24555Z"></path></svg>
              트위터
               <svg id="logosm" viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M46 10.288C44.304 10.986 42.607 11.485 40.812 11.784C42.707 10.587 44.104 8.792 44.803 6.698C43.007 7.795 41.111 8.493 39.115 8.892C37.419 7.097 35.024 6 32.53 6C27.542 6.1 23.451 10.188 23.551 15.175C23.551 15.873 23.65 16.571 23.75 17.269C16.467 16.87 9.682 13.38 5.192 7.596C2.798 11.784 3.995 17.169 7.986 19.962C6.589 19.962 5.192 19.563 3.896 18.765V18.865C3.796 23.253 6.889 27.042 11.079 27.939C10.281 28.14 9.483 28.239 8.685 28.239C8.086 28.239 7.587 28.14 6.988 28.04C8.086 31.729 11.478 34.322 15.37 34.422C12.177 37.015 8.186 38.411 4.195 38.411C3.497 38.411 2.798 38.411 2 38.311C6.09 41.103 10.879 42.5 15.769 42.5C30.036 42.4 41.41 30.832 41.41 16.571V16.172V14.975C43.306 13.779 44.803 12.183 46 10.288Z"></path></svg>
              인스타그램
               <svg id="logosm" viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M36.0761 9.1C36.0761 10.5 37.1785 11.6 38.5816 11.6C39.8846 11.6 41.0872 10.5 41.0872 9.1C41.0872 7.7 39.9848 6.6 38.5816 6.6C37.1785 6.6 36.0761 7.7 36.0761 9.1ZM10.9199 24C10.9199 31.1 16.8331 37 24.0492 37C31.2653 37 37.0783 31.2 37.0783 24C37.0783 16.8 31.1651 10.9 23.949 10.9C16.8331 10.9 10.9199 16.8 10.9199 24ZM11.3208 2H36.7776C41.9893 2 46.0984 6.2 45.9982 11.3V36.7C45.9982 41.8 41.889 46 36.6774 46H11.3208C6.2094 46 2 41.8 2 36.6V11.3C2 6.2 6.2094 2 11.3208 2ZM15.1293 24C15.1293 19.1 19.1383 15.1 24.0492 15.1C29.0604 15.1 32.9691 19.1 32.9691 24C32.9691 28.9 28.9602 32.9 24.0492 32.9C19.1383 32.9 15.1293 28.9 15.1293 24Z"></path></svg>
              카카오톡
               <svg id="logosm" viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M24 4C11.8 4 2 11.6865 2 21.0924C2.4 27.5653 6.4 33.1279 12.2 35.5552L10.1 43.2417C10 43.444 10.1 43.7474 10.3 43.8475C10.5 44.0508 10.9 44.0508 11.1 43.8475L20 37.8814C21.3 38.0837 22.6 38.1848 24 38.1848C36.1 38.1848 46 30.4983 46 21.0924C46 11.6865 36.2 4 24 4Z"></path></svg></div> -->
         

         
          
        </aside>
      </div>
      </div>
    </div>
  </div>
 
	<!-- <ul id="con" class=" container con3 nav nav-tabs tabs-style">
				<li class="active"><a data-toggle="tab" href="#info"><img src="resources/img/user.png"></a></li>
				<li><a data-toggle="tab" href="#Review"><img src="resources/img/heart.png"></a></li>
				
			</ul> -->
			
			
  <div class="tab-content">
    <div id="info" class="tab-pane fade in active  container Container2">
      <div class="Wrap2">
        <div class="contents">
       <textarea name="pcontent" rows="20" cols="90">
       
       </textarea>
        
             
            
        </div>
      

        <div class="contents2">
           <div class="minibox">
              <div class="won1000"><img src="" alt=""></div>
              <div class="support">  </div>
              
               
           </div>
           <div class="minibox">
             
             <div class="partycost">
             <h1 ><span>참여:</span><input style="width:250px;" type="text" name="pattend" value="${vo.pattend }" />원</h1>
            </div>
           </div>
           <div class="minibox">
              <ul class="list-group">
            				<div class="form-group">
											<label for="addr-num">주소</label>
											<div class="input-group">
												<input type="text" class="form-control" id="partyaddrzipnum"
													name="plocation1"  value="${vo.plocation1}">
												<div class="input-group-addon">
													<button type="button" style="margin-bottom:5px;" class="btn btn-primary"
														onClick="goPopup()">주소찾기</button>
												</div>
											</div>
										</div>

										<div class="form-group">
											<input type="text" class="form-control" id="partyaddrbasic"
												name="plocation2"  value="${vo.plocation2} }">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="partyaddrdetail"
												name="plocation3"  value="${vo.plocation3}">
										</div>
              </ul>
           </div>
           <div class="minibox">
            <ul class="list-group">
              <li id="lii" class="list-group-item">partycode and hashtag</li>
              <li id="lii" class="list-group-item"><input type="text" name="partycode" value="${vo.partycode }" /> </li>
              <li id="lii" class="list-group-item"><input type="text" name="pment" value="${vo.pment}" /></li>
             
            </ul>
           </div>  
           
        </div>
          
        </div>
      </div>
                    <%--   <input type="hidden" name="your_pno" value="${vo.pno}">
                    <input type="hidden" name="your_id" value="${vo.pid } }">
                    <input type="hidden" name="your_title" value="${vo.ptitle }">
                    <input type="hidden" name="your_pcode" value="${vo.partycode }"> 
                    <input type="hidden" name="my_id" value="${users.id }"> --%>
                    
               
</form>
    
    
    
    

  

 
  


          
          <%@ include file="../include/footer.jsp" %>
          
      

<script>
  function bg_chage(){
    document.getElementById('heartlike').style.backgroundImage="url(img/heart.png)"
  }
  
  
  function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		
		var pop = window.open("${pageContext.request.contextPath }/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	    function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	      console.log(roadAddrPart1,addrDetail,zipNo);
	      document.partyForm.partyaddrzipnum.value = zipNo;
	      document.partyForm.partyaddrbasic.value = roadAddrPart1;
	      document.partyForm.partyaddrdetail.value = addrDetail;
	      
	    }
	    
	    function readURL(input) {
	    	if (input.files && input.files[0]) {
	    		
	        	var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
	        	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
	        	reader.readAsDataURL(input.files[0]); 
	        	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
	            $(".fileDiv").css("display", "block");
	        	
	        	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
	            	$('#fileImg').attr("src", event.target.result); 
	            	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
	        	}
	    	}
	    }
	    $("#file").change(function() {
	        readURL(this); //this는 #file자신 태그를 의미
	        
	    });    
</script>






</body>


</body>
</html>