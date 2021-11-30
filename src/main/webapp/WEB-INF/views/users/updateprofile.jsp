<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sns.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link
	href="${pageContext.request.contextPath }/resources/css/updateprofile.css"
	rel="stylesheet">


	<style type="text/css">
/* 	section {
		margin-top: 70px;
	}  */
	
	img{
        max-width:100%;
        height:auto;
       }
  .superwrap{
   overflow: scroll;
   }    
</style>
</head>
<body>

<%@ include file="../include/header.jsp"%>


	<div style="margin-top:700px;">
		<div class="bg">
			<div class="container con1">
				<div class="wrapper1">

					<div class="prophoto1">
						<div class="box">
							<div class="editor-menu">
							<form action="profile_update" name="profile_update" method="post" enctype="multipart/form-data">
      							
         					
      									<div class= "form-group">
      							<div class="fileDiv2">
							<img id="editor" src="disflay/${usersInfo.fileloca }/${usersInfo.filename}">
							</div>
							
         						<input type="file" name="file" id="img__preview" />
						      	
      							</div>
                             <input type="hidden" name="id" value="${usersInfo.id }">
        					<input type="hidden" name="uno" value="${usersInfo.uno }">
        					
        					<input type="hidden" name="pw" value="${usersInfo.pw }">
        					
        					<input type="hidden" name="point" value="${usersInfo.point }">
     
      					
						  
      							<div class= "form-group">
         						
         				
							<!-- 	<input type="file" name="file" id="file"> -->
      							</div>


						
              
             
								<input id="img-selector" type="file" accept="image/*" />
							</div>
						</div>
						<div class="boxright">
							<div class="boxinner">
								<div class="introduce">
									<div class="form-group commentname">
										<label for="comment">소개글:</label>
										<textarea class="form-control" 
										name="introduce" rows="5" id="comment" value="${usersInfo.introduce }"></textarea>
									</div>

								</div>
								<div class="point">

									<h2>My Point:${userInfo.point}</h2>
									<button type="button" class="btn btn-warning">충전하러가기</button>
								</div>
							</div>

						</div>
						<!-- <div class="form-group prothoname">
                <label for="usr">name:</label>
                <input type="text" class="form-control innertext" id="usr">
              </div> -->
						<!-- <div class="prothoname"><span>이름:</span><input type="text" class="innertext" /></div>
            <div class="form-group commentname">
              <label for="comment">소개글:</label>
              <textarea class="form-control" rows="5" id="comment"></textarea>
            </div> -->
						<!-- <div class="prothoname"><span>소개글:</span><textarea></textarea></div> -->

					</div>

				</div>

			</div>
