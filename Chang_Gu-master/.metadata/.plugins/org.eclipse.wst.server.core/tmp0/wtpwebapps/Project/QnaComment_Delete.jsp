<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./saCss/saCss.css">
</head>

<body>
<img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">
	<div id="buttons">
		<ul>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='review_list.jsp'">후기</li>
		</ul>
	</div>
<div class="test_list" style="margin-top: 10%;">
<form action="QnaComment_Delete_Servlet" method="post">

<input type="password" name="qna_comment_password" placeholder="비밀번호를 입력하세요.">
<input type="hidden" name="qna_comment_number" value="<%=request.getParameter("qna_comment_number")%>">
<button type="submit">삭제하기</button><br>

</form>

<button type="button" onclick="location.href=;Qna_List.jsp;">취소하기</button>
</div>
</body>
</html>