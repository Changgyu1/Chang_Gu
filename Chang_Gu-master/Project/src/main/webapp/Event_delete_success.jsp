<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="park.event.EventPosting"%>
<%@ page import="park.event.EventPostingDAO"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String EventPostingValue = request.getParameter("event_number");
	int event_number = Integer.parseInt(EventPostingValue);

	EventPostingDAO eventPostingDAO = new EventPostingDAO();

	
	int result = eventPostingDAO.delete(event_number);
		
		if (result == -1) { // 글삭제 실패시
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글삭제에 실패했습니다.')");
			script.println("location.href = 'Event_List.jsp'"); // 이전 페이지로 사용자를 보냄
			script.println("</script>");
		} else { // 글삭제 성공시
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 성공하였습니다.')");
			script.println("location.href = 'Event_List.jsp'"); // 메인 페이지로 이동
			script.println("</script>");
		}
		
		
	%>

</body>
</html>