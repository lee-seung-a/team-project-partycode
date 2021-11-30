<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

 
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
    
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/981d5b5a7f.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>

 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Candal&display=swap" rel="stylesheet">
 
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&family=Pacifico&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Zen+Antique&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Display:wght@500&display=swap" rel="stylesheet">
 
    <style>
      *{list-style: none; text-decoration: none; padding: 0; margin: 0;}

         
        .header_body {position:absolute; width: 100%; top: 0; left: 0; height:300px; background: black;}
        .header_body:hover { 
          
            transition:0.8s;
            transition-property: background;
            transition-duration: 0.8s;
            transition-timing-function: ease-out;}
        .header {padding: 20px 20px 0 20px;
          
            transition: background 0.15s ease-out;}
        .header .logo {text-align: center;}
        .header .logo .img {width: 500px;  height:200px;}


        .header .top {position: relative;  background-color: rgba(0, 0, 0, 0); }
        .header .top :hover {background-color: rgba(0, 0, 0, 0);}

        .header .left {position: absolute; top:0; left:0;}
        .left .left_btn { width:500px; vertical-align:middle;}
        .left .left_btn li {display: inline;  margin: 5px;}
        .left .left_btn li a { color: rgb(215, 215, 215); }
        .left .left_btn li :hover { color: #fff; }
        .left .left_btn img {clear: both; width:30px;}

        .header .right {position: absolute; top:0; right: 0;}
        .right .right_btn {overflow: hidden; width:400px; vertical-align:middle;}
        .right .right_btn li {display: inline;}
        .right .right_btn li a {float: right; color: rgb(215, 215, 215); margin: 5px;}
        .right .right_btn li :hover { color: #fff; }
        .right .right_btn img {clear: both;  width:30px; }

		.right_btn2 li {display: inline-flex; }
        .right_btn2 li a {float: right; color:#fff;; margin: 15px; size:40px;}
        .right_btn2 img { width:30px;  }
        .right_btn3 li {display: inline-flex;}
        .right_btn3 li a {float: right; color:#fff;; margin: 15px; size:40px;}
        .right_btn3 img { width:30px; }
        .uuser{
        margin-left: 250px; 
        }
        .mmoney{
  	margin-left: 250px;
     
        }
        
        
        

        /* 메뉴바 */

        .header .bottom {height:100px; padding: 0; margin: 0;background-color: rgba(0, 0, 0, 0); text-align: center;}
        .bottom:hover {background-color: rgba(0, 0, 0, 0); }
        
      

        /* 서브메뉴 */
      
        

   button.img-button{
       border:none;
       background:transparent;
       font-size:1.125rem;

   }

   .fas{
       color:white;
       font-size:24px;
   }
  .leftBarcontainer{
  width:1000px; 
  height:40px;
  }
   .keyword{
       border :none;
       border-bottom:1px solid white;
       outline:none;
       background: transparent;
       width:150px;
       color:white;
       font-size:1.063rem;
       font-style:normal;
       opacity:0;
      transition: 0.4s;
   }

  .search{
    
  }

  select{
      
      outline:none;
      width:80px;
      font-size:1.125rem;
      font-weight: 200;
      background: transparent;
      color:white;
     
      transition: 0.4s;
  }
  .search:hover>.keyword{
      opacity:1;

  }
  .search:hover > select{
      opacity: 1;
  }
  
  
.leftBar {text-align:center; margin:0 auto; width:1200px; height:40px;}

/*  #sideicon img, .searchModal{width:40px; height:40px; margin:0px 40px; cursor:pointer; position: relative;}*/
 
   #sideicon, .sideicon2{
   display:inline;
   } 
   
 #sideicon{
 width:40px; height:40px;  cursor:pointer; position: relative; transition: .2s ease; margin:0px 40px;
 } 
 

 
 .sideicon2{font-size: 15px; color: #fff; margin:0px 40px;
 position: absolute;

	top: -5px;
	left: -20px;
	} 

 .aModal{font-size: 15px; color: #fff; margin:0px 40px;
 position: absolute;
 visibility:hidden;
	top: 50%;
	left: 50%;
	} 


#sideicon:hover .aModal {
   visibility:visible; 
   display: block;
 }    


 #party_code{
  font-family: 'Pacifico', cursive;
  } 


    </style>