<section></section>

			<ul id="con" class=" container con3 ">
				<li class="active"><a data-toggle="tab" href="#info"><img src="${pageContext.request.contextPath }/resources/img/user.png"></a></li>
				<li><a data-toggle="tab" href="#myBoard"><img src="${pageContext.request.contextPath }/resources/img/like3.png"></a></li>
				<li><a data-toggle="tab" href="#menu2"><img src="${pageContext.request.contextPath }/resources/img/white_board2.png"></a></li>
			</ul>



			<div class="tab-content">
				<div id=info class="tab-pane fade in active">
					<div class="container con5">
						<div class="wrapper">
							<div class="prophoto">
								<div class="rightplace">
									<!-- <div class="form-group prothoname texttop">
                <label for="usr">name:</label>
                <input type="text" class="form-control innertext" id="usr">
              </div> -->

									<div class="form-group prothoname texttop">name:</div>
									<div class="textbot">
										<input type="text" class="form-control innertext" id="usr" name="uname" value="${usersInfo.uname }">
									</div>
								</div>

								<div class="rightplace">
									<!-- <div class="texttop">phone number:</div>
              <div class="textbot"><input type="text" class="innertext" /></div> -->
									<div class="form-group prothoname texttop">phone number:</div>
									<div class="textbot">
										<input type="text" class="form-control innertext" id="usr" name="tellnum" value="${usersInfo.tellnum }">
									</div>
								</div>
								<div class="rightplace1">

									<div class="texttop">address:</div>
									<div class="form-group findaddr">
										<div class="input-group">
											<input type="text" class="form-control" id="addrZipNum"
												name="addrZipNum" value="${usersInfo.addrZipNum }" placeholder="우편번호" readonly>
											<div class="input-group-addon">
												<button type="button" class="btn btn-primary"
													onClick="goPopup()">주소찾기</button>
											</div>
										</div>
									</div>
									<div class="form-group ">
										<input type="text" class="form-control" id="addrBasic"
											name="addrBasic" value="${usersInfo.addrBasic }" placeholder="기본주소">
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="addrDetail"
											name="addrDetail" value="${usersInfo.addrDetail }" placeholder="상세주소">
									</div>
								</div>
								<!--              
              <div class="textbot"><input type="text" class="innertext" /></div>
              <div class="textbot"><input type="text" class="innertext" /></div>
              <div class="textbot"><input type="text" class="innertext" /></div> -->
							</div>

							<div class="prophotoright">
								<div class="rightplace">
									<div class="form-group prothoname texttop">password
										update:</div>
									<div class="textbot">
										<input type="text" class="form-control " name="pw" id="usr" value="${users.pw }">
									</div>
									<!-- <div class="form-group prothoname texttop">비밀번호 확인:</div>
          <div class="textbot_b"><input type="text" class="form-control innertext" id="usr"></div> -->
								</div>
								<div class="rightplace2">
									<div class="form-group email-form ">
										<div class="form-group prothoname texttop">email:</div>
										<input type="text" class="form-control" value="${usersInfo.email1 }" name="email1"
											id="userEmail1" placeholder="이메일"> <select
											class="form-control" name="email2" id="userEmail2">
											<option>@naver.com</option>
											<option>@daum.net</option>
											<option>@gmail.com</option>
											<option>@hanmail.com</option>
										</select>
									</div>
									<!-- <div class="form-group prothoname texttop">email:</div>
          <div class="textbot"><input type="text" class="form-control email1" id="usr">@<input type="text" class="form-control email2" id="usr" /></div> -->
								</div>
								<div class="rightplace2">
									<div class="texttop2">
										<a href="#"> <svg id="logosm" viewBox="0 0 48 48">
												<path fill-rule="evenodd" clip-rule="evenodd"
													d="M27.3343 2.24555C15.2931 0.443311 4.05474 8.75365 2.24857 20.8687C0.442397 32.9838 8.67052 44.1978 20.7117 46V30.4807H15.1928V24.0727H20.7117V19.1666V17.6647C21.0127 13.3594 24.7254 10.1554 29.0401 10.4558C30.6456 10.4558 32.3514 10.656 33.9579 10.8563V16.3631H31.047H30.3446C28.5384 16.5634 27.3343 18.0652 27.4356 19.8675V23.9726H33.5556L32.5521 30.3816H27.535V46C32.6525 45.199 37.3686 42.4956 40.6799 38.5908C44.0916 34.5858 45.9991 29.3803 45.9991 24.0727C46.0984 13.1591 38.071 3.84755 27.3343 2.24555Z"></path></svg></a>
										<!--트위터-->
										<a href="#"> <svg id="logosm" viewBox="0 0 48 48">
												<path fill-rule="evenodd" clip-rule="evenodd"
													d="M46 10.288C44.304 10.986 42.607 11.485 40.812 11.784C42.707 10.587 44.104 8.792 44.803 6.698C43.007 7.795 41.111 8.493 39.115 8.892C37.419 7.097 35.024 6 32.53 6C27.542 6.1 23.451 10.188 23.551 15.175C23.551 15.873 23.65 16.571 23.75 17.269C16.467 16.87 9.682 13.38 5.192 7.596C2.798 11.784 3.995 17.169 7.986 19.962C6.589 19.962 5.192 19.563 3.896 18.765V18.865C3.796 23.253 6.889 27.042 11.079 27.939C10.281 28.14 9.483 28.239 8.685 28.239C8.086 28.239 7.587 28.14 6.988 28.04C8.086 31.729 11.478 34.322 15.37 34.422C12.177 37.015 8.186 38.411 4.195 38.411C3.497 38.411 2.798 38.411 2 38.311C6.09 41.103 10.879 42.5 15.769 42.5C30.036 42.4 41.41 30.832 41.41 16.571V16.172V14.975C43.306 13.779 44.803 12.183 46 10.288Z"></path></svg></a>
										<!--인스타그램-->
										<a href="http://www.instargram.com"> <svg id="logosm" viewBox="0 0 48 48">
												<path fill-rule="evenodd" clip-rule="evenodd"
													d="M36.0761 9.1C36.0761 10.5 37.1785 11.6 38.5816 11.6C39.8846 11.6 41.0872 10.5 41.0872 9.1C41.0872 7.7 39.9848 6.6 38.5816 6.6C37.1785 6.6 36.0761 7.7 36.0761 9.1ZM10.9199 24C10.9199 31.1 16.8331 37 24.0492 37C31.2653 37 37.0783 31.2 37.0783 24C37.0783 16.8 31.1651 10.9 23.949 10.9C16.8331 10.9 10.9199 16.8 10.9199 24ZM11.3208 2H36.7776C41.9893 2 46.0984 6.2 45.9982 11.3V36.7C45.9982 41.8 41.889 46 36.6774 46H11.3208C6.2094 46 2 41.8 2 36.6V11.3C2 6.2 6.2094 2 11.3208 2ZM15.1293 24C15.1293 19.1 19.1383 15.1 24.0492 15.1C29.0604 15.1 32.9691 19.1 32.9691 24C32.9691 28.9 28.9602 32.9 24.0492 32.9C19.1383 32.9 15.1293 28.9 15.1293 24Z"></path></svg></a>
										<a href="#"> <!--카카오톡--> <svg id="logosm"
												viewBox="0 0 48 48">
												<path fill-rule="evenodd" clip-rule="evenodd"
													d="M24 4C11.8 4 2 11.6865 2 21.0924C2.4 27.5653 6.4 33.1279 12.2 35.5552L10.1 43.2417C10 43.444 10.1 43.7474 10.3 43.8475C10.5 44.0508 10.9 44.0508 11.1 43.8475L20 37.8814C21.3 38.0837 22.6 38.1848 24 38.1848C36.1 38.1848 46 30.4983 46 21.0924C46 11.6865 36.2 4 24 4Z"></path></svg>
										</a>
									</div>

								</div>
							</div>
						</div>
						<div class="rightplace">
							<img class="logo" src="${pageContext.request.contextPath }/resources/img/로고4.png">

						</div>
					</div>
					<div class="container con2">
						<button type="submit" class="btn btn-success">Update!</button>
                 
					</div>
                    </form> 
				</div>

				<div id="myBoard" class="tab-pane fade">
						<div class="container con5">
						<div class="wrapper">
					<h3>참여 중인 파티</h3>
			
						<table class="table">
							<thead>
								<tr>
									<td>파티번호</td>
									<td>파티제목</td>
									<td>주최자</td>
									<td>파티코드</td>
								</tr>
							</thead>
							<tbody>
					
								<tr>
									<td>1</td>
									<td><a href="##">첫글</a></td>
									<td>~~~~~</td>
								</tr>
							
							</tbody>
						</table>
					</div>
					</div>
					
				</div>
				
				<div id="menu2" class="tab-pane fade">
