<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="register.event.registerDAO"%>
<%@ page import="register.event.registerDTO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<body>
<%
    String email = request.getParameter("email");
    registerDAO DAO = new registerDAO();
    String checkEmail = DAO.getUser(email);
    System.out.println("����" + checkEmail);
    if (email.equals(checkEmail)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('�ߺ��� ���̵��Դϴ�..')");
        script.println("location.href = 'register.jsp'");
        script.println("</script>");
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("var emailInput = document.getElementById('email');");
        script.println("emailInput.value = '" + email + "';"); // ���� ����
        script.println("emailInput.readOnly = true;"); // readonly�� ����
        script.println("alert('��밡���� ���̵��Դϴ�.')");
        script.println("</script>");
    }
%>
	

</body>
</html>