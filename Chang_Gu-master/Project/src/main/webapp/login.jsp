<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>GO, FESTIVAL 예약조회</title>
<link rel="stylesheet" href="./hjCss/main.css">
<link rel="stylesheet" href="./hjCss/reservationSearchInfo.css">
<style>
.alink{
	text-align: center;  text-decoration: none;
	  color: inherit;
	      margin: 0px 29px 0px 40px;
	  }
</style>
</head>

<body>
	<!-- 이미지 로고 -->
	<img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">

	<!--로그인 버튼-->
	 <div style="text-align: right; width: 1215px;">
    <%
    if(session.getAttribute("email")!=null){
    %>
	 	<button type="button" onclick="location.href='logout.jsp'" style="background:none;border:none;width:75px;">로그아웃</button>
	 	 <h>|</h>
	    <button type="button" onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'" style="background:none;border:none;width:100px;">마이페이지</button>
	 <%
	 }else{
	 %>
		 <button type="button" onclick="location.href='login.jsp'" style="background:none;border:none;width:60px;">로그인</button>
		 <h>|</h>
	    <button type="button" onclick="location.href='join.jsp'" style="background:none;border:none;width:100px;">회원가입</button>
	  <%
	  }
	  %>

		<!-- 메뉴바 -->
		<div id="buttons">
			<ul>
				<li id="menu" onclick="location.href='review_list.jsp'">후기</li>
				<li id="menu" onclick="location.href='Qna_List.jsp'">QNA</li>
				<li id="menu" onclick="location.href='reservation_search.jsp'">예약조회</li>
				<li id="menu" onclick="location.href='Event_List.jsp'">행사정보</li>
			</ul>
		</div>


		<div id="background">
					<h2 style="padding-top:15px">로그인</h2>
			<div id="reviewbox">
				<!-- 예약정보 조회란 -->
				<div id="r_search">
					<form action="loginServlet" method="post">
				<label for="email">이메일</label> &nbsp;&nbsp;
				<input type="email" id="email" name="email" class="size" required><br>
				<label for="password">비밀번호</label>
				<input type="password" id="password" name="password" class="size" required><br>
				<input type="submit" value="로그인"><br>
			</form>
				<br><a href="findEmail.jsp" class="alink">이메일 찾기</a> 
				<a href="findPassword.jsp" class="alink">비밀번호 찾기</a>
				</div>
			</div>
		</div>
</body>
</html>