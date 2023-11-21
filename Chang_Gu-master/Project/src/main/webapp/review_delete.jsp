<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ page import="gaeul.review.deleteDAO" %>
     <%@ page import="gaeul.review.festivalDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO, festival 후기삭제</title>
<link rel="stylesheet" href="review.css">
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
		
	
	<%

	deleteDAO dao = new deleteDAO();
	int rnum = Integer.parseInt(request.getParameter("rnum"));
	System.out.println(rnum+" 리뷰삭제!");
	festivalDTO dto = new festivalDTO();
	
	%>
	
	<!-- 가운데 가장 큰 박스 -->
	<div id="background" style="height:520px;">
		<div id="reviewbox" >
		
		
		<br>
		<br>
		<br>
		<br>
		<br>
		<div style="border:1px solid gray; border-radius:10px;box-shadow: 0px 1px 5px gray; height:350px;width:600px;margin-left:auto;margin-right:auto;margin-top:-60px;" >
			<!-- 파란 창 -->
			<div style="background-color:blue;height:30px;width:600px;border-radius:10px 10px 0px 0px;box-shadow:0px 2px 0px black;"> 
			
			<button style="height:20px;font-weight:900;color:white;background-color:red;border-radius:3px;float:right;margin-right:6px;margin-top:5px;box-shadow:1px 2px 0px black;"
			onclick="location.href='review_list.jsp'">X</button>
			</div>
		<br>
		<br>
		<br>
		<h2>리뷰를 삭제하시겠습니까?</h2>
		<h5 style="color:red;">* 단 삭제 시 되돌릴 수 없습니다.</h5>
		<h5>취소하기를 누를 시 후기 게시판 메인으로 이동합니다.</h5>
		<form action="deleteDAO" method="post">
	
		<input type="hidden" name="rnum" value="<%=rnum%>">
		<button type="submit" style="font-size:14px;border:1px solid gray; width:90px;background-color:rgb(218, 219, 231);border-radius:3px;" >삭제하기</button>
		<br>
		<br>
		</form>
		
		<input type="button" style="border:1px solid gray; width:90px;background-color:rgb(218, 219, 231);border-radius:3px;height:21px;"  value="취소하기" onclick="location.href='review_list.jsp'">
			</div>
		</div>
	</div>
	
</body>
</html>