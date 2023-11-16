<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO, festival 업데이트 성공</title>
<link rel="stylesheet" href="review.css">
<script>
	//3초 후 홈페이지로 이동하는 javascript
	setTimeout(function() {
		//이동할 페이지 경로 설정
		window.location.href="review_list.jsp";
	}, 2000); //3000 = 3초
</script>
</head>
<body>


	<!-- 로고 이미지 -->
	<img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">


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
	    
	</div>

	<div id="buttons">
	<!--로그인 버튼-->
   <ul style="list-style:none;">
			<li style="float:left;margin-left:170px;" onclick="location.href='Event_List.jsp'">행사정보</li>
		   <li style="float:left;margin-left:170px;" onclick="location.href='reservation_search.jsp'">예약조회</li>
		   <li style="float:left;margin-left:170px;" onclick="location.href='Qna_List.jsp'">QNA</li>
			<li style="float:left;margin-left:170px;" onclick="location.href='review_list.jsp'">후기</li>
		</ul>
	</div>
	 <div id="background" style="text-align:center;" >

		<h1 style="margin-top:200px;">성공하였습니다.</h1>
		<h4>후기 게시판으로 돌아갑니다..</h4>
	</div>

</body>
</html>