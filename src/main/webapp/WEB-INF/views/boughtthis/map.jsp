<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.fasterxml.jackson.databind.util.JSONPObject"%>
<%@page import="com.company.command.PartyBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%!Connection conn = null;
	Statement pstmt = null;
	ResultSet rs = null;
	String uid = "partycode";
	String pwd = "partycode";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String sql = "select ptitle, pdate, plocation2, pno from party where pdate-sysdate>0";
	String title;
	Date date;
	String addr;
	int pno;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>모집중인 파티 | PartyCode</title>
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: black;
	border-bottom: 1px solid black;
	color: #fff;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>

</head>
<body>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bc355c73fb65ee97fd181e062096b93&libraries=services"></script>
	<div id="map" style="width: 100%; height: 1100px;"></div>

	<%
		//List<PartyBoardVO> list = new ArrayList<>();
	JSONArray list = new JSONArray();

	try {
		conn = DriverManager.getConnection(url, uid, pwd);
		pstmt = conn.createStatement();
		rs = pstmt.executeQuery(sql);

		while (rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("pno", String.valueOf(rs.getInt("pno")));
			obj.put("ptitle", rs.getString("ptitle"));
			obj.put("pdate", rs.getString("pdate"));
			obj.put("plocation2", rs.getString("plocation2"));
			list.put(obj);

			//PartyBoardVO vo = new PartyBoardVO();
			//vo.setPno(rs.getInt("pno"));
			//vo.setPtitle(rs.getString("ptitle"));
			//vo.setPdate(rs.getString("pdate"));
			//vo.setPlocation2(rs.getString("plocation2"));
			//list.add(vo);
			//date = rs.getDate(2);
			//addr = rs.getString(3);  
			//pno = rs.getInt(4);
			//System.out.println(title);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null)
		rs.close();
			if (pstmt != null)
		pstmt.close();
			if (conn != null)
		conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//System.out.println(list.toString());
	//JSONObject obj = new JSONObject();
	//obj.put("list", list);

	request.setAttribute("list", list);
	%>
	
	
	
	<script>
		// 자바 데이터
		var list = '${list}';
		list = JSON.parse(list);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37, 128), // 지도의 중심좌표
	        level: 13 // 지도의 확대 레벨
	    };  
		
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		for(let i = 0; i <list.length; i++) {
			
			(function(a) {
				geocoder.addressSearch(list[a].plocation2, function(result, status) {

					var markerPosition  = new kakao.maps.LatLng( parseFloat( result[0].y ) , parseFloat(result[0].x ) );
					var markerImage = new kakao.maps.MarkerImage(imageSrc, new kakao.maps.Size(24, 35));  //마커이미지
					
					var marker = new kakao.maps.Marker({
						map: map,
					    position: markerPosition,
					    title : list[a].ptitle ,
					    image : markerImage // 마커 이미지 
					}); 
					
				});
			
				
			})(i);
			
			for(var j = 0; j < list.length; j++) {
				/* console.log(list[j]) */
			}
			
		}

		
	
		
		
		
		/*
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.427529, 127.014836), // 지도의 중심좌표
			level : 8
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다   

		var positions = [ {
			tit : 'test',
			con : new Date(),
			add : addr 
		} ];

		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			var content = '<div class="wrap">'
					+ '       <div class="info">'
					+ '        <div class="title">'
					+ positions[i].tit
					+ '          <div class="close" onclick="closeOverlay()" title="닫기"></div>'
					+ '        </div>'
					+ '    <div class="body">'
					+ '        <div class="desc">'
					+ '             <div class="ellipsis">'
					+ positions[i].con
					+ '</div>'
					+ '             <div class="ellipsis">'
					+ positions[i].add
					+ '</div>'
					+ '             <div><a href="${pageContext.request.contextPath }/partyboard/party_detail?pno='
					+ pno
					+ '" target="_blank" class="link">참여신청 바로가기</a></div>'
					+ '             </div>' + '        </div>' + '    </div>'
					+ '</div>';

			var geocoder = new kakao.maps.services.Geocoder();

			geocoder.addressSearch(positions[i].add,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 마커 이미지의 이미지 크기 입니다
							var imageSize = new kakao.maps.Size(24, 35);

							// 마커 이미지를 생성합니다    
							var markerImage = new kakao.maps.MarkerImage(
									imageSrc, imageSize);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords,
							});

							// 마커 위에 커스텀오버레이를 표시합니다
							// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
							var overlay = new kakao.maps.CustomOverlay({
								content : content,
								map : map,
								position : marker.getPosition()
							});

							// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
							kakao.maps.event.addListener(marker, 'click',
									function() {
										overlay.setMap(map);
									});
							// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
							function closeOverlay() {
								overlay.setMap(null);
							}

						}

					});
		}
		*/
	</script>


</body>
</html>