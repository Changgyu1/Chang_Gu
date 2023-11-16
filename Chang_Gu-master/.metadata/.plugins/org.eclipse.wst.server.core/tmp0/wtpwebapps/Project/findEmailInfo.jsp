<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="register.event.registerDAO" %>
	<%@ page import="register.event.registerDTO" %>
<!DOCTYPE html>
<html>

<head>
<title>GO, FESTIVAL 예약조회</title>
<link rel="stylesheet" href="./hjCss/main.css">
<link rel="stylesheet" href="./hjCss/reservationSearchInfo.css">
</head>

<body>
	<!-- 이미지 로고 -->
	<img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">

	<!--로그인 버튼-->
	<div style="text-align: right; width: 1215px;">
		<%
		if (session.getAttribute("email") != null) {
		%>
		<button type="button" onclick="location.href='logout.jsp'"
			style="width: 75px;">로그아웃</button>
		<h>|</h>
		<button type="button" onclick="location.href='mypage.jsp'"
			style="width: 100px;">마이페이지</button>
		<%
		} else {
		%>
		<button type="button" onclick="location.href='login.jsp'"
			style="width: 60px;">로그인</button>
		<h>|</h>
		<button type="button" onclick="location.href='register.jsp'"
			style="width: 100px;">회원가입</button>
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

<%
String phonenumber = request.getParameter("phoneNumber");
	registerDAO dao = new registerDAO();
	registerDTO dto = dao.findEmail(phonenumber);
	

	

%>
		<div id="background">
			<h3 style="text-align: center; padding-top: 20px;">예약 조회</h3>
			<div id="reviewbox">
				<!-- 이메일 찾기 -->
				<div id="r_search">
					
						<label for="phoneNumber">회원님의 이메일은</label>  <br>
						<p><%=dto.getEmail()%> 입니다.</p>

						<input type="submit" value="로그인하러가기" onclick="location.href='login.jsp'">
				
				</div>
			</div>
		</div>
</body>
</html>