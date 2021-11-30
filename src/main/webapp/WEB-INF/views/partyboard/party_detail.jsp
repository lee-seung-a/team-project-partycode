<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
<!--개인 디자인 추가-->


<link
	href="${pageContext.request.contextPath }/resources/css/style_common.css"
	rel="stylesheet">
<head>
<style>

#heartlike{
	cursor: pointer;
}

 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: white; text-decoration: none;}

</style>
</head>


	<%@ include file="../include/header.jsp"%>
<body>
	<div class="detailWrap">
		<form class="detailform" method="post"
			action="../boughtthis/insertibt" onsubmit="return confirm('파티에 참가하시겠습니까?');">
			<div class="Background">
		
			<div class="partyone" style="position:absolute; left:80px; top:554px; width:300px; height:500px; border:4px solid grey; text-align:center; ">
			   <h3>현재 참가중인 파티원</h3>
			   <hr>
			    <c:forEach var="i" begin="0" end="${fn:length(vo.ibtlist) }" >
													
												
		<a  onclick="return confirm('프로필로 이동하시겠습니까?');" href="/partycode/users/othersprofile?id=${vo.ibtlist[i].my_id }">
											<h4><b>${vo.ibtlist[i].my_id }</b></h4>	</a>
											<hr>
													
													      
													</c:forEach>
			</div>
				<div class="container Container">
					<div class="Wrapper">
						<div class="TopTitle">
							<div class="TopInner">
								<button class="btn">${vo.ptheme }</button>
								<h1 class="Title">${vo.ptitle }</h1>
								<div class="name">${vo.pid }</div>
							</div>
						</div>
						<div class="ImgAside">
							<div class="ImgOut">
								<figure class="ImgFigure">
									<div class="ImgInner2">
										<img src="display/${vo.fileloca }/${vo.filename }" />
									</div>
								</figure>
							</div>
							<aside class="Aside">
								<div class="StatusWrapper">
									<div class="StatusInner">
										<div class="StatusTitle">모인금액</div>
										<div class="Statu" name="charity">
											<b>${vo.psum }</b><span>원</span>/<b class="Statu" name="goal"><fmt:formatNumber value="${vo.pgoal }" pattern="  ###,###,###"/></b>
											<span>원</span><span class="percent">${percent }%</span>
										</div>
									</div>
									<div class="StatusInner">
										<div class="StatusTitle">남은시간</div>
										<div class="Status" name="remainday">${remain }<span>일</span>
										</div>
									</div>
									<div class="StatusInner">
										<div class="StatusTitle">후원자  파티참가자</div>
										<div class="Status">
											&nbsp;&nbsp;&nbsp;&nbsp;${vo.psc }<span>명</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${fn:length(vo.ibtlist) }명 
										</div>
									</div>
									<div class="funding">
										<div>펀딩진행중</div>
										<div>목표금액인 ${vo.pgoal}원이 모여야 결제됩니다.</div>
										<div>결제는 ${vo.pdate}에 결제됩니다.</div>
									</div>
									<div class="Buttons">
										<div class="InnerButtons">
											<div>
												<div>
													<c:choose>
														<c:when test="${remain<=0 }">
															<button type="button" class="btn btn-danger">종료된
																파티입니다.</button>
														</c:when>
														
														<c:when test="${remain!=0 && users.point >= vo.pattend	 }">
															<button type="submit" class="btn btn-primary" >파티
																참가하기</button>
																
														</c:when>
														
														<c:when test="${remian!=0 && users.point < vo.pattend}">
															<button type="button" class="btn" oclick="point" onclick="location.href='../users/pay'">포인트부족
																-충전하러가기</button>
														</c:when>
														
													</c:choose>
													 <c:set var="doneLoop" value="false"/>
												
													<c:forEach var="i" begin="0" end="${fn:length(vo.ibtlist) }" >
													<c:if test="${not doneLoop }">
													   <c:if test="${vo.ibtlist[i].my_id ==users.id }">
													<a onclick="return confirm('정말 탈퇴하시겠습니까?');" href="/partycode/boughtthis/deleteibt?your_pno=${vo.pno }&id=${users.id }&pno=${vo.pno }&pattend=${vo.pattend }&my_id=${users.id }"><button type="button" class="btn"
														>파티탈퇴하기</button>
													</a>	 <c:set var="doneLoop" value="true"/>
													      </c:if> 
													      </c:if>
													</c:forEach>
													
													
                                                     
                                                     <c:if test="${vo.pid == users.id}">
													<button type="button" class="btn"
														onclick="location.href='party_update?pno=${vo.pno}'">수정</button>
														</c:if>
														<div style="background-size:25px; display:inline; float:left;  background-image:url(${pageContext.request.contextPath }/resources/img/heart2.png); background-repeat:no-repeat; width:35px; height:35px;" class="heart" id="heartlike" onclick="bg_chage()"> 
												</div>

											</div>

										</div>

