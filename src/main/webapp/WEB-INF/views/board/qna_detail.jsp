<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>QnA 상세보기 | Partycode</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
<style>


            .qna_form_type {height:40px;}
            .qna_form_type input {border:none;}
            .form-title input { width: 400px; margin-bottom: 10px;padding: 5px 10px; display: inline;border:none;}
            .form-content textarea{ width: 512px; height:200px; margin-top:20px; padding: 10px;}
            .form-answer textarea{ width: 512px; height:200px; margin-top:20px; padding: 10px; border:2px cornflowerblue solid;}
            .qna_form_area {display: block; margin: 0 auto; width: 600px;}
            .qna_form_area div {margin:30px;}
            .users_footer {float: right; padding-right: 5px; margin: 40px 0;}
            .users_footer button {cursor: pointer;border:none; padding: 6px 12px;border-radius: 4px;}
            .type {background-color:cornflowerblue; color:#fff;padding: 6px 12px;border-radius: 4px; width:58px}
            .form-id {border:none; margin:10px;}
            
            .qna_table {width:800px; margin:30px auto;}
            .table-bordered>thead>tr>th {text-align: center;}

</style>
</head>
<body>
    <div class="qna_area">
            
        <div class="qna_form_area">

                <div class="qna_form_type">
                    <input class="type" name="category" value="${qvo.category }">
                </div>
                
                <div>
                    <label>작성자 : </label>
					<input class="form-id" name='id' value="${qvo.id }" readonly>
                </div>

                <div class="form-title">
                    <label>제목 : </label>
                    <input class="form-title" name='qtitle' value="${qvo.qtitle }" readonly>                    
                </div>
                <div class="form-content">
                    <label>문의내용 : </label>
                    <textarea class="form-content" cols="10" id="form-content" name="qcontent"
                        rows="5" >${qvo.qcontent }</textarea>
                </div>
                <div class="form-answer">
                    <label>답변 : </label>
                    <textarea class="form-answer" cols="10" id="form-answer" rows="5" >${qvo.answer }</textarea>
                </div>
                
                <div class="users_footer">
                <c:if test="${users.id == qvo.id }">
                    <button type="button" class="btn btn_delete" onclick="location.href='qna_delete?qno=${qvo.qno}&id=${qvo.id }'">삭제</button>
                    </c:if>
                    <button type="button" class="btn btn_close" onclick="window.close()">닫기</button>
                </div>
            
        </div>  
    </div>
</body>
</html>