<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
 <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
 
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
  
  <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js" type="text/javascript"></script>
  


  <link href="${pageContext.request.contextPath }/resources/css/profile.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>

    <div class="bg">
      <div class="container con1">
        <div class="wrapper1">
          <div class="prophoto1">
            <img id="userphoto" class="" src="disflay/${othersInfo.fileloca }/${othersInfo.filename}">
            <div class="follow" style="position:absolute; left:900px; top:200px; width:100px; height:60px;"><button style="background-color:white; border:1px solid gray;" class="btn followBtn" id="follow-btn">팔로우</button></div>
            
           <%-- <span id="like"></span> <img id="heart" src="${pageContext.request.contextPath }resources/img/heart.png"> --%>
            
          </div>
        
          
        </div>
 
      </div>

     <div id="con" class="container con3">
         <ul>
           <li><img class="updateprofile" src="${pageContext.request.contextPath }/resources/img/user.png" alt="" ></li>
          <li> <button type="button" class="btn" id="follower-btn" data-target="#follower" data-toggle="modal">팔로워</button></li>
        <li> <button type="button" class="btn" id="following-btn" data-target="#following" data-toggle="modal">팔로잉</button></li>
         
         </ul>
     </div>

      <div class="container con1">
        <div class="wrapper">
         
      <div class="prophotoright">
        <div class="rightplace">
          <div class="texttop">NAME</div>
              <div class="textbot">${othersInfo.id}</div>
        </div>
        <div class="rightplace">
          <div class="texttop">Introduce</div>
          <div class="textbot">${othersInfo.introduce}</div>
        </div>
        <div class="rightplace">
          <div class="texttop2">  <a href="https://www.facebook.com/"><svg id="logosm" viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M27.3343 2.24555C15.2931 0.443311 4.05474 8.75365 2.24857 20.8687C0.442397 32.9838 8.67052 44.1978 20.7117 46V30.4807H15.1928V24.0727H20.7117V19.1666V17.6647C21.0127 13.3594 24.7254 10.1554 29.0401 10.4558C30.6456 10.4558 32.3514 10.656 33.9579 10.8563V16.3631H31.047H30.3446C28.5384 16.5634 27.3343 18.0652 27.4356 19.8675V23.9726H33.5556L32.5521 30.3816H27.535V46C32.6525 45.199 37.3686 42.4956 40.6799 38.5908C44.0916 34.5858 45.9991 29.3803 45.9991 24.0727C46.0984 13.1591 38.071 3.84755 27.3343 2.24555Z"></path></svg></a>
            <!--트위터-->
             <a href="https://twitter.com/"><svg id="logosm" viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M46 10.288C44.304 10.986 42.607 11.485 40.812 11.784C42.707 10.587 44.104 8.792 44.803 6.698C43.007 7.795 41.111 8.493 39.115 8.892C37.419 7.097 35.024 6 32.53 6C27.542 6.1 23.451 10.188 23.551 15.175C23.551 15.873 23.65 16.571 23.75 17.269C16.467 16.87 9.682 13.38 5.192 7.596C2.798 11.784 3.995 17.169 7.986 19.962C6.589 19.962 5.192 19.563 3.896 18.765V18.865C3.796 23.253 6.889 27.042 11.079 27.939C10.281 28.14 9.483 28.239 8.685 28.239C8.086 28.239 7.587 28.14 6.988 28.04C8.086 31.729 11.478 34.322 15.37 34.422C12.177 37.015 8.186 38.411 4.195 38.411C3.497 38.411 2.798 38.411 2 38.311C6.09 41.103 10.879 42.5 15.769 42.5C30.036 42.4 41.41 30.832 41.41 16.571V16.172V14.975C43.306 13.779 44.803 12.183 46 10.288Z"></path></svg></a>
            <!--인스타그램-->
             <a href="http://www.instagram.com/"><svg id="logosm" viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M36.0761 9.1C36.0761 10.5 37.1785 11.6 38.5816 11.6C39.8846 11.6 41.0872 10.5 41.0872 9.1C41.0872 7.7 39.9848 6.6 38.5816 6.6C37.1785 6.6 36.0761 7.7 36.0761 9.1ZM10.9199 24C10.9199 31.1 16.8331 37 24.0492 37C31.2653 37 37.0783 31.2 37.0783 24C37.0783 16.8 31.1651 10.9 23.949 10.9C16.8331 10.9 10.9199 16.8 10.9199 24ZM11.3208 2H36.7776C41.9893 2 46.0984 6.2 45.9982 11.3V36.7C45.9982 41.8 41.889 46 36.6774 46H11.3208C6.2094 46 2 41.8 2 36.6V11.3C2 6.2 6.2094 2 11.3208 2ZM15.1293 24C15.1293 19.1 19.1383 15.1 24.0492 15.1C29.0604 15.1 32.9691 19.1 32.9691 24C32.9691 28.9 28.9602 32.9 24.0492 32.9C19.1383 32.9 15.1293 28.9 15.1293 24Z"></path></svg></a>
            <!--카카오톡-->
             <svg id="logosm" viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M24 4C11.8 4 2 11.6865 2 21.0924C2.4 27.5653 6.4 33.1279 12.2 35.5552L10.1 43.2417C10 43.444 10.1 43.7474 10.3 43.8475C10.5 44.0508 10.9 44.0508 11.1 43.8475L20 37.8814C21.3 38.0837 22.6 38.1848 24 38.1848C36.1 38.1848 46 30.4983 46 21.0924C46 11.6865 36.2 4 24 4Z"></path></svg></div>
          
        </div>
  </div>
        </div>
          
          
        </div>
 
      </div>
      <div class="container con2">
        <table class="table table-bordered " id="tb">
          <thead>
            <tr>
              <!-- 전체선택기능 넣어야 함 -->
              <th><input type="checkbox" id="check-all" class="flat"></th>
              <th>지역</th>
              <th>제목</th>
              <th>신청일시</th>
              <th>개최예정일</th>
              <th>신청자</th>
              <th>연락처</th>
       
            </tr>
          </thead>

          <tbody>
      <c:forEach var="vo" items="${othersInfo.list }">
            <tr>
                 <td>${vo.pno }</td>
                 <td><a href="../partyboard/party_detail?pno=${vo.pno }">${vo.ptitle }</a></td>
                 <td>${vo.pdate }</td>
                 <td>${vo.pdate }</td>
                 
                 
             </tr>
      </c:forEach>
          </tbody>
        </table>

        </div>
 
         
          </div>
          
  
   
   
   