</div>
</div>


										<div class="InnerButtons">
											<div class="ButtonsWrap">

												<div class="heart" id="heartlike" onclick="bg_chage()">
													<span></span>
												</div>

											</div>

										</div>

									</div>
									<div style="width: 400px;">
										<svg style="margin: 0 10px;" id="logosm" viewBox="0 0 48 48">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M27.3343 2.24555C15.2931 0.443311 4.05474 8.75365 2.24857 20.8687C0.442397 32.9838 8.67052 44.1978 20.7117 46V30.4807H15.1928V24.0727H20.7117V19.1666V17.6647C21.0127 13.3594 24.7254 10.1554 29.0401 10.4558C30.6456 10.4558 32.3514 10.656 33.9579 10.8563V16.3631H31.047H30.3446C28.5384 16.5634 27.3343 18.0652 27.4356 19.8675V23.9726H33.5556L32.5521 30.3816H27.535V46C32.6525 45.199 37.3686 42.4956 40.6799 38.5908C44.0916 34.5858 45.9991 29.3803 45.9991 24.0727C46.0984 13.1591 38.071 3.84755 27.3343 2.24555Z"></path></svg>
										<!--트위터-->
										<svg style="margin: 0 5px;" id="logosm" viewBox="0 0 48 48">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M46 10.288C44.304 10.986 42.607 11.485 40.812 11.784C42.707 10.587 44.104 8.792 44.803 6.698C43.007 7.795 41.111 8.493 39.115 8.892C37.419 7.097 35.024 6 32.53 6C27.542 6.1 23.451 10.188 23.551 15.175C23.551 15.873 23.65 16.571 23.75 17.269C16.467 16.87 9.682 13.38 5.192 7.596C2.798 11.784 3.995 17.169 7.986 19.962C6.589 19.962 5.192 19.563 3.896 18.765V18.865C3.796 23.253 6.889 27.042 11.079 27.939C10.281 28.14 9.483 28.239 8.685 28.239C8.086 28.239 7.587 28.14 6.988 28.04C8.086 31.729 11.478 34.322 15.37 34.422C12.177 37.015 8.186 38.411 4.195 38.411C3.497 38.411 2.798 38.411 2 38.311C6.09 41.103 10.879 42.5 15.769 42.5C30.036 42.4 41.41 30.832 41.41 16.571V16.172V14.975C43.306 13.779 44.803 12.183 46 10.288Z"></path></svg>
										<!--인스타그램-->
										<svg style="margin: 0 5px;" id="logosm" viewBox="0 0 48 48">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M36.0761 9.1C36.0761 10.5 37.1785 11.6 38.5816 11.6C39.8846 11.6 41.0872 10.5 41.0872 9.1C41.0872 7.7 39.9848 6.6 38.5816 6.6C37.1785 6.6 36.0761 7.7 36.0761 9.1ZM10.9199 24C10.9199 31.1 16.8331 37 24.0492 37C31.2653 37 37.0783 31.2 37.0783 24C37.0783 16.8 31.1651 10.9 23.949 10.9C16.8331 10.9 10.9199 16.8 10.9199 24ZM11.3208 2H36.7776C41.9893 2 46.0984 6.2 45.9982 11.3V36.7C45.9982 41.8 41.889 46 36.6774 46H11.3208C6.2094 46 2 41.8 2 36.6V11.3C2 6.2 6.2094 2 11.3208 2ZM15.1293 24C15.1293 19.1 19.1383 15.1 24.0492 15.1C29.0604 15.1 32.9691 19.1 32.9691 24C32.9691 28.9 28.9602 32.9 24.0492 32.9C19.1383 32.9 15.1293 28.9 15.1293 24Z"></path></svg>
										<!--카카오톡-->
										<svg style="margin: 0 5px;" id="logosm" viewBox="0 0 48 48">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M24 4C11.8 4 2 11.6865 2 21.0924C2.4 27.5653 6.4 33.1279 12.2 35.5552L10.1 43.2417C10 43.444 10.1 43.7474 10.3 43.8475C10.5 44.0508 10.9 44.0508 11.1 43.8475L20 37.8814C21.3 38.0837 22.6 38.1848 24 38.1848C36.1 38.1848 46 30.4983 46 21.0924C46 11.6865 36.2 4 24 4Z"></path></svg>
									</div>
							</aside>
						</div>
					</div>
				</div>
			</div>

			<ul id="con" class=" container con3 nav nav-tabs tabs-style">
				<li class="active"><a data-toggle="tab" href="#info"><img
						src="${pageContext.request.contextPath }/resources/img/detailinfo.png"></a></li>
				<li><a data-toggle="tab" href="#Review"><img
						src="${pageContext.request.contextPath }/resources/img/review.png"></a></li>

			</ul>


			<div class="tab-content">
				<div id="info" class="tab-pane fade in active  container Container2">
					<div class="Wrap2">
						<div class="contents">
						${vo.pcontent}
						
						</div>


						<div class="contents2">
							<div class="minibox">
								<div class="won1000" style="margin-top:100px; font-size:30px;">
							              PARTYCODE
								</div>
								<div class="support">
									
								</div>


							</div>
							<div class="minibox">

								<div class="partycost">
									
									<h1 class="costmoney" name="partycost">
										<span>파티 참가비:</span><fmt:formatNumber value="${vo.pattend }" pattern="  ###,###,###"/>원</h1>
								</div>
							</div>
							<div class="minibox">
								<ul class="list-group">
									<li id="lii" class="list-group-item"><span>주소:</span>${vo.plocation2 }
									</li>
									<li id="lii" class="list-group-item"><span>주소:</span>${vo.plocation3 }</li>
									<li id="lii" class="list-group-item"><span></li>
								</ul>
							</div>
							<div class="minibox">
								<ul class="list-group">
									<li id="lii" class="list-group-item">파티시작일:${vo.pdate }</li>
								<c:set var="doneLoop" value="false" />
								<c:forEach var="i" begin="0" end="${fn:length(vo.ibtlist) }" >
									<c:if test="${not doneLoop }">
									<c:if test="${vo.ibtlist[i].your_pcode==vo.partycode or vo.pid==users.id }">
									<li id="lii" class="list-group-item"><h3>PARTYCODE:${vo.partycode }</h3></li>
									<c:set var="doneLoop" value="true" />
									 </c:if>
									</c:if>
									</c:forEach>
									<li id="lii" class="list-group-item">해쉬태그:${vo.pment}</li>

								</ul>
							</div>

						</div>

					</div>
				</div>
				<input type="hidden" name="your_pno" value="${vo.pno}"> <input
					type="hidden" name="your_id" value="${vo.pid }"> <input
					type="hidden" name="your_title" value="${vo.ptitle }"> <input
					type="hidden" name="your_pcode" value="${vo.partycode }"> <input
					type="hidden" name="my_id" value="${users.id }">
					<input type="hidden" name="pno" value="${vo.pno}">
					<input type="hidden" name="pattend" value="${vo.pattend }">
					<input type="hidden" name="my_no" value="${users.uno }">
					<input type="hidden" name="id" value="${users.id }">
					<input type="hidden" name="partyattend" value="${vo.pattend }">
					<input type="hidden" name="remainpoint" value="${users.point }">
		</form>





		<div id="Review" class="tab-pane fade">


			<div class="Wrap2">
				

					<table class="table table-bordered">
						<thead>
							<c:forEach var="vo" items="${vo.reviewlist }">
								<tr>
									
									<td class="revwrtier" style="width:10%; text-align:center;">
										<a href="/partycode/users/othersprofile?id=${vo.revwriter }">${vo.revwriter }</a>
									</td>
									<td class="revrating" style="width:5%; text-align:center;">${vo.rating }</td>
									<td class="revcontent" style="width:75%;">${vo.revcontent }</td>
									<c:choose>
									<c:when test="${vo.revwriter eq users.id }">
										<td class="revdelete" style="width:10%; text-align:center;">
											<a
												href="/partycode/partyboard/reviewDelete?revno=${vo.revno }&rpno=${vo.rpno}">
												삭제</a>
										</td>
										</c:when>
										
									
                                     </c:choose>
								</tr>
							</c:forEach>
						</thead>


					</table>
				
			</div>





			<br>

			<div class="reviewWrap">
				<form action="registReview" method="post">
					<div class="container">
						<h3 class="text-center">리뷰를 남겨주세요!</h3>
						<p class="text-center" style="color: black">
							<em></em>
						</p>



						<div class="row">

							<div class="col-md-4">
								<p>참가자 정보</p>
								<p>
									<span class="glyphicon glyphicon-map-marker"></span>${users.id }
								</p>

								<p>
									<span class="glyphicon glyphicon-phone"></span>Phone:
									${users.tellnum }
									
								</p>
								<p>
									<span class="glyphicon glyphicon-envelope"></span>Email:
									${users.email1 }${users.email2 }
								</p>
							</div>
							<div class="col-md-8">
								<div class="row">
									<div class="col-sm-6 form-group">
										<input class="form-control" id="name" name="revwriter"
											type="text" value="${users.id }" required readonly>
									</div>
									<input type="hidden" name="rpno" value="${vo.pno }">
									<div class="col-sm-6 form-group">
										<div class="star-rating">
											<input type="checkbox" id="5-stars" class="star5"
												name="rating" value="5" />
											<p class="imoge imoge5"></p>
											<label for="5-stars" class="star5">&#9733;</label> <input
												type="checkbox" id="4-stars" class="star4" name="rating"
												value="4" /> <label for="4-stars">&#9733;</label> <input
												type="checkbox" id="3-stars" class="star3" name="rating"
												value="3" /> <label for="3-stars">&#9733;</label> <input
												type="checkbox" id="2-stars" class="star2" name="rating"
												value="2" /> <label for="2-stars">&#9733;</label> <input
												type="checkbox" id="1-star" class="star1" name="rating"
												value="1" /> <label for="1-star">&#9733;</label>

										</div>
									</div>
								</div>
								<textarea class="form-control" id="comments" name="revcontent"
									placeholder="200자 내외로 이 파티를 평가해주세요" rows="5"></textarea>
								<br>
								<div class="row">
									<div class="col-md-12 form-group">
										<button class="btn pull-right" type="submit">등록하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>



		</div>

	</div>


	</div>


	<%@ include file="../include/footer.jsp"%>





<script>
(function(){
	  var msg = "${msg}";
	  
	  if(msg !==''){
		  alert(msg);
	  }
})();
       

function bg_chage(){
    document.getElementById('heartlike').style.backgroundImage="url(${pageContext.request.contextPath }/resources/img/heart.png)"
  }
  

</script>

<script>

$("#heartlike").on("click", function () {
	
	console.log("들어옴");

   
    
    $.ajax({
    	
        url :'like',
        type :'POST',
        data:JSON.stringify({"plike": "${vo.plike}" ,"pno":"${vo.pno}"}),
        contentType:"application/json; charset=UTF-8;",
        success : function(data){
        	console.log("갔다옴")
            if(data==1) {
                $('#like').prop("src","/resources/img/heart2.png");
            }
            else{
                $('#like').prop("src","/resources/img/heart.png");
            }


        }
    });
});

</script>
</body>
</html>