<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의작성 성공</title>
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
	
	<h3 style="text-align:center;">문의글이 게시되었습니다.</h3>
	<div id="whitebox">


<h4>문의글 정보 : </h4>
<p> 문의 제목 : <%= session.getAttribute("qna_title")%></p>
<p> 문의 내용 : <%= session.getAttribute("qna_content")%></p>
<p> 작성자 : <%= session.getAttribute("qna_name")%></p>
<p> 비밀번호 : <%= session.getAttribute("qna_password")%></p>
<p> 작성일 : <%=session.getAttribute("qna_date") %></p>
<p> 이메일 : <%= session.getAttribute("qna_email")%></p>

<button type="button" onclick="location.href='Qna_List.jsp'">돌아가기</button>
</body>
</html>