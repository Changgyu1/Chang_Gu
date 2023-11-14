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
.pagExplain{

}
 details{margin-bottom:10px;}
  details summary{    padding: 0 10px;
    background: antiquewhite;
    color: darkgray;
    height: 35px;
    line-height: 35px;
    font-weight: bold;
    cursor: pointer;
    width: 97%;
    text-align: center;}
    details div{
    text-align: center;
    }
    .buttontype{
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
		<!-- �ΰ� �̹��� -->
		<img src="./image/�ΰ�1.png" id="logo">

		<!--�α��� ��ư-->
		<div style="text-align: right; width: 1215px;">
			<%
			if (session.getAttribute("email") != null) {
			%>
			<button type="button" onclick="location.href='logout.jsp'"
				style="width: 75px;">�α׾ƿ�</button>
			<h>|</h>
			<button type="button"
				onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'"
				style="width: 100px;">����������</button>
			<%
			} else {
			%>
			<button type="button" onclick="location.href='login.jsp'"
				style="width: 60px;">�α���</button>
			<h>|</h>
			<button type="button" onclick="location.href='register.jsp'"
				style="width: 100px;">ȸ������</button>
			<%
			}
			%>
			
			

		</div>

		<!-- �޴��� -->
		<div id="buttons">
			<ul>
				<li onclick="location.href='review_list.jsp'">�ı�</li>
				<li onclick="location.href='Qna_List.jsp'">QNA</li>
				<li onclick="location.href='reservation_search.jsp'">������ȸ</li>
				<li onclick="location.href='Event_List.jsp'">�������</li>
			</ul>
		</div>


		<!-- ��� ���� ū �ڽ� -->
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
							<th class="jb-th-1"><img src="./image/����������.png"
								style="width: 20px; height: 20px;"> �� �� :</th>
							<th><%=eventPosting.getEvent_location()%></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="./image/����������.png"
								style="width: 20px; height: 20px;"> ��� �Ⱓ :</td>
							<td><%=eventPosting.getEvent_day()%></td>
						</tr>
						<tr>
							<td><img src="./image/����������.png"
								style="width: 20px; height: 20px;"> ���� �ð� :</td>
							<td><%=eventPosting.getEvent_time()%></td>
						</tr>
						<tr>
							<td>�� �� :</td>
							<td><%=eventPosting.getEvent_age()%></td>
						</tr>
						<tr>
							<td>�� �� :</td>
							<td><%=eventPosting.getEvent_price()%></td>
						</tr>

					</tbody>
				</table>
				<div class="buttontype">
				
					<input type="button" class="reserButton" value="�����ϱ�" onclick="location.href='reservation.jsp?event_number=<%=eventPosting.getEvent_number()%>'">
					
					<input type="submit" value="�ı⺸��" class="reserButton" onclick="location.href='choose_list.jsp?event_number=<%=eventPosting.getEvent_number()%>'">
					
					<input type="submit" value="��ϰ���" class="reserButton" onclick="location.href='Event_List.jsp'"> 
					<%
					if (session.getAttribute("email").equals("kiga1234@kiga1234")) {
					%>
					<input type="submit" value="�����ϱ�" class="reserButton" onclick="location.href='Event_Update.jsp?event_number=<%=eventPosting.getEvent_number()%>'">
			
					<input type="submit" value="�����ϱ�" class="reserButton" onclick="location.href='Event_delete_success.jsp?event_number=<%=eventPosting.getEvent_number()%>'">
				<%} %>

			</div>
			</div>


	<!-- ������ �ѱ�� ��ư-->

	</div>

<details class="pagExplain">
    <summary>�ڼ��� ����</summary>
    <div>
	<%=eventPosting.getEvent_explain() %>
    </div>
</details>

</body>
</html>