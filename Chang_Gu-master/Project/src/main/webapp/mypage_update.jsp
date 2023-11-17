<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GO, FESTIVAL 마이페이지</title>
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
	
		<h2 style="padding-top:15px">내 정보 수정</h2>
		<!-- 안에 글넣는 하얀 박스-->
		<div id="reviewbox">
            <form action="mypage_info_update" method="post">
            	<%
					String email = (String) session.getAttribute("email");
					String name = (String) session.getAttribute("name");	
					String phonenumber = (String) session.getAttribute("phonenumber");
				%>
				<p> 이메일: <%=email %></p>
				<p> 이름: <%=name %></p>
				<label for = "phonenumber">전화번호 : </label>
				<input type="text" name="phonenumber" value="<%=phonenumber%>">
				<input type="hidden" name="email" value = "<%=email %>"> <br><br>
				<input type="submit" value="변경하기">
            </form>
        </div>
	 </div>
</div>	

</body>
</html>
