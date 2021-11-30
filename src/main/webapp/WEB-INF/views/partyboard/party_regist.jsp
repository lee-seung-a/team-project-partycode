<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<style>
    
   
	/*부트스트랩 li의 drophover클래스 호버시에 드롭다운 적용코드*/
	ul.nav li.drophover:hover>ul.dropdown-menu {
		display: block;
		margin: 0;
	}
	img{
	max-width:100%;
	height:auto;
	}
	
	.aside-inner {
		position: fixed;
		top: 70px;
		width: 180px;
	}
	
	.section-inner {
		border-right: 1px solid #ddd;
		border-left: 1px solid #ddd;
		background-color: white;
	}
	
	.section-inner p, .aside-inner p {
		margin: 0;
	}
	
	.title-inner {
		position: relative;
		padding: 15px 0;
	}
	
	.title-inner .profile {
		position: absolute; /*부모기준으로 위치지정 릴레이티브*/
		top: 15px;
		left: 0;
	}
	
	.title-inner .title {
		padding-left: 50px;
	}
	/*내용*/
	.content-inner {
		padding: 10px 0;
	}
	/* 이미지영역  */
	.image-inner img {
		width: 100%;
	}
	/*좋아요*/
	.like-inner {
		padding: 10px 0;
		border-bottom: 1px solid #ddd;
		border-top: 1px solid #ddd;
		margin-top: 10px;
	}
	
	.like-inner img {
		width: 20px;
		height: 20px;
	}
	
	.link-inner {
		overflow: hidden;
		padding: 10px 0;
	}
	
	.link-inner a {
		float: left;
		width: 33.3333%;
		text-align: center;
		text-decoration: none;
		color: #333333;
	}
	
	.link-inner i {
		margin: 0 5px;
	}
	
	/*767미만 사이즈에서 해당 css가 적용됨*/
	/*xs가 767사이즈   */
	@media ( max-width :767px) {
		aside {
			display: none;
		}
	
	
	}
	
	.modal-content>.row {
		margin: 0px;
	}
	
	.modal-body>.modal-img {
		padding: 0px;
	}
	
	.modal-body>.modal-con {
		padding: 15px;
	}
	
	.modal-inner {
		position: relative;
	}
	
	.modal-inner .profile {
		position: absolute; /*부모기준으로 위치지정 릴레이티브*/
		top: 0px;
		left: 0px;
	}
	
	.modal-inner .title {
		padding-left: 50px;
	}
	
	.modal-inner p {
		margin: 0px;
	}
	.registForm{
	margin-top:200px;}
	.StatusWrapper{
	
	margin-top:100px;}
	
	.minimini {
	  width:600px;
	  heigth:50px;
	  display:inline;
	}

 div {
    font-family:normal;
    margin:3px; 
    font-size:20px;
    }
    
    .header{
    height:450px;
    }
    
    .form-control{
     border:10px;
    
    }
	</style>
	
</style>





	<%@ include file="../include/header.jsp"%>
	
	
