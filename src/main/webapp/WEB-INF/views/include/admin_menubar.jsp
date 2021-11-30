<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <header class="side_wrap">
    <nav>
      <div class="admin_menubar">
        <ul>
          <div class="menubar_img"> 
            <li>
            	<a href="/partycode" target="_blank"><img src="${pageContext.request.contextPath }/resources/img/admin_logo.png" 
            		style="padding: 50px 0px;"></a></li>
          </div>
          <div class="menu">

            <li>
              <a href="/partycode/admin">
                <img src="${pageContext.request.contextPath }/resources/img/admin_dashboard.png">DASHBOARD
              </a>
            </li>

            <li class="drop_menu">
              <a href="#">
                  <img src="${pageContext.request.contextPath }/resources/img/admin_users_w.png">USERS
              </a>
              <ul class="drop " >
                <li><a href="/partycode/admin/users/inquiryList"><img src="${pageContext.request.contextPath }/resources/img/admin_person_search.png">고객조회</a></li>
                <li><a href="/partycode/admin/users/updateList"><img src="${pageContext.request.contextPath }/resources/img/admin_person_edit.png">고객수정/삭제</a></li>
              </ul>
            </li>
            
            <li class="drop_menu">
              <a href="#">
                <img src="${pageContext.request.contextPath }/resources/img/admin_customer_service.png">CUSTOMER SERVICE
              </a>
              <ul class="drop " >
                <li><a href="/partycode/admin/notice/list"><img src="${pageContext.request.contextPath }/resources/img/admin_notice.png">NOTICE</a></li>
                <li><a href="/partycode/adminCs/adminApproval"><img src="${pageContext.request.contextPath }/resources/img/admin_approval3.png">신청/승인</a></li>
                <li><a href="/partycode/admin/adminqna/list"><img src="${pageContext.request.contextPath }/resources/img/admin_qna.png">FAQ QNA</a></li>
              </ul>
            </li>
            
            <li>
              <a href="/partycode/admin/pointlog">
                <img src="${pageContext.request.contextPath }/resources/img/admin_point_log.png">POINT LOG
              </a>
            </li>

          </div>
        </ul>
      </div>
    </nav>
  </header>  

  <script>
    $(".drop_menu").click(function() {
      // event.preventDefault(); //기본이벤트
      $(".drop_on").removeClass("drop_on");
      $(this).children(".drop").toggleClass("drop_on"); // toggleClass: 있으면 넣고 없으면 빼는 메서드
    })
  </script>

  