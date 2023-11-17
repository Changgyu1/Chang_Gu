<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hj.event.ReservationSearchDAO" %>
<%@ page import="hj.event.ReservationDTO" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GO, FESTIVAL 예약조회</title>
    <link rel="stylesheet" href="./hjCss/main.css">
	<link rel="stylesheet" href="./hjCss/reservationSearchInfo2.css">
	<link rel="stylesheet" href="./hjCss/reservationReCancel.css">
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
			<li id="menu" onclick="location.href='review_list.jsp'">후기</li>
			<li id="menu" onclick="location.href='Qna_List.jsp'">QNA</li>
			<li id="menu" onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li id="menu" onclick="location.href='Event_List.jsp'">행사정보</li>
		</ul>
	</div>

	<!-- 가운데 가장 큰 박스 -->
	<div id="background">
	
		<h2 style="padding-top:15px">예약 조회</h2>
		<!-- 안에 글넣는 하얀 박스-->
		<div id="reviewbox">
			<div>
            
			<%
				int r_id = Integer.parseInt(request.getParameter("r_id"));
				String email = request.getParameter("email");
				ReservationSearchDAO rs = new ReservationSearchDAO();
				
				
				ReservationDTO rdto = rs.getRInfo(r_id, email);
				
				if (rdto != null) {
			%>
			<ul id="info">
			        <li id="info">예약번호: <%=rdto.getId() %></li>
			        <li id="info">이메일: <%=rdto.getEmail() %></li>
			        <li id="info">휴대전화: <%=rdto.getPhonenumber() %></li>
			        <li id="info">예약 인원: <%=rdto.getPerson() %></li>
			        <li id="info">행사명: <%=rdto.getEvent_name() %></li>
			        <li id="info">날짜: <%=rdto.getEvent_day() %></li>
			        <li id="info">위치: <%=rdto.getEvent_location() %></li>
			        <li id="info">결제 금액: <%=rdto.getTotal() %></li>
			</ul>
			<div id="crebutton">
	        <input id="rebutton" type="text" value="예약수정" onclick="location.href='reservation_update.jsp?r_id=<%=r_id%>'">
	        <input id="cbutton" onclick="location.href='reservation_cancel_form.jsp?r_id=<%=r_id%>'" value="예약취소">
          </div>

        </div>
        <!-- 취소 수정 버튼 -->
        <%    } else {
			        out.println("예약 정보를 찾을 수 없습니다.");
			    }
			%>
        
        
	 </div>
	 
</div>
</body>
</html>