<body>

 
  <script>
	$(document).ready(function() {
		
	  $("#datepicker").datepicker({ minDate: 0, maxDate: "+1M +10D" });
	});
  </script>




	<br>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>




	<form class="registForm" action="regist" name="partyForm" enctype="multipart/form-data" method="post" style="border:1px solid black; width:1350px; margin:0 auto; margin-top:300px; padding:60px 0px;">

        <h1 style="margin-bottom:70px; text-align:center; "><b>파티 등록하기</b> </h1>
		<div class="Background">
			<div id="tainer" class="container Container">
				<div class="Wrapper">
					<div class="TopTitle">
						<div class="TopInner">
							<select class="little" style="color:black; width:200px; height:50px; font-size:25px;" type="text"
								name="ptheme" placeholder="카테고리" >
								<option  selected="selected">카테고리</option>
								<option value="취미">취미</option>
								<option value="여행">여행</option>
								<option value="맛집">맛집</option>
								<option value="파티">파티</option>
								<option value="스터디">스터디</option>
								<option value="기타">기타</option>
							
								
								</select>
							<h1 class="Title">
								<input class="form-control" name="ptitle" type="text"
									placeholder="제목을입력하세요">
							</h1>
							<input class="name" type="text" name="pid" value="${users.getId()}" readonly></input>
						</div>
					</div>
					<div class="filebox">
							 <label for="file">이미지업로드</label> <input type="file" name="file"
								id="file">
								
						
					<div class="ImgAside"  >
						<div class="ImgOut" >
							<figure class="ImgFigure" style="width:400px; height:300px;">
							<div class="fileDiv" style="width:400px; height:300px;">
					<img id="fileImg" src="../resources/img/img_ready.png">
				</div>
				
              
							</figure>
							</div>
						</div>		
								
								<div class="ImgInner">
								<textarea rows="10" name="pcontent" cols="20" style="width:1100px;"></textarea>

								</div>
						
					
							<div class="StatusWrapper">
								<div class="StatusInner">
									<div class="StatusTitle"><b>파티실행금액</b></div>
									<div class="Status">
										<input type="number" class="form-control" id="pgoal" placeholder="금액을입력하세요" name="pgoal"><span>원</span>
										<span id="msgPgoal"></span>
									</div>
								</div>
								<div class="StatusInner">
									<div class="StatusTitle"><b>파티날짜</b></div>
									<div class="Status">
										<input id="pdate" class="form-control" type="date" name="pdate"  /><span id="msgPdate"></span>
									</div>
									<div class="StatusInner">
										<div class="StatusTitle"><b>최소인원 - 최대인원</b></div>
										<div class="Status">
										<input class="form-control"
												type="number" id="pmin" name="pmin"> <span>명</span>
											<input type="number" class="form-control" id="pmax" name="pmax"> <span>명 <span id="msgPcheck"></span>
										</div>
									</div>
									<div class="StatusInner">
										<div class="form-group">
											<label for="addr-num"><b>파티장소</b></label>
											<div class="input-group">
												<input type="text" class="form-control" id="partyaddrzipnum"
													name="plocation1" placeholder="우편번호">
												<div class="input-group-addon">
													<button type="button" class="btn btn-primary"
														onClick="goPopup()">주소찾기</button>
												</div>
											</div>
										</div>

										<div class="form-group">
											<input type="text" class="form-control" id="partyaddrbasic"
												name="plocation2" placeholder="기본주소">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="partyaddrdetail"
												name="plocation3" placeholder="상세주소">
										</div>


									</div>
									<div class="Buttonss">
										<div class="InnerButtonss">
											<div></div>

										</div>

									</div>

								</div>
	
					</div>
				</div>
			</div>



			<div id="tainer2" class="container">
				<div class="Wrap2">
					<div class="contents">
						<div>
							<!--      <input id="img-selector" name="partyphoto1" type="file" accept="image/*"/> 
             <input id="img-selector" name="partyphoto2"  type="file" accept="image/*"/> 
             <input id="img-selector" name="partyphoto3"  type="file" accept="image/*"/>  -->

							<!--  <textarea name="partymaintext"></textarea> -->
							
						</div>
						
					</div>



					<div class="contents2">
						<div class="minibox">
							<div class="minimini support"><b>여기는 파티금액 설정하는곳입니다.</b>
							<input class=" supportmoney form-control" type="number" name="pattend" id="pattend"
								placeholder="50000" /><span id="msgPattend"></span></div>
							
						</div>
						<div class="minibox">
							<h4 class="minimini hashtagTitle"><B>파티코드를 입력하세요</B><input class="hashinput form-control" type="text" placeholder="ex)눈누난나"
								name="partycode" id="partycode" /><span id="msgPartycode"></span></h4>

							
						</div>
						<div class="minibox">
							<div class="minimini textareaTitle">
								<span class="spant"><b>파티를 소개할 수있는 멘트를 적어주세요<br>ex)#등산
									같이 여행가고 싶어요</b>
								</span><input type="text" class="form-control" class="textarea1" name="pment" />
							</div>
					
						</div>
						<div class="minimini minibox">
							<b>소셜미디어 url</b> 	<input type="text" class="form-control" placeholder="트위터URL입력" name="sno">		

						</div>

					</div>

				</div>

			</div>
		</div>
		</div>

		<div style="text-align:center; margin-top:30px;">
			<input type="button" id="partybtn" class="btn" value="파티 등록하기">
		</div>
	</form>





	<%@ include file="../include/footer.jsp"%>


</body>

<script>
(function(){
	  var msg = "${msg}";
	  
	  if(msg !==''){
		  alert(msg);
	  }
})();



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
  


	    
	    	

</script>

<script>
//자바 스크립트 파일 미리보기 기능
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

<script>
var pgoal = document.getElementById("pgoal");


pgoal.onchange = function() {
    /*자바스크립트의 정규표현식 입니다*/
    /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
    
    if((document.getElementById("pgoal").value=='' || document.getElementById("pgoal").value==null )) {
        document.getElementById("pgoal").style.borderColor = "red";
        document.getElementById("msgPgoal").innerHTML = "금액을 입력하세요";

    } else {
        document.getElementById("pgoal").style.borderColor = "green";
        document.getElementById("msgPgoal").innerHTML = "";
    }
}

var pmin = document.getElementById("pmin");
var pmax = document.getElementById("pmax");


