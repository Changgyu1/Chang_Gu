<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="park.event.EventPosting"%>
<%@ page import="park.event.EventPostingDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="./css/event.css">
<style>
        .event_form{
            padding: 10px;
            margin: 10px;
            text-align: center;
            width: 103%;
        }
        #event_name,#event_location{
            padding: 5px;
            margin: 5px;
            width: 50%;
        }
        #event_day,#event_time{
            padding: 5px;
            margin: 5px;
            width: 30%;
        }
        #event_price,#event_age{
            padding: 5px;
            margin: 5px;
        }
        #event_explain{
            width: 80%;
            height: 200px;
        }
        .sel{
            margin: 5px;
        }
        label{
        margin: 10px;
       
        }
</style>
</head>
<body>
	<% 
		String EventPostingValue = request.getParameter("event_number");
		int event_number = Integer.parseInt(EventPostingValue);
		
		EventPostingDAO eventPostingDAO = new EventPostingDAO();
		
		EventPosting eventPosting = eventPostingDAO.getEventInfo(event_number);
	%>
	<div class="diva">
		<!-- 로고 이미지 -->
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
	    
	</div>

	<!-- 메뉴바 -->
	<div id="buttons">
		<ul>
			<li onclick="location.href='review_list.jsp'">후기</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
		</ul>
	</div>
    
    <!-- 가운데 가장 큰 박스 -->
	<div id="background">
	
	<h3 style="text-align:center;">행사글 작성 <%=eventPosting.getEvent_number()%></h3>
	<div id="whitebox">
	
<form method="post" action="Event_Update_success.jsp?event_number=<%=eventPosting.getEvent_number()%>">
	<div class="event_form">
	<label for="event_name">행사 제목 : </label>
	
	<input type="text" id="event_name" name="event_name" value="<%=eventPosting.getEvent_name() %>"  style="text-align:center;"><br>
	
    <label for="event_location">행사 장소 : </label>
    <input type="text" id="event_location" name="event_location" value="<%=eventPosting.getEvent_location()%>"  style="text-align:center;"><br>
		
	<label for="event_day"> 행사 기간 : </label>
	<input type="text" id="event_day" name="event_day" value="<%=eventPosting.getEvent_day()%>"  style="text-align:center;">
	
	<label for="event_time">행사 시간 : </label>
	<input type="text" id="event_time" name="event_time" value="<%=eventPosting.getEvent_time()%>"  style="text-align:center;"><br>
	

	
	<label for="event_price">가 격 : </label>
	<input type="number" id="event_price" name="event_price" value="<%=eventPosting.getEvent_price() %>"  style="text-align:center;">
	
	<label for="event_age">연 령 : </label>
	<input type="number" id="event_age" name="event_age" value="<%=eventPosting.getEvent_age()%>"  style="text-align:center;"><br>

	
	<label for="event_explain">내용 : </label> <br>
	<input type="text" id="event_explain" name="event_explain" value="<%=eventPosting.getEvent_explain()%>" style="text-align:center"> </textarea><br>
	
	
	
	
	<input type="submit" value="수정하기" class="sel">
	</div>
</form>

<button onclick="location.href='Event_List.jsp'">돌아가기</button>

	</div>
	</div>
</div>

</body>
</html>
	