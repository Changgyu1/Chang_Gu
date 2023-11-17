<%@page import="java.sql.PreparedStatement"%>
<%@page import="hj.event.ReservationDTO" %>
<%@page import=" java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>GO, FESTIVAL 마이페이지</title>

<link rel="stylesheet" href="./hjCss/mypage.css">
<link rel="stylesheet" href="./hjCss/recancelButton.css">


</head>

<body>

    <!-- 이미지 로고 -->
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

<!-- 메뉴바 -->
  <div id="buttons">
		<ul>
			<li onclick="location.href='review_list.jsp'">후기</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
		</ul>
	</div>

     <div id="background">
     <h3 style="text-align:center;padding-top:20px;">마이페이지</h3>
	     <div id="reviewbox">
	     <!-- 내 정보가 표시될 공간 -->
	    
		     <div>
		     	<%
					String email = (String) session.getAttribute("email");
					String name = (String) session.getAttribute("name");	
					String phonenumber = (String) session.getAttribute("phonenumber");
				%>
				
				<p> 이메일: <%=email %></p>
				<p> 이름: <%=name %></p>
				<p> 전화번호: <%=phonenumber %></p>
		     </div>
		     <!-- 예약목록 -->
		     <div id ="reservationList">
		     <h2>예약 목록</h2>
				<table border="1">
				<tr>
					<th>예약번호</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>인원</th>
					<th>행사명</th>
					<th>위치</th>
					<th>총액</th>
				</tr>
				<%
			    List<ReservationDTO> rdto = (List<ReservationDTO>) request.getAttribute("rdto");
			
			    for(ReservationDTO reservation : rdto){
			%>
			<tr>
			    <td><%=reservation.getId()%></td>
			    <td><%=reservation.getEmail()%></td>
			    <td><%=reservation.getPhonenumber()%></td>
			    <td><%=reservation.getPerson()%></td>
			    <td><%=reservation.getEvent_name()%></td>
			    <td><%=reservation.getEvent_location()%></td>
			    <td><%=reservation.getTotal()%></td>
			</tr>
			<%
			    }
			%>
			</table>
		     </div>
			<div id="recancelButton">
				<form action="mypage_update.jsp" method="post" style="display: inline-block;">
					<input type="hidden" name="email" value="<%=email%>">
					<input type="submit" value="내 정보 수정">				
				</form>
				<form action="mypage_resign.jsp" method="post" style="display: inline-block;">
					<input type="hidden" name="email" value="<%=email%>">
					<input type="submit" value="회원탈퇴">
				</form>
			</div>
	     
	      </div>  
      </div> 
</body>
</html>