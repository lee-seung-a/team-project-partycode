<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>

     

      <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}resources/js/jquery.js"></script>

 


      <link href="${pageContext.request.contextPath }/resources/css/profile.css" rel="stylesheet">
      <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sns.css">

      <title>Insert title here</title>
      <style>
       img{
        max-width:100%;
        height:auto;
       }
      </style>
    </head>

    <body>
   
    
    <%@ include file="../include/header.jsp"%>
 <div class="superwrap" style="height:1500px;">

      <ul style="margin-top:450px;" id="con" class=" container con3 ">
        <li class="active"><a data-toggle="tab" href="#info"><img
              src="${pageContext.request.contextPath }/resources/img/user.png"></a></li>
        <li><a data-toggle="tab" href="#myBoard"><img
              src="${pageContext.request.contextPath }/resources/img/like3.png"></a></li>

      </ul>


      <div class="tab-content">

        <div id=info class="tab-pane fade in active">
          <div class="bg">
            <div class="container con1">
              <div class="wrapper1">
                <div class="prophoto1">
                  <img id="userphoto" class="" src="disflay/${usersInfo.fileloca }/${usersInfo.filename}">
                  <%-- <span id="like"></span> <img id="heart"
                      src="${pageContext.request.contextPath }resources/img/heart.png"> --%>

                </div>


              </div>

            </div>

            <div id="con" class="container con3">
              <ul>
                <li><img class="updateprofile" src="${pageContext.request.contextPath }/resources/img/user.png" alt=""
                    onclick="location.href='updateprofile?id=${users.id}'"></li>
                <li> <button type="button" class="btn" id="follower-btn" data-target="#follower"
                    data-toggle="modal">팔로워</button></li>
                <li> <button type="button" class="btn" id="following-btn" data-target="#following"
                    data-toggle="modal">팔로잉</button></li>

              </ul>
            </div>

            <div class="container con1">
              <div class="wrapper">

                <div class="prophotoright">
                  <div class="rightplace">
                    <div class="texttop">NAME</div>
                    <div class="textbot">${usersInfo.uname}</div>
                  </div>
                  <div class="rightplace">
                    <div class="texttop">INTRODUCE</div>
                    <div class="textbot">${usersInfo.introduce}</div>
                  </div>
                  <div class="rightplace">
                    <div class="texttop2"> <a href="https://www.facebook.com/"><svg id="logosm" viewBox="0 0 48 48">
                          <path fill-rule="evenodd" clip-rule="evenodd"
                            d="M27.3343 2.24555C15.2931 0.443311 4.05474 8.75365 2.24857 20.8687C0.442397 32.9838 8.67052 44.1978 20.7117 46V30.4807H15.1928V24.0727H20.7117V19.1666V17.6647C21.0127 13.3594 24.7254 10.1554 29.0401 10.4558C30.6456 10.4558 32.3514 10.656 33.9579 10.8563V16.3631H31.047H30.3446C28.5384 16.5634 27.3343 18.0652 27.4356 19.8675V23.9726H33.5556L32.5521 30.3816H27.535V46C32.6525 45.199 37.3686 42.4956 40.6799 38.5908C44.0916 34.5858 45.9991 29.3803 45.9991 24.0727C46.0984 13.1591 38.071 3.84755 27.3343 2.24555Z">
                          </path>
                        </svg></a>
                      <!--트위터-->
                      <a href="https://twitter.com/"><svg id="logosm" viewBox="0 0 48 48">
                          <path fill-rule="evenodd" clip-rule="evenodd"
                            d="M46 10.288C44.304 10.986 42.607 11.485 40.812 11.784C42.707 10.587 44.104 8.792 44.803 6.698C43.007 7.795 41.111 8.493 39.115 8.892C37.419 7.097 35.024 6 32.53 6C27.542 6.1 23.451 10.188 23.551 15.175C23.551 15.873 23.65 16.571 23.75 17.269C16.467 16.87 9.682 13.38 5.192 7.596C2.798 11.784 3.995 17.169 7.986 19.962C6.589 19.962 5.192 19.563 3.896 18.765V18.865C3.796 23.253 6.889 27.042 11.079 27.939C10.281 28.14 9.483 28.239 8.685 28.239C8.086 28.239 7.587 28.14 6.988 28.04C8.086 31.729 11.478 34.322 15.37 34.422C12.177 37.015 8.186 38.411 4.195 38.411C3.497 38.411 2.798 38.411 2 38.311C6.09 41.103 10.879 42.5 15.769 42.5C30.036 42.4 41.41 30.832 41.41 16.571V16.172V14.975C43.306 13.779 44.803 12.183 46 10.288Z">
                          </path>
                        </svg></a>
                      <!--인스타그램-->
                      <a href="http://www.instagram.com/"><svg id="logosm" viewBox="0 0 48 48">
                          <path fill-rule="evenodd" clip-rule="evenodd"
                            d="M36.0761 9.1C36.0761 10.5 37.1785 11.6 38.5816 11.6C39.8846 11.6 41.0872 10.5 41.0872 9.1C41.0872 7.7 39.9848 6.6 38.5816 6.6C37.1785 6.6 36.0761 7.7 36.0761 9.1ZM10.9199 24C10.9199 31.1 16.8331 37 24.0492 37C31.2653 37 37.0783 31.2 37.0783 24C37.0783 16.8 31.1651 10.9 23.949 10.9C16.8331 10.9 10.9199 16.8 10.9199 24ZM11.3208 2H36.7776C41.9893 2 46.0984 6.2 45.9982 11.3V36.7C45.9982 41.8 41.889 46 36.6774 46H11.3208C6.2094 46 2 41.8 2 36.6V11.3C2 6.2 6.2094 2 11.3208 2ZM15.1293 24C15.1293 19.1 19.1383 15.1 24.0492 15.1C29.0604 15.1 32.9691 19.1 32.9691 24C32.9691 28.9 28.9602 32.9 24.0492 32.9C19.1383 32.9 15.1293 28.9 15.1293 24Z">
                          </path>
                        </svg></a>
                      <!--카카오톡-->
                      <svg id="logosm" viewBox="0 0 48 48">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                          d="M24 4C11.8 4 2 11.6865 2 21.0924C2.4 27.5653 6.4 33.1279 12.2 35.5552L10.1 43.2417C10 43.444 10.1 43.7474 10.3 43.8475C10.5 44.0508 10.9 44.0508 11.1 43.8475L20 37.8814C21.3 38.0837 22.6 38.1848 24 38.1848C36.1 38.1848 46 30.4983 46 21.0924C46 11.6865 36.2 4 24 4Z">
                        </path>
                      </svg>
                    </div>

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
                  <th>파티시작일</th>                 
                  <th>파티참석금액</th>
           

                </tr>
              </thead>

              <tbody>
                <c:forEach var="vo" items="${usersInfo.list }">
                  <tr>
                    <td>${vo.pno }</td>
                    <td>${vo.plocation2 }</td>
                    <td><a href="../partyboard/party_detail?pno=${vo.pno }">${vo.ptitle }</a></td>
                     <td>${vo.pdate }</td>
                      <td>${vo.pattend }</td>
                 

                  </tr>
                </c:forEach>
              </tbody>
            </table>

          </div>



        </div>


        <div id="myBoard" class="tab-pane fade" >


          <div class="container" style="height:1500px; overflow:scroll;">
            <div class="row" style="height:1300px;">
              <aside class="col-sm-2">
                <div class="aside-inner">
                  <div class="menu1">
                    <p>
                      <img src="../resources/img/profile.png">${usersInfo.uname}
                    </p>
                    <ul>
                      <li><a href="${pageContext.request.contextPath }/users/profile">내 정보</a></li><br>
                      <li><a href="${pageContext.request.contextPath }/users/profile">내가 찜한 게시글</a></li>
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
              <div class="col-xs-12 col-sm-8 section-inner">
                <h4>게시글</h4>
                <!-- 파일 업로드 폼입니다 -->
                <div class="fileDiv">
                </div>
                <!-- 					<div class="reply-content">
						<textarea class="form-control" rows="3" name="content"
							id="content" placeholder="게시글을 등록해주세요"></textarea>
						<div class="reply-group">
							<div class="filebox pull-left">
								<label for="file">이미지 업로드</label> 
								<input type="file" name="file" id="file">
							</div>
							
							<button type="button" class="right btn btn-info" id="uploadBtn">Update</button>
						</div>
					</div> -->

                <div id="content_wrap">
                </div>

              </div>
            </div>

          </div>
          
        </div>


      </div>
      </div>






      <div id="following" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <div class="modal-content">
            <div class="modal-header" style="text-align:center; padding:40px 50px;">
              <h2>팔로잉 리스트</h2>
            </div>
            <div class="modal-body" style="padding:40px 50px;">

              <c:if test="${followingList.size()<=0 }">
                <p>당신이 팔로잉한 회원이 없습니다.</p>
              </c:if>

              <c:if test="${followingList.size() >0 }">
                <c:forEach var="vo" items="${followingList }">
                  <li style="display:block;" class="follow-li">
                    <div style="display:inline;  border-radius:70%; width:100px; height:100px;" class="profile-section">
                      <c:choose>
                        <c:when test="${(vo.fileloca != null) && (vo.filename != null) }">
                          <a href="othersprofile?id=${vo.list3[0].passiveuserid}"> <img
                              style="display:inline;  border-radius:70%; width:100px; height:100px;"
                              class="profile-photo" src="disflay/${vo.fileloca }/${vo.filename}" />
                          </a>
                        </c:when>
                        <c:otherwise>
                          <a href="othersprofile?id=${vo.list3[0].passiveuserid}"> <img
                              style="display:inline;  border-radius:70%; width:100px; height:100px;"
                              class="profile-photo"
                              src="${pageContext.request.contextPath }/resources/img/admin_person_search.png" />
                          </a>
                        </c:otherwise>

                      </c:choose>
                    </div>

                    <p style="display:inline; margin-left:100px; font-size:40px; " class="profile-id">
                       ${vo.list3[0].passiveuserid}</p>
                </c:forEach>
              </c:if>

            </div>
          </div>
        </div>
      </div>






      <div id="follower" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <div class="modal-content">
            <div class="modal-header" style="text-align:center; padding:40px 50px;">
              <h2>팔로워 리스트</h2>
            </div>
            <div class="modal-body" style="padding:40px 50px;">

              <c:if test="${followerList.size()<=0 }">
                <p>당신을 팔로우한 회원이 없습니다.</p>
              </c:if>


              <c:if test="${followerList.size() >0 }">
                <c:forEach var="vo" items="${followerList }">
                  <li style="display:block" class="follow-li">
                    <div style="display:inline;  border-radius:70%; width:100px; height:100px;" class="profile-section">
                      <c:choose>
                        <c:when test="${(vo.fileloca != null) && (vo.filename != null) }">

                          <a href="othersprofile?id=${vo.list3[0].activeuserid}"> <img
                              style="display:inline;  border-radius:70%; width:100px; height:100px;"
                              class="profile-photo" src="disflay/${vo.fileloca }/${vo.filename}" />
                          </a>
                        </c:when>
                        <c:otherwise>

                          <a href="othersprofile?id=${vo.list3[0].activeuserid}"><img
                              style="display:inline;  border-radius:70%; width:100px; height:100px;"
                              class="profile-photo"
                              src="${pageContext.request.contextPath }/resources/img/admin_person_search.png" />
                        </c:otherwise>

                      </c:choose>
                    </div>

                    <p style="display:inline; margin-left:100px; font-size:40px; " class="profile-id">
                      ${vo.list3[0].activeuserid}</p>
                  </li>
                </c:forEach>
              </c:if>
            </div>
          </div>
        </div>
      </div>

