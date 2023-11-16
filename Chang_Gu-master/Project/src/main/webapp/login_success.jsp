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
    
    <script>
		setTimeout(function(){
			window.location.href="home.jsp"
		}, 3000);
	</script>

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
	
		<h2 style="padding-top:15px">로그인 성공</h2>
		<!-- 안에 글넣는 하얀 박스-->
		<div id="reviewbox">
       		<%
				String email = (String) session.getAttribute("email");
				String name = (String) session.getAttribute("name");
				String phonenumber = (String) session.getAttribute("phonenumber");
			%>
			
			<p> 이메일: <%=email %></p>
			<p> 이름: <%=name %></p>
			<p> 전화번호: <%=phonenumber %></p>
			<br>
			<p>3초 후 홈페이지로 이동합니다.</p>
			<p><a href="logout.jsp">로그아웃</a></p>
        </div>
	 </div>
</div>	

</body>
</html>