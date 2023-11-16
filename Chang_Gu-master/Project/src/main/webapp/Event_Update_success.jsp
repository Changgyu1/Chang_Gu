<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="park.event.EventPosting"%>
<%@ page import="park.event.EventPostingDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String updateNumber = request.getParameter("event_number");
	int event_number = Integer.parseInt(updateNumber);
	String updateName = request.getParameter("event_name");
	String updateLocation = request.getParameter("event_location");
	String updateDay = request.getParameter("event_day");
	String updateTime = request.getParameter("event_time");
	String updatePrice = request.getParameter("event_price");
	double event_price = Double.parseDouble(updatePrice);
	String updateAge = request.getParameter("event_age");
	int event_age = Integer.parseInt(updateAge);
	String updateExplain = request.getParameter("event_explain");
	
	EventPostingDAO eventPostingDAO = new EventPostingDAO();
	
	int result = eventPostingDAO.updateEvent(event_number, updateName, updateLocation, updateDay, updateTime, event_price, event_age, updateExplain);
	
	
	if (result == -1) { // 글삭제 실패시
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 수정에 실패했습니다.')");
		script.println("location.href = 'Event_List.jsp'"); // 이전 페이지로 사용자를 보냄
		script.println("</script>");
	} else { // 글삭제 성공시
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수정되었습니다.')");
		script.println("location.href = 'Event_List.jsp'"); // 메인 페이지로 이동
		script.println("</script>");
	}

	
	


	

	

	


	


	

	%>
</body>
</html>