<div class="header_body">
    <div class="header">
        <div class="top">
         <form class="search">
             <button class="img-button" type="submit" name="click" value="">
                

             </button>
             <input class="keyword" type="text" id="search" name="search" maxlength=255 value="" autocomplete="off"/>
           
         </form>


        <div class="left"><!--왼쪽-->
            <div >
                <nav class="left_menu">
                    <ul class="left_btn">
                        <li><a href="${pageContext.request.contextPath }/boughtthis/map"><img src="${pageContext.request.contextPath }/resources/img/now.png"><small>파티지도</small></a></li>
                        <li><a href="${pageContext.request.contextPath }/snsboard/sns_board"><small>SNS</small></a></li>
                        <li><a href="#"><small>메뉴</small></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="logo">
            <!-- <a href="#"><div style="color:white; font-size:65px; margin-top:50px; font-weight:400;  font-family: 'Pacifico', cursive;">#PARTYCODE</div></a> -->
           <a href="${pageContext.request.contextPath }"><div style="color:white; font-size:65px; margin-top:50px; font-weight:400;  font-family:'Noto Serif Display', serif;">#PARTYCODE</div></a> 
            <!-- <a href="#"><div style="color:white; font-size:65px; margin-top:50px; font-weight:400;  font-family:'Zen Antique', serif;">#PARTYCODE</div></a> -->
        </div>
        <div class="right"><!--오른쪽-->
            <div >
                <nav class="right_menu">
                    <ul class="right_btn">
                        <li><a href="${pageContext.request.contextPath }/users/profile?id=${users.id}"><small>MyPage</small></a></li>
                        <li><a href="${pageContext.request.contextPath }/users/profile?id=${users.id}"><small><img src="${pageContext.request.contextPath }/resources/img/like3.png"></small></a></li>
                             
                       
                         <c:choose>
                            <c:when test="${users eq null }">
                        <li><a href="${pageContext.request.contextPath }/users/userLogin" ><small>로그인</small></a></li>
                                    </c:when>
                                    
                                    <c:when test="${users ne null }">    
                         <li><a href="${pageContext.request.contextPath }/users/logout" ><small>로그아웃</small></a></li>     
                            </c:when>  
                             </c:choose> 
                    </ul>
                    <ul class="right_btn2">
                             <li class="uuser"><a><img src="${pageContext.request.contextPath }/resources/img/user.png" /> : ${users.id}</a></li>
                             
                    </ul>
                     <ul class="right_btn3">
                     <li class="mmoney"><a><img src="${pageContext.request.contextPath }/resources/img/포인트.png" /> : ${users.point}</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        </div>
     
                     <div class="leftBar" style="margin-top:50px; margin-bottom: 50px;" >
        <div class="leftBarcontainer" >
            
        
           	<div class="sidede" style="width:1200px;"  >
            <div id="sideicon" class="plus_icon">
            <a href="${pageContext.request.contextPath }/partyboard/party_regist"><img  src="${pageContext.request.contextPath }/resources/img/white_plus.png" alt="" 
            onmouseover='this.src="${pageContext.request.contextPath }/resources/img/update_t.png"' 
            onmouseout='this.src="${pageContext.request.contextPath }/resources/img/white_plus.png"' 
            style="width: 40px; height: 40px;" ></a>
            </div>
            <div id="sideicon" class="review_icon">
            <a href="${pageContext.request.contextPath }/board/notice"><img  src="${pageContext.request.contextPath }/resources/img/white_review.png" alt=""
            onmouseover='this.src="${pageContext.request.contextPath }/resources/img/gonji_t.png"' 
            onmouseout='this.src="${pageContext.request.contextPath }/resources/img/white_review.png"' 
            style="width: 40px; height: 40px;" ></a>         
            </div>
             <div id="sideicon" class="review_icon">
            <a href="${pageContext.request.contextPath }/boughtthis/myparty?id=${users.id}"><img  src="${pageContext.request.contextPath }/resources/img/ibt_w.png" alt=""
        
            style="width: 40px; height: 40px;" ></a>         
            </div>
            <div id="sideicon" class="profile_icon">
            <a href="${pageContext.request.contextPath }/users/profile?id=${users.id}"><img src="${pageContext.request.contextPath }/resources/img/white_profile.png" alt=""
            onmouseover='this.src="${pageContext.request.contextPath }/resources/img/profile_t.png"' 
            onmouseout='this.src="${pageContext.request.contextPath }/resources/img/white_profile.png"' 
            style="width: 40px; height: 40px;" ></a>
            </div>
            <div id="sideicon" class="home_icon">
            <a href="${pageContext.request.contextPath }/partyboard/party_board"><img src="${pageContext.request.contextPath }/resources/img/white_home.png" alt=""
            onmouseover='this.src="${pageContext.request.contextPath }/resources/img/party_t.png"' 
            onmouseout='this.src="${pageContext.request.contextPath }/resources/img/white_home.png"' 
            style="width: 40px; height: 40px;" ></a>
            </div>
           
            <div id="sideicon" class="search_icon">
            <a href="#meModal" data-toggle="modal"><img class="searchModal" src="${pageContext.request.contextPath }/resources/img/white_search.png" alt=""
            onmouseover='this.src="${pageContext.request.contextPath }/resources/img/search_t.png"' 
            onmouseout='this.src="${pageContext.request.contextPath }/resources/img/white_search.png"' 
            style="width: 40px; height: 40px;">
            </a>
            </div>
            
            <%-- <div id="sideicon" class="board_icon"><img src="${pageContext.request.contextPath }/resources/img/white_board.png" alt="" 
            onmouseover='this.src="${pageContext.request.contextPath }/resources/img/gonji_t.png"' 
            onmouseout='this.src="${pageContext.request.contextPath }/resources/img/white_board.png"' 
            style="width: 40px; height: 40px;">
            <a class="sideicon2" onclick="location.href='${pageContext.request.contextPath }/users/updateprofile'">profile update</a>
            </div>  --%>
            <div id="sideicon" class="qna_icon">
            <a href="${pageContext.request.contextPath }/board/qna_board"><img src="${pageContext.request.contextPath }/resources/img/white_qna.png" alt="" 
            onmouseover='this.src="${pageContext.request.contextPath }/resources/img/qna_T.png"' 
            onmouseout='this.src="${pageContext.request.contextPath }/resources/img/white_qna.png"' 
            style="width: 40px; height: 40px;" ></a>
            
            </div>
            <div id="sideicon" class="point_icon">
            <a href="${pageContext.request.contextPath }/users/pay"><img src="${pageContext.request.contextPath }/resources/img/white_point.png" alt="" 
            onmouseover='this.src="${pageContext.request.contextPath }/resources/img/point_t.png"' 
            onmouseout='this.src="${pageContext.request.contextPath }/resources/img/white_point.png"' 
            style="width: 40px; height: 40px;" ></a>
            
            </div>
            <c:if test="${users.id =='admin'}">
              <div id="sideicon" class="point_icon">
            <a href="${pageContext.request.contextPath }/admin"><img src="${pageContext.request.contextPath }/resources/img/admin_users_w.png" alt="" 
   
            style="width: 40px; height: 40px;" ></a>
            
            </div>
            </c:if>
            </div>

            </div>
            
        </div>
        
       
    </div>