<div id="following" class="modal fade"   role="dialog">
<div class="modal-dialog">
          
 <div class="modal-content">    
 <div class="modal-header" style="text-align:center; padding:40px 50px;">
  <h2>팔로잉 리스트</h2>
  </div>
  <div class="modal-body" style="padding:40px 50px;">
      
           <c:if test="${followingList.size()<=0 }">
   <p>회원님을 팔로잉한 회원이 없습니다.</p>
 </c:if>
 
 <c:if test="${followingList.size() >0 }">
   <c:forEach var="vo" items="${followingList }">
     <li style="display:block;" class="follow-li">
     <div style="display:inline;  border-radius:70%; width:100px; height:100px;" class="profile-section">
        <c:choose>
           <c:when test="${(vo.fileloca != null) && (vo.filename != null) }">
            <a href="othersprofile?id=${vo.list3[0].passiveuserid}">    <img style="display:inline;  border-radius:70%; width:100px; height:100px;" class="profile-photo" src="disflay/${vo.fileloca }/${vo.filename}" />
          </a> </c:when>
           <c:otherwise>
          <a href="othersprofile?id=${vo.list3[0].passiveuserid}">     <img style="display:inline;  border-radius:70%; width:100px; height:100px;" class="profile-photo" src="${pageContext.request.contextPath }/resources/img/admin_person_search.png" />
         </a>  </c:otherwise>
        
          </c:choose>
           </div>
          
            <p style="display:inline; margin-left:100px; font-size:40px; " class="profile-id"> ${vo.list3[0].passiveuserid}</p>
          </c:forEach> 
 </c:if>

 </div>
 </div>
 </div>
 </div>
 
 
   
   
   
