<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO, festival 댓글 삭제</title>
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
	
	<!-- 가운데 가장 큰 박스 -->
	<div id="background" style="height:520px;">
		<div id="reviewbox" >
		
		
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<!--  댓글 삭제 버튼과 비밀번호 입력칸 -->
			<div style="border:1px solid gray; border-radius:10px;box-shadow: 0px 1px 5px gray; height:350px;width:600px;margin-left:auto;margin-right:auto;margin-top:-60px;">
			<!-- 파란 창 -->
			<div style="background-color:blue;height:30px;width:600px;border-radius:10px 10px 0px 0px;box-shadow:0px 2px 0px black;"> 
			<button style="height:20px;font-weight:900;color:white;background-color:red;border-radius:3px;float:right;margin-right:6px;margin-top:5px;box-shadow:1px 2px 0px black;"
			onclick="location.href='review_list.jsp'">X</button>
			</div>
			<div >
			<br>
				<h2>댓글을 삭제하시겠습니까?</h2>
				<h5>삭제를 원하시면 댓글 작성시 생성했던 비밀번호를 입력해주세요. </h5>
				<h5 style="color:red;">* 삭제 후 되돌릴 수 없습니다.</h5>
				<h6>취소하기를 누를 시 후기 게시판 메인으로 이동합니다.</h6> 
				
				<!-- 삭제 비밀번호 전송 폼 -->
					<form action="deletecommentDAO" method="post">
						<input type="password" name="commentpw" style="border:1px solid gray; border-radius:2px;width:80px;height:25px;text-align:center;" placeholder="비밀번호">
						<br>
						<br>
						<input type="hidden" name=conum value="<%=request.getParameter("conum")%>">
						<button type="submit" style="font-size:14px;border:1px solid gray; width:70px;border-radius:3px;height:25px;" >삭제하기</button>
					</form>
				<br>
				<button type="button" style="border:1px solid gray; width:70px;border-radius:3px;height:25px;" onclick="location.href='review_list.jsp'">취소하기</button>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>