<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="register.event.registerDAO"%>
<%@ page import="register.event.registerDTO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약</title>
<link rel="stylesheet" type="text/css" href="./css/event.css">
	<style>
	.center-register{
	   width:500px; 
    margin: auto;
    
	}
	table, td, th {
    border-right:none;

border-left:none;

border-top:none;

border-bottom:none;
    
}
.register-Div{
    position: absolute;
    padding: 20px;
    bottom: -26%;
    left: 50%;
    transform: translate(-50%, -50%);
}
input[type="text"], input[type="email"], input[type="password"] {
	    width: 300px;
    margin: 29px 3px 22px 20px;
    height: 27px;
}
	</style>
</head>
<body>
	<div id="wrapper">
		<!--로고이미지-->
		<img src="./image/로고1.png" id="logo">
		<!--로그인 버튼-->
		<div style="text-align: right; width: 1215px;">
			<%
			if (session.getAttribute("email") != null) {
			%>
			<button type="button" onclick="location.href='logout.jsp'"
				style="width: 75px;">로그아웃</button>
			<h>|</h>
			<button type="button"
				onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'"
				style="width: 100px;">마이페이지</button>
			<%
			} else {
			%>
			<button type="button" onclick="location.href='login.jsp'"
				style="width: 60px;">로그인</button>
			<h>|</h>
			<button type="button" onclick="location.href='register.jsp'"
				style="width: 100px;">회원가입</button>
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

			<h2 style="padding-top: 15px">회원가입</h2>
			<!-- 안에 글넣는 하얀 박스-->
			<div id="reviewbox">
				<!-- 회원가입 -->
				<div class="register-Div">
				<form action="register" method="post" onsubmit="return Check()">
					<table class="center-register">
						<thead class="registerInfo">
							<tr>
								<th>* 이메일</th>
								<th><input type="email" id="email" name="email" class="input-reg" required></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>* 이름</td>
								<td><input type="text" id="name" name="name" class="input-reg" required> </td>
							</tr>
							<tr>
								<td>* 연락처</td>
								<td><input type="text" id="phonenumber" name="phonenumber" class="input-reg" required></td>
							</tr>
							<tr>
								<td>* 비밀번호</td>
								<td><input type="password" id="password" name="password" class="input-reg" required></td>
							</tr>
							<tr>
								<td>* 비밀번호 확인</td>
								<td><input type="password" id="passwordcheck" name="passwordcheck" class="input-reg" required></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" onclick="Check()" value="회원가입"
						style="width: 80px; height: 30px;">
				</form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>