<div id="follower" class="modal fade"   role="dialog">
<div class="modal-dialog">

<div class="modal-content">    
 <div class="modal-header" style="text-align:center; padding:40px 50px;">
  <h2>팔로워 리스트</h2>
  </div>
  <div class="modal-body" style="padding:40px 50px;">
      
 <c:if test="${followerList.size()<=0 }">
   <p>회원님을 팔로우한 회원이 없습니다.</p>
 </c:if>
 

 <c:if test="${followerList.size() >0 }">
   <c:forEach var="vo" items="${followerList }">
     <li style="display:block" class="follow-li">
     <div style="display:inline;  border-radius:70%; width:100px; height:100px;" class="profile-section">
        <c:choose>
           <c:when test="${(vo.fileloca != null) && (vo.filename != null) }">
          
              <a href="othersprofile?id=${vo.list3[0].activeuserid}">  <img style="display:inline;  border-radius:70%; width:100px; height:100px;" class="profile-photo" src="disflay/${vo.fileloca }/${vo.filename}" />
          </a>  </c:when>
           <c:otherwise>
           
            <a href="othersprofile?id=${vo.list3[0].activeuserid}"><img style="display:inline;  border-radius:70%; width:100px; height:100px;" class="profile-photo" src="${pageContext.request.contextPath }/resources/img/admin_person_search.png" />
          </c:otherwise>
        
          </c:choose>
           </div>
          
            <p style="display:inline; margin-left:100px; font-size:40px; " class="profile-id">${vo.list3[0].activeuserid}</p>
            </li>
          </c:forEach> 
 </c:if>
      </div>
    </div>   
      </div>
      </div>
      
      
      <script>
     
      $(document).ready(function(){
    	  console.log("실행됨");
    	  if(${followCheck}==1 ){
    		  
    		  $(".follow").html('<button style="background-color:white; border:1px solid gray;" class="btn followBtn" id="unfollow-btn">언팔로우</button>');
    		  
    	  }
    	  
      });
      
      </script>
          

	<script>
	 $('#follow-btn').on('click',function(){
		 console.log("아야");
		 follow(true);
	 });
	 
	 $('.follow').on('click', "#unfollow-btn",function(){
		 console.log("언팔");
		 follow(false);
	 });
	
	 
	 function follow(check){
		 if(check){
			 console.log("${othersInfo.id}");
			 
			 $.ajax({
				type:"POST",
				url:"follow",
				data:JSON.stringify({"id": "${othersInfo.id}" }),
				contentType:"application/json; charset=UTF-8;",
				success:function(result){
					console.log("result :" +result);
					if(result === "FollowOK"){
						$(".follow").html('<button style="background-color:white; border:1px solid gray;" class="btn followBtn" id="unfollow-btn">언팔로우</button>');
					
						
					}
				}
			 });
		 }
		 else{
			 console.log("언팔할래?");
			 $.ajax({				
				type:"POST",
				url:"unfollow",
				data:JSON.stringify({"id": "${othersInfo.id}"}),
				contentType:"application/json; charset=UTF-8;",
				
				success:function(result){
					console.log("result :" +result);
					if(result === "UnFollowOK"){
						$(".follow").html('<button style="background-color:white; border:1px solid gray;" class="btn followBtn" id="follow-btn">팔로우</button>');
						
					}
				}
				 
				 
				 
				 
			 });
			 
			 
		 }
	 }
	
	</script>


</body>
</html>