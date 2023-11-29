<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="park.event.EventPosting"%>
<%@ page import="park.event.EventPostingDAO"%>
<%
String userEmail = (String)session.getAttribute("email");
//페이지네이션 이미지
int pageNumber = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
int pageSize = 2;
EventPostingDAO eventPaginationDAO = new EventPostingDAO();
List<EventPosting> eventPagination = eventPaginationDAO.getAllProducts(pageNumber, pageSize);
// 페이지 번호
int totalEventList = eventPaginationDAO.getTotalProducts();
int totalPages = (int) Math.ceil((double) totalEventList / pageSize);
%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="./css/event.css">
	<style>
body{
   position: absolute;
    paddi: ;
    padding: 20px;
    top: 50%;
    left: 50%;
    left: 50%;
    transform: translate(-50%, -54%);
}
.list {
	float: left;
}

.pagination {
    width: 100%;
    
    position: absolute;
    transform: translate(-50%,-50%);
    top: 50%;
    left: 50%;
    margin: 152px 0px 0px 128px;
}

.pagination-img {
    width: 300px;
    height: 300px;
    padding: 27px 0px 0px 179px;
    padding: 0px 100px 0px 100px;
}
.pagination-ismg{
    float: left;
    margin: 0px 0px 100px -10px;
    width: 500px;
    height: 300px;
}
.imagecenter {
	float: left;
	margin: 40px;
	margin-right: 150px;
}

.add-event {
	float: right;
}
.Pagebutton{
text-align: center;
    position: relative;
    margin: 350px 0px 0px 0px;
}
}
.event_name_List{
	float:left;
	    height: 300px;
    margin: 0px 0px 150px 0px;
}
#whitebox2{

            padding: 20px;
}
.eventList_name{
margin: 0px 0px 0px 143px;
    text-align: center;
    text-decoration: none;
    color: inherit;

}

    #toggleButton {
        display: none; /* 초기에는 버튼을 감추기 */
            display: none;
    width: 100px;
    box-sizing: border-box;
    border: solid 0px;
    /* border: none; */
    background-color: rgba(249, 220, 201, 0.326);
    }

</style>
</head>
<body>
	  <script>
	  	document.addEventListener("DOMContentLoaded", function() {
        const toggleButton = document.getElementById('toggleButton');
        const userEmail = '<%=session.getAttribute("email")%>';
        if (userEmail === 'kiga1234@kiga1234') {
            toggleButton.style.display = 'block';
        } else {
            toggleButton.style.display = 'none';
        }
    });
	</script>
	<div>
		<!-- 로고 이미지 -->
		<img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">

		<!--로그인 버튼-->
	 <div style="text-align: right; width: 1215px;">
   		 <% if(session.getAttribute("email")!=null){ %>
   		 
	 	<button type="button" onclick="location.href='logout.jsp'" style="background:none;border:none;width:75px;">로그아웃</button>
	 	 <h>|</h>
	    <button type="button" onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'" style="background:none;border:none;width:100px;">마이페이지</button>
	    
	 <% }else{ %>
	 
		 <button type="button" onclick="location.href='login.jsp'" style="background:none;border:none;width:60px;">로그인</button>
		 <h>|</h>
	    <button type="button" onclick="location.href='join.jsp'" style="background:none;border:none;width:100px;">회원가입</button>
	    
	  <% } %>
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
			<h2>행사 목록</h2>
			<div class="add-event">  
		 <% if (!"kiga1234@kiga1234".equals(userEmail)) { 	%>
				<input type="hidden" class="add-event" id="toggleButton" onclick="location.href='Event_add.jsp'" value="게시글 작성">
			<% } else { %>
		<input type="button" class="add-event" id="toggleButton" onclick="location.href='Event_add.jsp'"  value="게시글작성">
			<% } %>
			</div>
			
			<!-- 안에 글넣는 하얀 박스-->
			<div id="whitebox2">	<!-- 이미지 -->
				<div class="pagination">
					<% for (EventPosting p : eventPagination) { %>
					<div class="pagination-ismg">
						<a href="EventServlet?event_number=<%=p.getEvent_number()%>"> <img src="<%=p.getEvent_img()%>" class="pagination-img"> </a> <br>
						<a href="EventServlet?event_number=<%=p.getEvent_number()%>" class="eventList_name"><%=p.getEvent_name() %></a>
					</div>
					<% } %>
				</div>
							
	<!-- 페이지 넘기기 버튼 -->
				<div class="Pagebutton">		
				<%	for (int i = 1; i <= totalPages; i++) { %>
					<a href="<%=request.getRequestURI()%>?page=<%=i%>"><%=i%></a>	
				<% } %>
				</div>
			</div>
		</div>
	</div>
</body>
</html>