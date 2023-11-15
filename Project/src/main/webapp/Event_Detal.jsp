<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="park.event.EventPosting"%>
<%@ page import="park.event.EventPostingDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/event.css">
<style>
.postingName {
	margin: -30px 0px 35px 0px;
}

table, td, th, tbody, thead {
	border-collapse: collapse;
	border: none;
	width: 500px;
	margin: auto;
}

.postingImg {
	width: 400px;
	height: 300px;
	padding: 62px;
	float: left;
}

td, th {
	text-align: left;
	padding: 15px;
	font-size: 18px;
	margin: 0px 0px 0px 0px;
}

.sese3 {
	margin: 0px 173px 0px 0px;
}

.reserButton {
	float: left;
	border: none;
	background-color: moccasin;
	width: 140px;
	height: 40px;
	text-align: center;
	margin: 0px -4px 8px 29px;
}

.pagExplain {
	
}

details {
	margin-bottom: 10px;
}

details summary {
	padding: 0 10px;
	background: antiquewhite;
	color: darkgray;
	height: 35px;
	line-height: 35px;
	font-weight: bold;
	cursor: pointer;
	width: 97%;
	text-align: center;
}

details div {
	text-align: center;
}

.buttontype {
	margin: 20px 0px 0px 0px;
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
		<img src="./image/로고1.png" id="logo"
			onclick="location.href='home.jsp'">

		<!--로그인 버튼-->
		<div style="text-align: right; width: 1215px;">

			<%
			//로그인시 후기 보기만 가능
			if (session.getAttribute("email") != null) {
			%>
			<input type="submit" value="후기보기"
				onclick="location.href='review_searchlist.jsp?event_number=<%=eventPosting.getEvent_number()%>'">
			<input type="submit" value="후기 작성하기"
				onclick="location.href='review_write.jsp?event_number=<%=eventPosting.getEvent_number()%>'">
			<%
			//비로그인 시 후기 작성,후기 보기 가능
			} else {
			%>
			<input type="submit" value="후기보기"
				onclick="location.href='review_searchlist.jsp?event_number=<%=eventPosting.getEvent_number()%>'">

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
			<h1 class="as"></h1>
			<img src="">


			<div class="sese">
				<img src="<%=eventPostingDAO.Image(event_number)%>" alt="event_img"
					class="postingImg">


			</div>

			<h1 class="postingName"><%=eventPosting.getEvent_name()%></h1>
			<br>
			<div class="sese3">
				<table class="sese2">
					<thead>
						<tr>
							<th class="jb-th-1"><img src="./image/지도아이콘.png"
								style="width: 20px; height: 20px;"> 장 소 :</th>
							<th><%=eventPosting.getEvent_location()%></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="./image/지도아이콘.png"
								style="width: 20px; height: 20px;"> 행사 기간 :</td>
							<td><%=eventPosting.getEvent_day()%></td>
						</tr>
						<tr>
							<td><img src="./image/지도아이콘.png"
								style="width: 20px; height: 20px;"> 진행 시간 :</td>
							<td><%=eventPosting.getEvent_time()%></td>
						</tr>
						<tr>
							<td>연 령 :</td>
							<td><%=eventPosting.getEvent_age()%></td>
						</tr>
						<tr>
							<td>가 격 :</td>
							<td><%=eventPosting.getEvent_price()%></td>
						</tr>

					</tbody>
				</table>
				<div class="buttontype">

					<input type="button" class="reserButton" value="예약하기"
						onclick="location.href='reservation.jsp?event_number=<%=eventPosting.getEvent_number()%>'">

					<input type="submit" value="후기보기" class="reserButton"
						onclick="location.href='choose_list.jsp?event_number=<%=eventPosting.getEvent_number()%>'">

					<input type="submit" value="목록가기" class="reserButton"
						onclick="location.href='Event_List.jsp'">
					<%
					if (session.getAttribute("email") != null && session.getAttribute("email").equals("kiga1234@kiga1234")) {
					%>
					<input type="submit" value="수정하기" class="reserButton"
						onclick="location.href='Event_Update.jsp?event_number=<%=eventPosting.getEvent_number()%>'">

					<input type="submit" value="삭제하기" class="reserButton"
						onclick="location.href='Event_delete_success.jsp?event_number=<%=eventPosting.getEvent_number()%>'">
					<%
					}
					%>

				</div>
			</div>


			<!-- 페이지 넘기는 버튼-->

		</div>

		<details class="pagExplain">
			<summary>자세히 보기</summary>
			<div>
				<%=eventPosting.getEvent_explain()%>
			</div>
		</details>
</body>
</html>