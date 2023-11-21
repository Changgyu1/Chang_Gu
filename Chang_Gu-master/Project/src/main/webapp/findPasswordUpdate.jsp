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
		if (result == -1) { 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 변경에 실패하였습니다.')");
			script.println("location.href = 'login.jsp'"); 
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 변경에 성공하였습니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}

	%>
</body>
</html>