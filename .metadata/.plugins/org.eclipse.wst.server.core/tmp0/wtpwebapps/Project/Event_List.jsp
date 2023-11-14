<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="park.event.EventPosting"%>
<%@ page import="park.event.EventPostingDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="./css/event.css">
<style>
.list {
	float: left;
}

.pagination {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	padding: 50px 0px 0px 0px;
}

.pagination-img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 300px;
	height: 300px;
	padding: 0px 0px 0px 100px;
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
	padding: 40px;
}
</style>
</head>
<body>
	<div class="diva">
		<!-- 로고 이미지 -->
		<img src="./image/로고1.png" id="logo">

		<!--로그인 버튼-->
		<div style="text-align: right; width: 1215px;">
			<%
			if (session.getAttribute("email") != null) {
			%>
			<button type="button" onclick="location.href='logout.jsp'"
				style="width: 75px;">로그아웃</button>

			<button type="button"
				onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'"
				style="width: 100px;">마이페이지</button>
			<%
			} else {
			%>
			<button type="button" onclick="location.href='login.jsp'"
				style="width: 60px;">로그인</button>

			<button type="button" onclick="location.href='register.jsp'"
				style="width: 100px;">회원가입</button>
			<%
			}
			%>
		<script>
		function toggleButton(){
			 const toggleButton = document.getElementById('toggleButton');
			if(<%=session.getAttribute("email")%> === kiga1234@kiga1234){
				toggleButton.style.display = 'block';
			} else{
				toggleButton.style.display = 'none';
			}
		}
		</script>
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

			<h2>행사 작성</h2>
			<div class="add-event">
			
				<button type="button" class="add-event" id="toggleButton"
					onclick="location.href='Event_add.jsp'">게시글 작성</button>
			</div>
			<!-- 안에 글넣는 하얀 박스-->
			<div id="whitebox">

				<table border="1">
					<!-- 이미지 -->
					<%
					int pageNumber = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
					int pageSize = 2;
					//int pageNumber = Integer.parseInt(request.getParameter("page"));

					EventPostingDAO eventPaginationDAO = new EventPostingDAO();
					List<EventPosting> eventPagination = eventPaginationDAO.getAllProducts(pageNumber, pageSize);
					%>
					<div class="pagination">
						<%
						for (EventPosting p : eventPagination) {
						%>



						<div class="pagination-img">
							<a href="Event_Detal.jsp?event_number=<%=p.getEvent_number()%>">
								<img src="<%=p.getEvent_img()%>" class="pagination-img">
							</a>
						</div>
						<%
						}
						%>
					</div>
				</table>


			</div>
				<!-- 페이지 넘기는 버튼-->
	<div class="Pagebutton">
	
		<%
		//1. 페이지네이션 링크를 생성해줄것이고, 링크는 page 값에 따라서 다르게 보일 것
		int totalEventList = eventPaginationDAO.getTotalProducts(); //전체 제품 가져오기
		int totalPages = (int) Math.ceil((double) totalEventList / pageSize);

		for (int i = 1; i <= totalPages; i++) {
		%>
		<a href="<%=request.getRequestURI()%>?page=<%=i%>"><%=i%></a>
		<%
		}
		%>
	</div>
		</div>
	</div>







</body>
</html>