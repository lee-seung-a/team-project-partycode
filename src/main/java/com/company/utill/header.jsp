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
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
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


        .header .top {position: relative;  background-color: rgba(0, 0, 0, 0);}
        .header .top :hover {background-color: rgba(0, 0, 0, 0);}

        .header .left {position: absolute; top:0; left:0;}
        .left .left_btn {overflow: hidden;}
        .left .left_btn li {display: inline; float: left; margin: 5px;}
        .left .left_btn li a { color: rgb(215, 215, 215); }
        .left .left_btn li :hover { color: #fff; }
        .left .left_btn img {clear: both; width: 12px;}

        .header .right {position: absolute; top:0; right: 0;}
        .right .right_btn {overflow: hidden;}
        .right .right_btn li {display: inline;}
        .right .right_btn li a {float: right; color: rgb(215, 215, 215);; margin: 5px;}
        .right .right_btn li :hover { color: #fff; }
        .right .right_btn img {clear: both; width: 16px; opacity: 0.6;}
        .right .right_btn img :hover {opacity: 1;}


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
   #sideicon{
   display:inline;}
  .leftBarcontainer{
  width:1000px; height:40px;}
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
      border:none;
      outline:none;
      width:80px;
      font-size:1.125rem;
      font-weight: 200;
      background: transparent;
      color:white;
      opacity:0;
      transition: 0.4s;
  }
  .search:hover>.keyword{
      opacity:1;

  }
  .search:hover > select{
      opacity: 1;
  }
  
  
.leftBar {text-align:center; margin:0 auto; width:1000px; height:40px;}

 #sideicon img, .searchModal{width:40px; height:40px; margin:0px 40px;}

.searchModal, #sideicon img:hover{
  transform: scale(1.2,1.2);
  transition: 1.3s;
  cursor:pointer;
  
}
  
    </style>


<div class="header_body">
    <div class="header">
        <div class="top">
         <form class="search">
             <button class="img-button" type="submit" name="click" value="">
                

             </button>
             <input class="keyword" type="text" id="search" name="search" maxlength=255 value="" autocomplete="off"/>
             <select class = "SelectSearch" name="search_category">
                  <option id="allsearch" value="allsearch">전체</option>
                  <option id="searchtitle" value="title">제목</option>
                  <option id="searchcontent" value="content">내용</option>
                  <option id="party_code" value="party_code">#PARTYCODE</option>
                  <option id="writer" value="user_name">작성자</option>
             </select>
         </form>


        <div class="left"><!--왼쪽-->
            <div >
                <nav class="left_menu">
                    <ul class="left_btn">
                        <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/now.png"><small>축제지도</small></a></li>
                        <li><a href="#"><small>메뉴</small></a></li>
                        <li><a href="#"><small>메뉴</small></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="logo">
            <a href="#"><div style="color:white; font-size:80px; margin-top:50px; font-family:'Nanum Pen Script', cursive;">#PARTYCODE</div></a>
        </div>
        <div class="right"><!--오른쪽-->
            <div >
                <nav class="right_menu">
                    <ul class="right_btn">
                        <li><a href="${pageContext.request.contextPath }/users/profile?id=${users.id}"><small>마이페이지</small></a></li>
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
                </nav>
            </div>
        </div>
        </div>
     
                     <div class="leftBar" style="margin-top:50px;">
        <div class="leftBarcontainer">
            
            <div id="sideicon" class="sideicon"><img  src="${pageContext.request.contextPath }/resources/img/글쓰기.png " alt="" onclick="location.href='${pageContext.request.contextPath }/partyboard/party_regist'"></div>
            <div id="sideicon" class="sideicon"><img  src="${pageContext.request.contextPath }/resources/img/heart.png" alt="" onclick="location.href='${pageContext.request.contextPath }/partyboard/review'"></div>
            <div id="sideicon" class="sideicon"><img src="${pageContext.request.contextPath }/resources/img/프로필.png" alt="" onclick="location.href='${pageContext.request.contextPath }/users/profile'"></div>
            <div id="sideicon" class="sideicon"><img src="${pageContext.request.contextPath }/resources/img/메인홈.png" alt="" onclick="location.href='${pageContext.request.contextPath }/'"></div>
            
            <div id="sideicon" class="sideicon"><a href="#meModal" data-toggle="modal"><img class="searchModal" src="${pageContext.request.contextPath }/resources/img/admin_search_w.png" alt=""></a></div>
            <div id="sideicon" class="sideicon"><img src="${pageContext.request.contextPath }/resources/img/게시판.png" alt="" onclick="location.href='${pageContext.request.contextPath }/users/updateprofile'"></div>
            <div id="sideicon" class="sideicon"><img src="${pageContext.request.contextPath }/resources/img/QNA.png" alt="" onclick="location.href='${pageContext.request.contextPath }/board/qna_board'"></div>
            <div id="sideicon" class="sideicon"><img src="${pageContext.request.contextPath }/resources/img/포인트충전.png" alt="" onclick="location.href='${pageContext.request.contextPath }/util/point'"></div>
            
            

            </div>
            
        </div>
        
       
    </div>
</div>

 <div class="modal fade modal2" id="meModal"  tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  
    <div class="modal-dialog">
      <div class="modal-content">
             <div class="modal-wrap">
             
               <input type="text" style="width:250px; height:38px;" class="search-input" id="searchName" name="searchName" >
                   
                         <button type="button" id="searchbtn"  class="btn" style="width:100px;"><i class="fas fa-search"></i></button>
                      
               <div id="user_wrap">
             
             
             
               
               </div>
               
               <hr>
             
                <div id="party_wrap">
                
               
                
                </div>
              </div>
               <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
    
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


  