<section>
<div class="superwrap" >

		<div class="container" style="height:1500px; overflow:scroll;">
			<div class="row">
				<aside class="col-sm-2"> 
					<div class="aside-inner">
						<div class="menu1">
							<p>
								<img src="../resources/img/profile.png">${usersInfo.uname}
							</p>
							<ul>
								<li><a href="${pageContext.request.contextPath }/users/profile">내 정보</a></li><br>
							</ul>
						</div>
						<div class="menu2">
							<ul>
							<li><a href="${pageContext.request.contextPath }/partyboard/party_board">둘러보기</li><br>
								<li><a href="${pageContext.request.contextPath }/partyboard/party_board">공지사항</a></li>
							</ul>
						</div>
					</div>
				</aside>
				
				<div class="col-xs-12 col-sm-8 section-inner" >
					<h4>게시글 업데이트</h4>
					<!-- 파일 업로드 폼입니다 -->
					<div class="fileDiv">
						<img id="fileImg" src="${pageContext.request.contextPath }/resources/img/img_ready.png">
					</div>
					<div class="reply-content">
						<textarea class="form-control" rows="3" name="content"
							id="content" placeholder="게시글을 등록해주세요"></textarea>
						<div class="reply-group">
							<div class="filebox pull-left">
								<label for="file">이미지 업로드</label> 
								<input type="file" name="file" id="file">
							</div>
							
							<button type="button" class="right btn btn-info" id="uploadBtn">Update</button>
						</div>
					</div>

					<div id="content_wrap">
					</div>
					<!-- 파일 업로드 폼 끝 -->
					<!-- <div id="contentDiv"> -->
		<%-- 			<div class="title-inner">
						<!--제목영역-->
						<div class="profile">
							<img src="../resources/img/profile.png">
						</div>
						<div class="title">
							<!-- <p>테스트</p>
							<small>21시간</small> -->
						</div>
					</div>
					<div class="content-inner">
						<!--내용영역-->
						<p>${usersInfo.introduce}</p>
					</div>
					<div class="image-inner">
						<!-- 이미지영역 -->
						<img src="../resources/img/admin_dashboard.png">
						
					</div>
					<!-- <div class="like-inner">
						좋아요
						<img src="#"> <span>522</span>
					</div> -->
					<div class="link-inner">
						<a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
						<a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a> 
						<a href="##"><i class="glyphicon glyphicon-remove"></i>삭제하기</a>
					</div> --%>
					</div>
				</div>
				<!--우측 어사이드-->
				<!-- <aside class="col-sm-2">
					<div class="aside-inner">
						<div class="menu1">
							<p>목록</p>
							<ul>
								<li>목록1</li>
								<li>목록2</li>
								<li>목록3</li>
								<li>목록4</li>
								<li>목록5</li>
							</ul>
						</div>
					</div>
				</aside> -->
			</div>
		</div>
	</section>
