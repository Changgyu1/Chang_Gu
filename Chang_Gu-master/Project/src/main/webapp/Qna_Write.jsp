<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 문의게시판</title>
<link rel="stylesheet" href="./saCss/saCss.css">
</head>
<body>
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
	    
	</div>

	<div id="buttons">
		<ul>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='review_list.jsp'">후기</li>
		</ul>
	</div>
	
	<div id="background">
	<h3 style="text-align:center;">문의글 작성</h3>
	<div id="whitebox">

<form action="QnaInsertServlet" method="post">
	<div class="test"> 
	<label for="qna_title">제목 : </label>
	<input type="text" placeholder="제목을 입력해주세요."  
	id="qna_title" name="qna_title" required style="text-align:center;"><br>
	
	<label for="qna_content">내용 : </label>
	<input type="text" placeholder="내용을 입력해주세요." id="qna_content" name="qna_content" required style="text-align:center;"><br>
		
	<label for="qna_name">이름 : </label>
	<input type="text" id="qna_name" name="qna_name" required>
	
	<label for="qna_password">비밀번호 : </label>
	<input type="password" id="qna_password" name="qna_password" required>
	
	
	
	
	<label for="qna_email">이메일 : </label>
	<input type="email" id="qna_email" name="qna_email" required><br><br>
	
	<input type="submit" value="작성완료" onclick="location.href='Qna_List.jsp'">
	<input type="submit" value="돌아가기" onclick="location.href='Qna_List.jsp'">
	</div>
</form>

	</div>
	</div>


</body>
</html>

