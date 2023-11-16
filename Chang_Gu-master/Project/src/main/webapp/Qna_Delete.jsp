<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sa_event.Qna" %>
<%@ page import="sa_event.QnaDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 삭제하기</title>
<link rel="stylesheet" href="./saCss/saCss.css">
</head>
<body>
<img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">
 <!--로그인 버튼-->
    <div style="text-align: right; width: 1215px;">
    <%
    	if(session.getAttribute("email")!=null){
    %>
	 	<button type="button" onclick="location.href='logout.jsp'" style="width:75px;">로그아웃</button>
	 	 <h>|</h>
	    <button type="button" onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'" style="width:100px;">마이페이지</button>
	 <%
    	}else{
	 %>
		 <button type="button" onclick="location.href='login.jsp'" style="width:60px;">로그인</button>
		 <h>|</h>
	    <button type="button" onclick="location.href='join.jsp'" style="width:100px;">회원가입</button>
	  <%
    	}
	  %>
	    
	</div>
<div id="buttons">
		<ul>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='review_list.jsp'">후기</li>
		</ul>
	</div>
	
<div id="background">
<h3 style="text-align:center;">문의 삭제</h3>

<table>
<tr>
	<th style="text-align:center;" >문의번호</th>
	<th style="text-align:center;">이름</th>
</tr>

<tr>
	<td style="text-align:center;"><%=session.getAttribute("qna_number") %></td>
	<td style="text-align:center;"><%=session.getAttribute("qna_name") %></td>
</tr>
</table>

<br><br><br>

<div class="qnadeleteBox">
<form action="QnaDeleteServlet" method="post">
<label for="qna_password" style="text-align:center;">비밀번호를 입력해주세요.</label><br>
<input type="password" name="qna_password" name="qna_password" required style="text-align:center; width: 200px; height: 30px; border-radius: 5px;">
<input type="hidden" id="qna_number" name="qna_number" value="<%=session.getAttribute("qna_number") %>">
<input type="submit" value="삭제" style="width: 85px; height: 34px; border-radius: 5px;" onclick="location.href='Qna_List.jsp'">

</form>
</div>
</div>
</body>
</html>