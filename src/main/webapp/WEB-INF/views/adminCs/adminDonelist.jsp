<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
  <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
  <!--개인 디자인 추가-->
  <link href="${pageContext.request.contextPath }/resources/css/admin.css" rel="stylesheet">


<style>
  .admin_common .common_footer .txt_mail {margin: 0; padding: 4px 12px;}

</style>
</head>

<body>
    <%@ include file="../include/admin_menubar.jsp" %>

  <section>
    <div class="admin_common">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="common">

              <div class="common_title">
                <h2>CUSTOMER SERVICE<small style="margin-left: 20px;"></small></h2>
              </div>
              <form>
                <div class="common_header">
                  <div>
                    <button class="btn btn-default" type="submit">
                      <i class="glyphicon glyphicon-search"></i>
                    </button>
                  </div>
                  <div class="common_search">
                    <input type="text" class="form-control" placeholder="Search...">
                  </div>

                  <div class="common_search_type">
                    <select class="form-control ">
                      <option value="title">title</option>
                      <option value="content">content</option>
                      <option value="writer">writer</option>
                    </select>
                  </div>
                  <div class="common_length">
                    <select class="form-control ">
                      <option value="10">10개씩 보기</option>
                      <option value="25">20개씩 보기</option>
                      <option value="50">30개씩 보기</option>
                    </select>
                  </div>
                </div>
              </form>

              <div class="common_table">
                <table class="table table-bordered " id="admin_common_table">
                  <thead>
                    <!-- 전체선택기능 넣어야 함 -->
                    <tr>
                      <th style="width: 30px;"><input type="checkbox" id="check-all" class="flat"></th>
                      <th>지역</th>
                      <th>제목</th>
                      <th>참여인원</th>
                      <th>개최일</th>
                      <th>신청자</th>
                      <th>연락처</th>
                    </tr>
                  </thead>

                  <tbody>
                    <tr>
                      <th><input type="checkbox" class="flat"></th>
                      <td>안양</td>
                      <td>클럽 '헤븐' 리뉴얼 오픈 파티</td>
                      <td>50명</td>
                      <td>22-02-10</td>
                      <td>홍길동</td>
                      <td>010-1111-1234</td>
                    </tr>

                    <tr class="detail">
                      <th><input type="checkbox" class="flat"></th>
                      <td>서울</td>
                      <td>와인 시음회 론칭파티</td>
                      <td>30명</td>
                      <td>22-02-10</td>
                      <td>홍길동</td>
                      <td>010-1111-1234</td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <div class="common_footer">
                <button type="button" class="txt_mail"><img src="img/mail.png">선택문자발송</button>
              </div>

            </div>
          </div>
        </div>
      </div>
      <!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
  </section>

 


</body>

</html>