</div>

 <div class="modal fade" id="meModal"  tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true" style="height:1200px;">
  
    <div class="modal-dialog"  >
      <div class="modal-content" style="overflow:scroll; width:1200px; height:1200px; margin-left:-400px; ">
             <div class="modal-wrap">
             
               <input type="text" style="width:250px; height:38px;" class="search-input" id="searchName" name="searchName" >
                  
                         <button type="button" id="searchbtn"  class="btn" style="width:100px;"><i class="fas fa-search"></i></button>
                      
               <div id="user_wrap" style="height:200px;">
             
             
             
               
               </div>
               
               <hr>
             
                <div id="party_wrap" style="height:200px;">
                
               
                
                </div>
              </div>
              <div style="height:200px;"></div>
             <div  style="positon:absolute; left:0px; top:60%;" >  <button type="submit" class="btn btn-primary btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
   </div>
        </div>
        </div>
        </div>
  
              

<script>
$(".main_menu a").mouseover(function() {
    $(".sub_area").css("display","block");
});
$(".main_menu").mouseout(function(){
    $(".sub_area").css("display","none");
});
$(".sub_area").mouseover(function() {
    $(".sub_area").css("display","block");
});
$(".sub_area").mouseout(function(){
    $(".sub_area").css("display","none");
});


