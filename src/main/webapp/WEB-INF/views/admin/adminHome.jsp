<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DASHBOARD</title>
	
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
		rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
	
	<!--개인 디자인 추가-->
	<link href="${pageContext.request.contextPath }/resources/css/admin.css"
		rel="stylesheet">
	<%-- <script src="${pageContext.request.contextPath }/resources/js/admin.js"></script> --%>
	
	<script>
		
		$(document).ready(function(){
			  let doughnutChart = document.getElementById('doughnutChart').getContext('2d');
			  let topCategory = new Chart(doughnutChart, {
				  type: 'doughnut', 
				  data: {
				    labels: [
				      "Symbian",
				      "Blackberry",
				      "Other",
				      "Android",
				      "IOS"
				    ],
				    datasets: [{
				      label: '가나다',
				      data: [
				  /*    
				  		35,
				        30,
				        20,
				        10,
				   */
				      ],
				      backgroundColor: [
				        "#BDC3C7",
				        "#9B59B6",
				        "#E74C3C",
				        "#26B99A",
				        "#3498DB"
				      ],
				      hoverBackgroundColor: [
				        "#CFD4D8",
				        "#B370CF",
				        "#E95E4F",
				        "#36CAAB",
				        "#49A9EA"
				      ]
				    }]
				  },
				  options: { 
				      legend: false, 
				      responsive: false 
				    }
	
				  });


			  
			  topCategory.config.data.labels[0] = "<c:out value='${themeList[0].ptheme}' />";
			  topCategory.config.data.labels[1] = "<c:out value='${themeList[1].ptheme}' />";
			  topCategory.config.data.labels[2] = "<c:out value='${themeList[2].ptheme}' />";
			  topCategory.config.data.labels[3] = "<c:out value='${themeList[3].ptheme}' />";
			  topCategory.config.data.labels[4] = "<c:out value='${themeList[4].ptheme}' />";
			  topCategory.config.data.datasets[0].data = ["<c:out value='${themeList[0].percent}' />"
				  										, "<c:out value='${themeList[1].percent}' />"
				  										, "<c:out value='${themeList[2].percent}' />"
				  										, "<c:out value='${themeList[3].percent}' />"
				  										, "<c:out value='${themeList[4].percent}' />"] ;
			  topCategory.update(); 
			  
			
		});
		
	</script>
</head>
  <%-- <c:out value='${themeList[0].ptheme}' />
			  <c:forEach var="i" begin="0" end="4" >
			  	topCategory.config.data.labels[i] = <c:out value='${themeList["i"].ptheme}' />;
			  </c:forEach> --%> 
<body>
	<%@ include file="../include/admin_menubar.jsp"%>


	<section class="admin_dashboard">
		<div class="container">
			<div class="row">

				<div class="col-xs-12">
					<div class="admin_dashboard_top">
						<div class="total_number">
							<div class="col-xs-3 total_number_list">
								<span><i class="glyphicon glyphicon-user"></i> 전체 사용자</span>
								<div class="count">${homeCount.totalusers}</div>
								<span class="thisweek"><span>${homeCount.usersgrowth}% </span>From last Week</span>
							</div>
							<div class="col-xs-3 total_number_list">
								<span><i class="glyphicon glyphicon-heart"></i> 총 좋아요</span>
								<div class="count">${homeCount.totallike}</div>
								<span class="thisweek"><span>${homeCount.likegrowth}% </span>From last Week</span>
							</div>
							<div class="col-xs-3 total_number_list">
								<span><i class="glyphicon glyphicon-glass"></i> 모금중 개인파티</span>
								<div class="count">${homeCount.ingfundrasing}</div>
								<span class="thisweek"></span>
							</div>

							<div class="col-xs-3 total_number_list">
								<span><i class="glyphicon glyphicon-check"></i> 종료된 개인파티</span>
								<div class="count">${homeCount.endfundrasing}</div>
								<span class="thisweek"><span>${homeCount.fingrowth}% </span>From last Week</span>
							</div>

						</div>
					</div>
				</div>

				<div class="col-md-6 col-xs-12">
					<div class="admin_dashboard_top_private">
						<div class="top_party">
							<div class="title">
								<span>Top Private Party</span>
							</div>

							<div class="progress_table">
							
								<c:forEach var="privatevo" items="${homeTopPrivate }">
									<div class="progress_wrap">
										<div class="topfive">
											<a href="/partycode/partyboard/party_detail?pno=${privatevo.pno }"
												style="color:black">
												<span>${fn:substring(privatevo.ptitle, 0, 12)}...</span>
											</a>
										</div>
										<div class="progress">
											<c:choose >
												<c:when test="${privatevo.fundpercent >=100}">
													<div class="progress-bar" role="progressbar"
														aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
														style="width: 100%">100%</div>
												</c:when>
												<c:otherwise>
													<div class="progress-bar" role="progressbar"
														aria-valuenow="${privatevo.fundpercent }" aria-valuemin="0" aria-valuemax="100"
														style="width: ${privatevo.fundpercent }%">${privatevo.fundpercent }%</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
								
							</div>

						</div>

					</div>
				</div>
				
				<div class="col-md-5">
					<div class="admin_dashboard_pop_theme">
						<div class="pop_theme">
							<div class="title">
								<span>Popular Category</span>
							</div>

							<div class="progress_table">
								<table style="width: 100%">
									<tr>
										<th style="width: 45%;">
											<canvas id="doughnutChart" height="170" width="170"
												style="margin: 0"></canvas>
										</th>
										<th>
											<table class="table_info" style="width: 100%;">
												<th>
													<div class="">
														<p class="">Category</p>
													</div>
												</th>
												<th style="width: 40%;">
													<div class="">
														<p class="">percentage</p>
													</div>
												</th>
												<c:forEach var="list" items="${themeList }">
													<tr>
														<td><span></span>
															<p>${list.ptheme }</p></td>
														<td>${list.percent }</td>
													</tr>
												</c:forEach>

											</table>
										</th>
									</tr>
								</table>
							</div>

						</div>
					</div>
				</div>

				<div class="col-md-5">
					<div class="admin_dashboard_recent_activities">
						<div class="re_activ">
							<div class="title">
								<span>Recent Party</span>
							</div>
							<div class="re_activ_content">
								<ul class="re_activ_content_list">
								
									<c:forEach var="rcentp" items="${recentParty }">
										<li>
											<div class="re_activ_content_list_box">
												<div class="">
													<div class="box_title">
														<h4 class="">
															<a>${rcentp.ptitle}</a>
														</h4>
													</div>
													<div class="box_status">
														<span>${rcentp.hago } hours ago</span> by <a>${rcentp.pid }</a>
													</div>
													<div class="box_content">
														<p class="">
															${rcentp.pment } <a href="/partycode/partyboard/party_detail?pno=${rcentp.pno }">더보기..</a>
														</p>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="admin_dashboard_notice">
						<div class="notice">
							<div class="title">
								<span>Notice </span>
							</div>
							<div class="notice_content">
								<table class="table" width="100%">
									<thead>
										<tr>
											<th width="10%"></th>
											<th>제목</th>
											<th>시간</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="noti" items="${notice }" >
											<tr>
												<th scope="row">${noti.nno }</th>
												<td><a href="admin/notice/detail?nno=${noti.nno }"
														style="color:black">
														[${noti.category }] ${noti.ntitle }</a>
												</td>
												<td>${noti.regdate }</td>
											</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

</body>
</html>
