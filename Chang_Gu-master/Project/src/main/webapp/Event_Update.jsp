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
	
	<h3 style="text-align:center;">행사글 작성 <%=session.getAttribute("event_number")%></h3>
	<div id="whitebox">
	
<form method="post" action="EventServlet" enctype="multipart/form-data" >
	<div class="event_form">
	<label for="event_name">행사 제목 : </label>
	
	<input type="text" id="event_name" name="event_name" value="<%=session.getAttribute("event_name") %>"  style="text-align:center;"><br>
	
    <label for="event_location">행사 장소 : </label>
    <input type="text" id="event_location" name="event_location" value="<%=session.getAttribute("event_location")%>"  style="text-align:center;"><br>
		
	<label for="event_day"> 행사 기간 : </label>
	<input type="text" id="event_day" name="event_day" value="<%=session.getAttribute("event_day")%>"  style="text-align:center;">
	
	<label for="event_time">행사 시간 : </label>
	<input type="text" id="event_time" name="event_time" value="<%=session.getAttribute("event_time")%>"  style="text-align:center;"><br>
	

	
	<label for="event_price">가 격 : </label>
	<input type="number" id="event_price" name="event_price" value="<%=session.getAttribute("event_price") %>"  style="text-align:center;">
	
	<label for="event_age">연 령 : </label>
	<input type="number" id="event_age" name="event_age" value="<%=session.getAttribute("event_age")%>"  oninput='handleOnInput(this, 2)' style="text-align:center;"><br>

	
	<label for="event_explain">내용 : </label> <br>
	<input type="text" id="event_explain" name="event_explain" value="<%=session.getAttribute("event_explain")%>" style="text-align:center"> </textarea><br>
	
	<label for="event_img">사 진 : </label>
	<input type="file" id="event_img" multiple="multiple" name="event_img"  style="text-align:center;"><br>	
	
	<input type="hidden" name="event_number" value="<%=session.getAttribute("event_number")%>">
	
	<input type="submit" name="update" value="수정하기" class="sel">
	</div>
</form>

<button onclick="location.href='Event_List.jsp'">돌아가기</button>

	</div>
	</div>
</div>


<script>
function handleOnInput(el, maxlength) {
	  if(el.value.length > maxlength)  {
	    el.value 
	      = el.value.substr(0, maxlength);
	  }
	}
</script>
</body>
</html>
	