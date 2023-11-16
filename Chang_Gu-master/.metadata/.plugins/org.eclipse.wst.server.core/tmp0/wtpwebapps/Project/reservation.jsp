<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GO, FESTIVAL 예약</title>
    <link rel="stylesheet" type="text/css" href="./hjCss/main.css">
<link rel="stylesheet" type="text/css" href="./hjCss/reservationSearch.css">
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
	 	<button type="button" onclick="location.href='logout.jsp'" style="width:75px;">로그아웃</button>
	 	 <h>|</h>
	    <button type="button"
				onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'"
				style="width: 100px;">마이페이지</button>
	 <%
    	}else{
	 %>
		 <button type="button" onclick="location.href='login.jsp'" style="width:60px;">로그인</button>
		 <h>|</h>
	    <button type="button" onclick="location.href='register.jsp'" style="width:100px;">회원가입</button>
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

	<!-- 가운데 가장 큰 박스 -->
	<div id="background">
	
		<h2 style="padding-top:15px">예약</h2>
		<!-- 안에 글넣는 하얀 박스-->
		<div id="reviewbox">
            <form action="reservationServlet" method="post">
	        <label for="person">인원수: </label>
	        <input type="text" id="person" name="person" required>
	        <br>
	        <label for="r_phonenumber">연락처:  </label>
	        <input type="text" id="r_phonenumber" name="r_phonenumber" placeholder="-를 넣어주세요." required>
	        <br>
	         <%
			   	if(session.getAttribute("email")!=null){
			 %>
			 	<label for="r_email">이메일</label>
	        	<input type="email" id="r_email" name="r_email" value="<%=session.getAttribute("email") %>"  required>
			 <%
			   	}else{
			 %>
			 	<label for="r_email">이메일</label>
	        	<input type="email" id="r_email" name="r_email" required>
	        <%} %>
	        <br>
	        <input type="hidden" name="event_number" value="<%=request.getParameter("event_number") %>"> 
	        <input type="submit" value="예약">
			</form>
        </div>
	 </div>
	
</div>
</body>
</html>
