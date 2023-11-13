<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="park.event.EventPostingDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 완료</title>
<link rel="stylesheet" href="./css/event.css">
</head>
<body action="EventImageServlet">
	<img src="./image/로고1.png" id="logo">
	<!--로그인 버튼-->
	<div style="text-align: right; width: 1215px;">
		<%
		if (session.getAttribute("email") != null) {
		%>
		<button type="button" onclick="location.href='logout.jsp'"
			style="width: 75px;">로그아웃</button>
		<h>|</h>
		<button type="button"
			onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'"
			style="width: 100px;">마이페이지</button>
		<%
		} else {
		%>
		<button type="button" onclick="location.href='login.jsp'"
			style="width: 60px;">로그인</button>
		<h>|</h>
		<button type="button" onclick="location.href='join.jsp'"
			style="width: 100px;">회원가입</button>
		<%
		}
		%>

	</div>

	<!-- 메뉴바 -->
	<div id="buttons">
		<ul>
			<li onclick="location.href='review_list.jsp'">후기</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
		</ul>
	</div>

	<div id="background">

		<h3 style="text-align: center;">행사가 게시되었습니다.</h3>
		<div id="whitebox">


			<h4>행사 정보 :</h4>
			<p>
				행사 이름 :
				<%=session.getAttribute("event_name")%></p>
			<p>
				행사 기간 :
				<%=session.getAttribute("event_day")%></p>
			<p>
				행사 시간 :
				<%=session.getAttribute("event_time")%></p>
			<p>
				행사 장소 :
				<%=session.getAttribute("event_location")%></p>
			<p>
				가 격 :
				<%=session.getAttribute("event_price")%></p>
			<p>
				연 령 :
				<%=session.getAttribute("event_age")%></p>
			<p>
				내 용 :
				<%=session.getAttribute("event_explain")%></p>


			<button type="button" onclick="location.href='Event_List.jsp'">돌아가기</button>
</body>
</html>