</div>

      
      
      
  <script> 
      (function(){
    	  var msg = "${msg}";
    	  
    	  if(msg !==''){
    		  alert(msg);
    	  }
    })();
             
      
        var str = "";
        $(document).ready(function () {
          getList();
        });
        //데이터를 가져오는 함수
        function getList(resetYN) {
          //등록후 호출되는 경우 전역변수에 문자열 초기화 필요
          if (resetYN == true) {
            str = "";
          }
          $.ajax({
            url: "getList",
            type: "get",
            success: function (data) {
              for (var i = 0; i < data.length; i++) {

                str += '<div id="contentDiv">';
                str += '<div class="title-inner">';

                str += '<div class="profile">';
                str += '<img src="../resources/img/profile.png">';
                str += '</div>';
                str += '<div class="title">';
                //제목
                str += '<p>' + data[i].id + '</p>';
                str += '<small>+' + data[i].regdate + '</small>';
                str += '</div>';
                str += '</div>';
                str += '<div class="content-inner">';

                str += '<p>' + (data[i].content == null ? '' : data[i].content) + '</p>';
                str += '</div>';
                str += '<div class="image-inner">';

                str += '<img src="display/' + data[i].fileloca + "/" + data[i].filename + '">';

                str += '</div>';
                str += '<div class="like-inner">';

                str += '<img src="../resources/img/icon.jpg"> <span>522</span>';
                str += '</div>';
                str += '<div class="link-inner">';
                str += '<a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>';
                str += '<a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a>';
                str += '<a href="##"><i class="glyphicon glyphicon-remove"></i>삭제하기</a>';
                str += '</div>';
                str += '</div>';
              }
              $("#content_wrap").html(str);
            },
            error: function (error) {
              console.log(data);
            }
          })
        }

      </script>





      <!--   <script>
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
  
  </script> -->


      <script>
        function readURL(input) {
          if (input.files && input.files[0]) {

            var reader = new FileReader();
            reader.readAsDataURL(input.files[0]);
            $(".fileDiv").css("display", "block");

            reader.onload = function (event) {
              $('#fileImg').attr("src", event.target.result);
              console.log(event.target)
            }
          }
        }
        $("#file").change(function () {
          readURL(this);

        });
      </script>

    
    <%@ include file="../include/footer.jsp" %>

    </body>

    </html>