/*  $(".sidede").mouseover(function(){
	  $("#sideicon").hide();
	  $(".sideicon2").show();
	
	 });

	 $(".sidede").mouseleave(function(){
	   $("#sideicon").show();
	   $(".sideicon2").hide();
	 });
 */
	  
/* 	 
	 $(".sidede").mouseover(function(){
		$(".searchModal").hide();
		$(".aModal").show();
	
	 });

	 $(".sidede").mouseout(function(){
		 $("#searchModal").show();
		 $(".aModal").hide();
		 }); */
</script>
<script>

function filter(){

    var search,name,thumbnail,i;
    value = document.getElementById("search").value.toUpperCase();
    item = document.getElementsByClassName("thumbnail");
    
    for(i=0;i<item.length;i++){
        name=item[i].getElementsByClassName("img");
        if(name[0].innerHTML.toUpperCase().indexOf(value)>-1){
            itme[i].style.display ="flex";

        }else{
            item[i].style.display="none";
        }
    }
}


</script>

         
        <script>    
              function filter(){

    var search,name,thumbnail,i;
    value = document.getElementById("search").value.toUpperCase();
    item = document.getElementsByClassName("thumbnail");
    
    for(i=0;i<item.length;i++){
        name=item[i].getElementsByClassName("img");
        if(name[0].innerHTML.toUpperCase().indexOf(value)>-1){
            itme[i].style.display ="flex";

        }else{
            item[i].style.display="none";
        }
    }
}
              </script>   
              
              
<script>

$('#searchbtn').click(function(){
var searchName =$("#searchName").val();
	
	console.log("아야야");
	str="";
	
	$.ajax({
		url:'/partycode/users/getusers',
		type:"post",
		data:JSON.stringify({"searchName": searchName }),
		contentType:"application/json; charset=UTF-8;",
		success:function(result){
			console.log(result);
			console.log(result.length);
			 str+='<div>유저검색 결과('+result.length+'건)</div><br><br>';
				
			 
			 
			for(var i=0; i<result.length; i++){
				
				str+='<a href='+'/partycode/users/othersprofile?id='+result[i].id+'><img style="width:70px; height:70px; border-radius:70%;" src="display/'+result[i].fileloca+"/"+result[i].filename +'"></a>';
				str+='<div style="display:inline;">'+result[i].id +'</div>'
				
			}
			$("#user_wrap").html(str);
		        getparty();
			    
			
		},
		error:function(error){
			console.log(data);
		}
		
	});
		
})

</script>



<script>
function getparty(){
	var searchName =$("#searchName").val();
	console.log("아아아아")
	str="";
	$.ajax({
		url:'/partycode/partyboard/getparty',
		type:"post",
		data:JSON.stringify({"searchName":searchName}),
		contentType:"application/json; charset=UTF-8;",
		success:function(result){
			console.log(result)
			      str+='<div>파티 검색 결과(<font color="red"><b>'+result.length+'</b></font>건)</div><br><br>'
			      
			    	
			     
				for(var i=0; i<result.length; i++){
					str+='<div style="display:inline-block; width:120px; height:120px;">'
					str+='<a href='+'/partycode/partyboard/party_detail?pno='+result[i].pno+' ><img   style="width:100px; height:100px;" src="display/'+result[i].fileloca+"/"+result[i].filename +'"></a>';
					str+='<div >'+result[i].ptitle+'</div>'
					str+='</div>'
				}
				$("#party_wrap").html(str);
			}
		});
	}


</script>