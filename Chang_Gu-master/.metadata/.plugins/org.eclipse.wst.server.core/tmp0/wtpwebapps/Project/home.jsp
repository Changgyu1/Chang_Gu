<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="park.event.EventPosting"%>
<%@ page import="park.event.EventPostingDAO"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>홈페이지</title>
<link rel="stylesheet" href="./hjCss/main.css">
<link rel="stylesheet" href="./hjCss/reservationCss.css">
<style>
.pagination-img{
	width: 350px;
	height: 400px;
}
</style>
					<%
					int pageNumber = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
					int pageSize = 1;
					

					EventPostingDAO eventPaginationDAO = new EventPostingDAO();
					List<EventPosting> eventPagination = eventPaginationDAO.getAllProducts(pageNumber, pageSize);
					int totalEventList = eventPaginationDAO.getTotalProducts();
					int totalPages = (int) Math.ceil((double) totalEventList / pageSize);
					int count = 5;
					%>
					
<script>
	function loginFail() {
		alert("로그인에 실패하였습니다.");
		window.location.href = "login.jsp";
	}
	
</script>
<script>
  var count = <%= pageNumber %>; // 페이지 이동 시 서버에서 계산된 페이지 번호를 초기값으로 설정

  function pageBefore() {
    if (count <= 1) {
      location.href = "<%=request.getRequestURI()%>?page=<%=totalPages%>";
    } else {
      --count;
      location.href = "<%=request.getRequestURI()%>?page=" + count;
    }
  }

  function pageNext() {
    var pageSize = 1;
    var totalEventList = <%= totalEventList %>; // 전체 이벤트 갯수
    var totalPages = <%= totalPages %>; // 전체 페이지 갯수
    if (count >= totalPages) {
      location.href = "<%=request.getRequestURI()%>?page=1";
    } else {
      ++count;
      location.href = "<%=request.getRequestURI()%>?page=" + count;
    }
  }

  // 자동으로 다음 페이지로 이동하는 함수
  function autoNext() {
    pageNext();
  }

  // 일정한 시간 간격으로 autoNext 함수 호출 (예: 3000ms = 3초)
  setInterval(autoNext, 3000);
</script>

</head>
<body>
	<div id="wrapper">
		<!--로고이미지-->
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

			<h2 style="padding-top: 15px">행사 정보</h2>
			<!-- 안에 글넣는 하얀 박스-->
			<div id="reviewbox">

				<table border="1">


					<%
					for (EventPosting p : eventPagination) {
					%>



					<div class="pagination">
						<div class="imagecenter">
							<a href="Event_Detal.jsp?event_number=<%=p.getEvent_number()%>">
								<img src="<%=p.getEvent_img()%>" class="pagination-img">
							</a>
						</div>
					</div>
					<%
					}
					%>
				
			</div>
		</div>
		<br>
		

		<button id="pagination-before" name="pagination-before"
			onclick="pageBefore()">이전</button>
			
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<button id="pagination-next" name="pagination-next"
			onclick="pageNext()">다음</button>
		</table>
	</div>
	<%
	String loginError = (String) request.getAttribute("loginError");
	if (loginError != null) {
	%>
	<script>
		loginFail();
	</script>
	<%
	}
	%>
	<script>

	</script>

</body>
</html>