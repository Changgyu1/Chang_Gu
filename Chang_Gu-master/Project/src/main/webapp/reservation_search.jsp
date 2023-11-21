<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     <h3 style="text-align:center;padding-top:20px;">예약 조회</h3>
 	    <div id="reviewbox">
    	 <!-- 예약정보 조회란 -->
    	 	<div id ="r_search">
	 			<form action="reservation_info.jsp" method="post">
	 				<label for="r_id">예약번호</label>
					<input type="text" id="r_id" name="r_id" required><br>
					<label for="email">이메일</label>
					<input type="email" id="email" name="email" required><br>
					
					<input type="submit" value="조회하기">
				</form>
			</div>
      	</div> 	
      </div>


     
     
</body>
</html>