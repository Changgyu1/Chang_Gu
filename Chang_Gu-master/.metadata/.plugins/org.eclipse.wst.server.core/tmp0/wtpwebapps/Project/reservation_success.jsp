<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%@ page import="park.event.EventPosting"%>
<%@ page import="park.event.EventPostingDAO"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GO, FESTIVAL 예약성공</title>
    <link rel="stylesheet" href="./hjCss/main.css">
<link rel="stylesheet" href="./hjCss/reservationCss.css">
</head>
<body>
<div id="wrapper">
    <!--로고이미지-->
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
			<li onclick="location.href='review_list.jsp'">후기</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
		</ul>
	</div>

	<!-- 가운데 가장 큰 박스 -->
	<div id="background">
	<!-- 이벤트 가져오기 -->
		<%
	
		String EventPostingValue = String.valueOf(session.getAttribute("event_number"));
		int event_number = Integer.parseInt(EventPostingValue);
		
		EventPostingDAO eventPostingDAO = new EventPostingDAO();
		
		EventPosting eventPosting = eventPostingDAO.getEventInfo(event_number);
	%>
		<h2 style="padding-top:15px">예약</h2>
		<!-- 안에 글넣는 하얀 박스-->
		<div id="reviewbox" style="margin-top: 50px">
            <h1>예약에 성공했습니다.</h1>
			<h2>예약정보</h2>
			<p>예약번호: <%=session.getAttribute("r_id") %> </p>
			<p>이메일: <%=session.getAttribute("r_email") %></p>
			<p>전화번호: <%=session.getAttribute("r_phonenumber") %></p>
			<p>예약 인원: <%=session.getAttribute("person") %></p>
			<p>예약한 행사정보:<%=eventPosting.getEvent_name() %></p>
        </div>
	 </div>
	
</div>
</body>
</html>