pmax.onchange = function(){
	
	var pMin = parseInt(pmin.value); 
	var pMax =  parseInt(pmax.value);
	console.log(pMin);
	console.log(pMax);
	

 if((pMin>pMax)){
		
		 document.getElementById("pmin").style.borderColor = "red";
		 document.getElementById("pmax").style.borderColor = "red";
	        document.getElementById("msgPcheck").innerHTML = "최소인원이 최대인원보다 클 수 없습니다.";
	}else{
		 document.getElementById("pmin").style.borderColor = "green";
		 document.getElementById("pmax").style.borderColor = "green";
	        document.getElementById("msgPcheck").innerHTML = "";
	}
}


pmin.onchange = function(){
	var pMin = parseInt(pmin.value);
	var pMax = parseInt(pmax.value);
	
	if((pMin>pMax)){
		
		document.getElementById("pmin").style.borderColor = "red";
		 document.getElementById("pmax").style.borderColor = "red";
	        document.getElementById("msgPcheck").innerHTML = "최소인원이 최대인원보다 클 수 없습니다.";
		
	}else{
		document.getElementById("pmin").style.borderColor = "green";
	 document.getElementById("pmax").style.borderColor = "green";
     document.getElementById("msgPcheck").innerHTML = "";
		
	}
	
	
}


var pattend = document.getElementById("pattend");


pattend.onchange = function() {
    /*자바스크립트의 정규표현식 입니다*/
    /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
    
    if((document.getElementById("pattend").value=='' || document.getElementById("pgoal").value==null )) {
        document.getElementById("pattend").style.borderColor = "red";
        document.getElementById("msgPattend").innerHTML = "금액을 입력하세요";

    } else {
        document.getElementById("pattend").style.borderColor = "green";
        document.getElementById("msgPattend").innerHTML = "";
    }
}



var pattend = document.getElementById("pattend");


pattend.onchange = function() {
    /*자바스크립트의 정규표현식 입니다*/
    /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
    
    if((document.getElementById("pattend").value=='' || document.getElementById("pattend").value==null )) {
        document.getElementById("pattend").style.borderColor = "red";
        document.getElementById("msgPattend").innerHTML = "금액을 입력하세요";

    } else {
        document.getElementById("pattend").style.borderColor = "green";
        document.getElementById("msgPattend").innerHTML = "";
    }
}

var partycode = document.getElementById("partycode");


partycode.onchange = function() {
    /*자바스크립트의 정규표현식 입니다*/
    /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
    
    if((document.getElementById("partycode").value=='' || document.getElementById("partycode").value==null )) {
        document.getElementById("partycode").style.borderColor = "red";
        document.getElementById("msgPartycode").innerHTML = "파티코드를 입력하세요";

    } else {
        document.getElementById("partycode").style.borderColor = "green";
        document.getElementById("msgPartycode").innerHTML = "";
    }
}
 

</script>

<script>

var pdate = document.getElementById("pdate");

 pdate.onchange=function(){
	
	
	var partyday = pdate.value.split('-');

	var today = new Date();
	var Pdate = new Date(partyday[0],parseInt(partyday[1])-1,partyday[2]);
	console.log(pdate.value);
	
	
 
	
	if(Pdate.getTime() >=today.getTime()){
		document.getElementById("pdate").style.borderColor = "green";
        document.getElementById("msgPdate").innerHTML = pdate.value+"에 파티가 실행됩니다.";

	}else{
		 document.getElementById("pdate").style.borderColor = "red";
	        document.getElementById("msgPdate").innerHTML = "파티날짜를 확인해 주세요";
	}
	
}

</script>


    	<script>
    	
    	$("#partybtn").click(function(){
    		
    		/* console.log($("#pdate").css("borderColor")) */
    		if($("#pdate").css("borderColor")!="rgb(0, 128, 0)"){
    			
    			alert("날짜를 입력하세요")
    			return;
    		
    		}else if($("#partycode").css("borderColor")!="rgb(0, 128, 0)"){
    			alert("파티코드를 입력하세요")
    			return;
    			
    		}else if($("#pmin").css("borderColor")!="rgb(0, 128, 0)" && $("#pmax").css("borderColor")!="rgb(0, 128, 0)"){
    			alert("최소인원과 최대인원이 맞지 않습니다.")
    			return;
    		}else if($("#pattend").css("borderColor")!="rgb(0, 128, 0)"){alert("참가액을 설정해 주세요")
    			return;
			}else if($("#pgoal").css("borderColor")!="rgb(0, 128, 0)"){
				
				alert("목표금액을 설정해 주세요")
				return;
			}
    			
    		
    		
    		else{
    			document.partyForm.submit(); //form의 액션값 signUp
    		} 		
    		
    	});
    	</script>

</html>