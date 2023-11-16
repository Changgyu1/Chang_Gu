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
.center-register {
	width: 100%;
	    margin: 0px 0px 0px -83px;
}

table, td, th {
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
}

.register-Div {
    position: absolute;
    padding: 20px;
    bottom: -25%;
    left: 56%;
    transform: translate(-50%, -50%);
    width: 900px;
}

input[type="text"], input[type="email"], input[type="password"] {
	    width: 200px;
        margin: 20px -79px 22px -378px;
	height: 27px;
}

.test {
	width: 50%;
}
.checkButton{
    margin: 0px 0px 0px -230px;
width: 100px;
    text-align: center;
    height: 30px;
    box-sizing: border-box;
}
}
</style>
</head>
<body>
	<div id="wrapper">
		<!--로고이미지-->
		<img src="./image/로고1.png" id="logo"
			onclick="location.href='home.jsp'">
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
						<table class="center-register">
							<thead class="registerInfo">
								<%
										String useremail=request.getParameter("email");
										if(useremail!=null){
									%>
										<form action="registerEmailCheck" method="post">
										<input type="email" id="email" name="email" value="<%=request.getParameter("email")%>"
										class="input-reg" required></th>
										<input type="submit" value="중복확인" id="emailCheck" name="emailCheck" class="checkButton" disabled></th>
										</form>									
									<%}else{%>
										
										<form action="registerEmailCheck" method="post">
										<input type="email" id="email" name="email"
											class="input-reg" required></th>
										<input type="submit" value="중복확인" id="emailCheck" name="emailCheck" class="checkButton"></th>
										</form>
										<%} %>
							</thead>
							<tbody>
					<form action="register" method="post" onsubmit="return Check()">
						<input type="hidden" id="email" name="email" value="<%=request.getParameter("email")%>">
						
								<tr>
									<td>* 이름</td>
									<td><input type="text" id="name" name="name"
										class="input-reg" required></td>
								</tr>
								<tr>
									<td>* 연락처</td>
									<td><input type="text" id="phonenumber" name="phonenumber"
										class="input-reg" required></td>
								</tr>
								<tr>
									<td>* 비밀번호</td>
									<td><input type="password" id="password" name="password"
										class="input-reg" required></td>
								</tr>
								<tr>
									<th class="test" colspan="5">비밀번호는 숫자,소문자,특수문자가 하나이상씨 포함해야함</th>
				
								</tr>
							<tr>
								<td>* 비밀번호 확인</td>
								<td><input type="password" id="passwordcheck"
										name="passwordcheck" class="input-reg" required></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" onclick="Check()" value="회원가입" id="register-add"
							style="width: 80px; height: 30px;">
				</form>
				</div>
			</div>
		</div>

	</div>
		 <script language="javascript">
				function Check() {
					var password = document.getElementById("password");
					var passwordCheck = document
							.getElementById("passwordcheck");
					var name = document.getElementById("name");
					var email = document.getElementById("email");

					var passwordCh = RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/)
					var nameCh = RegExp(/^[가-힣]+$/);
					var nameKo = /[\s]/g;
					// !password.test(passwordCheck.value) =  test는 passwordCheck.value의 값을 검색해줌
					if (!passwordCh.test(password.value)) {
						alert("비밀번호를 형식에 맞게 적어주세요");
						passwordCheck.value = "";
						passwordCheck.focus();
						return false;
					}

					else if (password.value != passwordCheck.value) {
						alert("비밀번호가 일치하지 않습니다.");
						password.value = "";
						passwordCheck.value = "";
						password.focus();
						return false;
					}

					else if (!nameCh.test(name.value)) {
						alert("이름은 한글로만 입력이 가능합니다.");
						name.value = "";
						name.focus();
						return false;
					}

				};
			</script>
			</body>
</html>