<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" 	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link rel="stylesheet" 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
.container {
	text-align: center;
}

.card1 {
	width: 500px;
	margin: 0 auto;
}

.container #presentpoint {
	text-align: right;
}
</style>
<title>Point Charge</title>
</head>
<body>
	<div class="container" style="float: none; margin: 0 auto">
		<div class="card1">
			<h3>
				<strong>Point Charge</strong>
			</h3>
			<br>
			<br>
			<p id="presentpoint">${users.id }님의현재 포인트 : ${users.point}</p>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" onclick="clickpay('${users.point}')">
				<label class="btn btn-danger"> <input type="radio"name="jb-radio" id="jb-radio-1" value="10000"> 1만 Point</label> 
				<label class="btn btn-danger"> <input type="radio" name="jb-radio" id="jb-radio-2" value="20000"> 2만 Point</label>
				<label class="btn btn-danger"> <input type="radio"name="jb-radio" id="jb-radio-3" value="50000"> 5만 Point</label>
			</div>
			<p></p>

			<p id="updatepoint">
				${users.point } + [<span></span>] =	<font color="red">final.point</font>
			<div>
				<button type="button" class="btn btn-warning" id="point_charge" onclick="requestPay('${users}', '${users.point}')">결 제</button>
			</div>
			<br>
</body>

<script>
function clickpay(point){
	if(event.target.tagName != "INPUT") return;
	
	var money = event.target.value;
	document.querySelector("#updatepoint > span").innerHTML = money;
	document.querySelector("#updatepoint > font").innerHTML = (parseInt(point) + parseInt(money));
}
</script>

<script>
	function requestPay(user, point) {	
		if(user == 'undefined' || user == null) {
			alert("로그인이 필요한 서비스입니다"); 
			return;
		} else if(point == 'undefined') {
			alert("금액을 선택해주세요");
			return;
		}
					
		var IMP=window.IMP;
		IMP.init("imp76198369"); //가맹점코드(CID)
		var money=$('input[name="jb-radio"]:checked').val()/100;
 		var purchaser='${users.id}';
	
		console.log(money);
		
	      // IMP.request_pay(param, callback) 결제창 호출
	      IMP.request_pay({ // param
	          pg: "smilepay",
	          pay_method: "card",
	          merchant_uid: "ORDpoint"+new Date().getTime(),
	          name: "충전금액",
	          amount: money,
 	          buyer_name: purchaser
	      }
	      , function (rsp) { // callback
	    	  console.log(rsp);
	      	  console.log(rsp.success);
	        if (rsp.success) {
	        	//우리 데이터베이스에 insert해주는 작업  
	        	$.ajax({
                    type: "POST", 
                    url: "/partycode/users/chargepoint", //충전 금액값을 보낼 url 설정
                    data:JSON.stringify({"point": rsp.paid_amount ,"id":"${users.id}","uno":"${users.uno}","remainpoint":"${users.point}"}),
                    contentType:"application/json; charset=UTF-8;"
                });
	        	alert(money*100+"포인트를 충전하였습니다.");
	        	let url = '../partyboard/party_board';
	        	location.replace(url);
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}   
		});
	}
</script>
</html>