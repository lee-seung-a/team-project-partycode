<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/sns.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Display:wght@500&display=swap" rel="stylesheet">

<style>
	
 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: white; text-decoration: none;}
 a{
  color:white;
  font-weight:800px;
  font-size:20px;
 }
	img{
        max-width:100%;
        height:auto;
       }
       
  
   
   .container{
   background-color: #f8f9fa;
   }
    

    
    #ibt{
    margin-top: 20px;
    }
    
    #uploadBtn{
    margin-left: 550px; 
    margin-top: 20px;
    }
    
    
</style>


</head>

<body>
<%@ include file="../include/header.jsp" %>


<div class="superwrap" style="margin-top:400px; border:5px solide black;" >

<section>
		<div class="container"  style="height:1500px; overflow:scroll; background-color:#555;">
			<div class="row">
				<aside class="col-sm-2">
					<div class="aside-inner">
						<div class="menu1">
							<p>
								<img src="../resources/img/profile.png">${users.uname}
							</p>
							<ul>
								<li><a href="${pageContext.request.contextPath }/users/profile">내 정보</a></li><br>
								<li><a href="${pageContext.request.contextPath }/users/profile">내가 찜한 게시글</a></li>
							</ul>
						</div>
						<div class="menu2">
							<ul>
							<li><a href="${pageContext.request.contextPath }/partyboard/party_board">둘러보기</a></li><br>
								<li><a href="${pageContext.request.contextPath }/partyboard/party_board">공지사항</a></li>
							</ul>
						</div>
					</div>
				</aside>
				<div class="col-xs-12 col-sm-8 section-inner">
				 	<h4>게시글 업데이트</h4>
					<div class="fileDiv">
						<img id="fileImg" src="../resources/img/img_ready.png">
					</div> 
		 			<div class="reply-content">
						<textarea class="form-control" rows="3" name="content"
							id="content" placeholder="게시글을 등록해주세요"></textarea>
						<div class="reply-group">
							<div class="filebox pull-left" >
								<label for="file" id="ibt" style="background-color:black; border:none;">이미지 업로드</label> 
								<input type="file" name="file" id="file">
							</div>
							
							<button type="button" class="right btn btn-primary" id="uploadBtn">Update</button>
						</div>
					</div> 
				<!-- <div><button type="button" class="right btn btn-warning" onclick="location.href=''">게시글 업데이트 하러가기</button></div> -->

				<div id="content_wrap">
					</div>

			</div>
		</div>
		</div>
	</section>
	
	</div>
<script>
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
					str+='<p>'+ '익명' +'</p>';
					str+='<small>+'+ '언제일까?' +'</small>';
					str+='</div>';
					str+='</div>';
					str+='<div class="content-inner">';

					str+='<p>'+ (data[i].content==null ? '': data[i].content)+'</p>';
					str+='</div>';
					str+='<div class="image-inner">';

					str+='<img src="disflay/'+data[i].fileloca+"/"+data[i].filename +'">';
					str+='</div>';
					str+='<div class="like-inner">';
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
            
            history.go(0);
            
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
                	console.log(event.target)
	        	}
        	}
	    }
		$("#file").change(function() {
	        readURL(this); 
	        
	    });
	</script>
	
<%@ include file="../include/footer.jsp" %>



</body>
</html>