<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="gaeul.review.festivalDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO, festival 후기 수정</title>

<link rel="stylesheet" href="review.css">
</head>
<body>


	<% 
	festivalDTO dto = new festivalDTO();
	//int num=Integer.parseInt(request.getParameter("reviewnumber"));
	int rnum = Integer.parseInt(request.getParameter("rnum"));
	%>

	<!-- 로고 이미지 -->
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
	
	
	<div id="background" style="height:530px;">
			<div id="reviewbox" >
				<form action="UpdateDAO" method="post">
				<h4>리뷰 수정하기</h4>
				<input type="hidden" name="rnum" value="<%=rnum%>">
				<input type="text" name="updateTitle" style="text-align:center; height:30px;width:500px;border:1px solid gray;" required placeholder="제목을 입력해주세요.">
				<br> 
				<br> 
				<input type="text" name="updateReview" style="text-align:center; width:500px;height:250px;border:1px solid gray;" required placeholder="내용을 입력해주세요.">
				<br> 
				<br> 
				<button type="submit" style="background-color:lightgray;border:1px solid gray;width:100px;">등록하기</button>
				</form>
			</div>
		</div>
	

</body>
</html>