</div>

	
		</div>
			</div>
					
		</div>
			<script>
    //팝업창 띄우기
    function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	
	var pop = window.open("${pageContext.request.contextPath }/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

    function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
      console.log(roadAddrPart1,addrDetail,zipNo);
      document.profile_update.addrZipNum.value = zipNo;
      document.profile_update.addrBasic.value = roadAddrPart1;
      document.profile_update.addrDetail.value = addrDetail;
      
    }
    </script>
		

  <script>
  (function(){
	  var msg = "${msg}";
	  
	  if(msg !==''){
		  alert(msg);
	  }
})();
          
  
	var str="";
	$(document).ready(function(){
		getList();
	});
	//데이터를 가져오는 함수
	function getList(resetYN){
		//등록후 호출되는 경우 전역변수에 문자열 초기화 필요
		if(resetYN==true){
			str="";
		}
		$.ajax({
			url:"getList",
			type:"get",
			success:function(data){
				for(var i=0; i<data.length; i++){
					
					str+='<div id="contentDiv">';
					str+='<div class="title-inner">';

					str+='<div class="profile">';
					str+='<img src="../resources/img/profile.png">';
					str+='</div>';
					str+='<div class="title">';
					//제목
					str+='<p>'+ data[i].id+'</p>';
					str+='<small>+'+ data[i].regdate+'</small>';
					str+='</div>';
					str+='</div>';
					str+='<div class="content-inner">';

					str+='<p>'+ (data[i].content==null ? '': data[i].content)+'</p>';
					str+='</div>';
					str+='<div class="image-inner">';

					str+='<img src="display/'+data[i].fileloca+"/"+data[i].filename +'">';
						
					str+='</div>';
					str+='<div class="like-inner">';

					str+='<img src="../resources/img/icon.jpg"> <span>522</span>';
					str+='</div>';
					str+='<div class="link-inner">';
					str+='<a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>';
					str+='<a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a>';
					str+='<a href="##"><i class="glyphicon glyphicon-remove"></i>삭제하기</a>';
					str+='</div>';
					str+='</div>';
				}
				$("#content_wrap").html(str);
			},
			error:function(error){
				console.log(data);
			}
		})
	}
	
	</script>
					
					
					
			
	

  <script>
  $("#uploadBtn").click(function() {
      var id = '${users.id}'; 
      var imgs = $("#file").val();
      
      
      var first = imgs.lastIndexOf(".");
      var last = imgs.length;
      var file  = imgs.substring(first, last).toLowerCase();
        
      if(file != '.jpg' && file != '.png' && file != '.bmp') {
         alert("jpg, png, bmp만 업로드가 가능합니다.");
         return;
      } else if( id == "" ) {
         alert("로그인 먼저");
         return;
      }
    
      var formData = new FormData();
      formData.append("file", $("#file")[0].files[0]); 
      formData.append("content", $("#content").val() ); 
      $.ajax({
         url: "upload",
         type: "post",
         processData: false, 
         contentType: false, 
         data: formData,
         success : function(data) {
            console.log(data);
            
            
         },
         error : function(error) {
            console.log(error);
         }
      });         
      
   });
  
  </script>


	<script>
		function readURL(input) {
        	if (input.files && input.files[0]) {
        		
            	var reader = new FileReader(); 
	        	reader.readAsDataURL(input.files[0]); 
	            $(".fileDiv").css("display", "block");
            	
            	reader.onload = function(event) { 
                	$('#fileImg').attr("src", event.target.result); 
                	console.log(event.target, 1)
	        	}
        	}
	    }
		$("#file").change(function() {
	        readURL(this); 
	        
	    });
	</script>
	
	<!-- 프로필 미리보기 -->
	 <script>
	 $("#img__preview").click(function() {
      var id = '${users.id}'; 
      var imgs = $("#editor").val();
  
      
      var first = imgs.lastIndexOf(".");
      var last = imgs.length;
      var file  = imgs.substring(first, last).toLowerCase();
        

      var formData2 = new FormData();
      formData2.append("file", $("#img__preview")[0].files[0]); 
      
      $.ajax({
         url: "upload",
         type: "post",
         processData: false, 
         contentType: false, 
         data: formData2,
         success : function(data) {
            console.log(data);
            
            
         },
         error : function(error) {
            console.log(error);
         }
      });         
      
   });
  
	 </script>
	
		 <script>
		function readURL2(input) {
        	if (input.files && input.files[0]) {
        		
            	var reader2 = new FileReader(); 
	        	reader2.readAsDataURL(input.files[0]); 
	            $(".fileDiv2").css("display", "block");
            	
            	reader2.onload = function(event) { 
                	$('#editor').attr("src", event.target.result); 
                	console.log(event.target, 2)
	        	}
        	}
	    }
		$("#img__preview").change(function() {
	        readURL2(this); 
	        
	    });
	</script> 
	
    <%@ include file="../include/footer.jsp" %>
</body>
</html>