<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "register.event.UserDAO"%>
<%@ page import = "register.event.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="../css/saCss.css">
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
			<li onclick="location.href='review_list.jsp'">후기</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
		</ul>
	</div>
<h3>회원 탈퇴</h3>
<form action="" method="post">
<input type="text" name="name">
<button type="submit">탈퇴</button>
	
	<%
		
		UserDAO userDAO = new UserDAO();
		
		int result = userDAO.DeleteUser(request.getParameter("email"), request.getParameter("password"));

			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 탈퇴에 실패했습니다.')");
				script.println("location.href = 'Qna_List.jsp'"); // 이전 페이지로 사용자를 보냄
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('성공적으로 탈퇴되었습니다.')");
				script.println("location.href = 'logout.jsp'"); // 메인 페이지로 이동
				script.println("</script>");
			}
	%>
	
	


</form>
</body>
</html>