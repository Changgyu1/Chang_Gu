<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter"%>
	<%@ page import="register.event.registerDAO" %>
	<%@ page import="register.event.registerDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String email = request.getParameter("email");
	String password = request.getParameter("password");
		
		registerDAO dao = new registerDAO();
		

		
		
	
	int result = dao.UpdatePassword(password, email);
		
		if (result == -1) { // 글삭제 실패시
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 변경에 실패하였습니다.')");
			script.println("location.href = 'login.jsp'"); // 이전 페이지로 사용자를 보냄
			script.println("</script>");
		} else { // 글삭제 성공시
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 변경에 성공하였습니다.')");
			script.println("location.href = 'login.jsp'"); // 메인 페이지로 이동
			script.println("</script>");
		}
		
		
	%>
</body>
</html>