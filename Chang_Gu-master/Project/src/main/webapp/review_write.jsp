<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="gaeul.review.festivalDTO" %>
     <%@ page import="gaeul.review.selectDAO" %>
     <%@ page import="gaeul.review.deleteDAO" %>
     <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GO, festival 후기 작성</title>
<link rel="stylesheet" href="review.css">
<script>

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
	 
	<!-- 가운데 가장 큰 박스 -->
	<div id="background" style="height:580px;padding-top:30px;">
	
		<h2 style="padding-top:15px">리뷰 작성</h2>
		<!-- 안에 글넣는 하얀 박스-->
		<div id="reviewbox">
		<form  action="insertDAO" method="post">
			
			<!-- 축제 선택칸 -->
				<%
				System.out.println(request.getParameter("event_number"));
				%>
			<!-- 제목 입력칸 -->
			<label for="review_title">제목</label><br>
			<input type="text" id="review_title" name="review_title" required placeholder="후기 제목을 입력해주세요." style="text-align:center; border: 1px solid gray;" value=""><br>
			
			<!-- 내용 입력칸 -->
			<label for="review" >내용</label><br>
			<input type="text" id="review" name="review" required placeholder="후기 내용을 입력해주세요." style="text-align:center; border: 1px solid gray;"><br>
			
			<input type="hidden" name="event_number" value="<%=request.getParameter("event_number") %>">
			
			
			<input type="submit" value="리뷰 등록하기" >
			
		</form>
		</div>
	 </div>
	


</body>
</html>