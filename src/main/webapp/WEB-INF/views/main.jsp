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


    <!-- 부트스트랩 css 사용 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jqueryIMPORTANT.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/main2.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main2.css">
  
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Candal&display=swap" rel="stylesheet">
 
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&family=Pacifico&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Zen+Antique&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Display:wght@500&display=swap" rel="stylesheet">
</head>

<body id="bobody">

<div style="position:absolute; left:1000px; top:500px; font-family:'Noto Serif Display', serif; font-size:120px;">
PARTYCODE</div>
    <div id="menu" class="mme">

        <div class="head" style="position:relative; font-size:80px; font-family:'Noto Serif Display', serif;" >SNS
        </div>
            <div class="menu-inner">
                
                    <div class="container-3">
                        
                        <div class="row">

                            <div id="myCarousel" class="carousel slide" data-ride="carousel" >
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                  <li data-target="#myCarousel" data-slide-to="1"></li>
                                  <li data-target="#myCarousel" data-slide-to="2"></li>
                                </ol>
                            
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">
                                  <div class="item active">
                                    <img id="mmig" src="" alt="New York" width="100%" height="100%">
                                    <div class="carousel-caption">
                                      <h3></h3>
                                      <p></p>
                                    </div>      
                                  </div>
                            
                                  <div class="item">
                                    <img id="mmig" src="" alt="Chicago" width="600" height="800">
                                    <div class="carousel-caption">
                                      <h3></h3>
                                      <p></p>
                                    </div>      
                                  </div>
                                
                                  <div class="item">
                                    <img id="mmig" src="" alt="Los Angeles" width="600" height="800">
                                    <div class="carousel-caption">
                                      <h3></h3>
                                      <p></p>
                                    </div>      
                                  </div>
                                </div>
                            
                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="users/profile?id=${users.id }" role="button" data-slide="next">
                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                                </a>
                        
                            </div>
                            <!-- <div class="u1">
                                <img class="ch1" src="img/테스트이미지.jpg">
                                <a href="#"><p class="txt1" >Update</p></a>    
                            </div>
                            <div class="u2">
                                <img class="ch2" src="img/테스트이미지.jpg">
                                <a href="#"><p class="txt2" >Test</p></a> 
                            </div>
                            <div class="u3">
                                <img class="ch3" src="img/테스트이미지.jpg">
                                <a href="#"><p class="txt3" >Test</p></a> 
                            </div>
                            <div class="u4">
                                <img class="ch4" src="img/테스트이미지.jpg">
                                <a href="#"><p class="txt4" >Test</p></a> 
                            </div> -->
                        
                        </div>
                    </div>
            </div>   

        </div>

    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</body>

<body>
    <div id="menu_r">

        <div class="menu-inner_r">
            
            
            <div class="head_r" style="font-family:'Noto Serif Display', serif;"><a href="${pageContext.request.contextPath }/partyboard/party_board">Party</a></div>
          
                
                <div class="container_r">
                    
                    <div id="MyCarousel" class="carousel slide casl" data-ride="carousel" >
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                          <li data-target="#myCarousel" data-slide-to="1"></li>
                          <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>
                    
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox"> 
                          <div class="item active">
                            <img id="mig" src="" alt="New York" width="100%" height="100%" >
                            <div class="carousel-caption">
                              <h3>New York</h3>
                              <p>The atmosphere in New York is lorem ipsum.</p>
                            </div>      
                          </div>
                    
                          <div class="item">
                            <img id="mig" src="" alt="Chicago" width="600" height="800">
                            <div class="carousel-caption">
                              <h3>Chicago</h3>
                              <p>Thank you, Chicago - A night we won't forget.</p>
                            </div>      
                          </div>
                        
                          <div class="item">
                            <img id="mig" src="" alt="Los Angeles" width="600" height="800">
                            <div class="carousel-caption">
                              <h3>LA</h3>
                              <p>Even though the traffic was a mess, we had the best time playing at Venice Beach!</p>
                            </div>      
                          </div>
                        </div>
                    
                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#MyCarousel" role="button" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                          <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#MyCarousel" role="button" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                          <span class="sr-only">Next</span>
                        </a>
                
                    </div>
 
                </div>
                
            </div>
            
        </div>

</body>
</html>