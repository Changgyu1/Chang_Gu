<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="./hjCss/main.css">
	<link rel="stylesheet" href="./hjCss/reservationCss.css">
</head>
<body>
<div id="wrapper">
    <!--로고이미지-->
    <img src="./image/로고1.png" id="logo">

    <!--로그인 버튼-->
    <div style="text-align: right; width: 1215px;">
    <%
    	if(session.getAttribute("email")!=null){
    %>
	 	<button type="button" onclick="location.href='logout.jsp'" style="width:75px;">로그아웃</button>
	 	 <h>|</h>
	    <button type="button" onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>" style="width:100px;">마이페이지</button>
	 <%
    	}else{
	 %>
		 <button type="button" onclick="location.href='login.jsp'" style="width:60px;">로그인</button>
		 <h>|</h>
	    <button type="button" onclick="location.href='join.jsp'" style="width:100px;">회원가입</button>
	  <%
    	}
	  %>
	
<!-- 메뉴바 -->
  <div id="buttons">
		<ul>
			<li onclick="location.href='review_list.jsp'">후기</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
		</ul>
	</div>
	<!-- 가운데 가장 큰 박스 -->
	<div id="background">
	
		<h2 style="padding-top:15px">로그인</h2>
		<!-- 안에 글넣는 하얀 박스-->
		<div id="reviewbox">
            <form action="loginServlet" method="post">
				<label for="email">이메일</label>
				<input type="email" id="email" name="email" required><br>
				<label for="password">비밀번호</label>
				<input type="password" id="password" name="password" required><br>
				<input type="submit" value="로그인">
			</form>
        </div>
	 </div>
	
</div>
</body>
</html>