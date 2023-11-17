<%@page import="java.io.PrintWriter"%>
	<%@ page import="register.event.registerDAO" %>
	<%@ page import="register.event.registerDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!DOCTYPE html>
<html>

<head>
<title>GO, FESTIVAL 예약조회</title>
<link rel="stylesheet" href="./hjCss/main.css">
<link rel="stylesheet" href="./hjCss/reservationSearchInfo.css">
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
	<li id="menu" onclick="location.href='review_list.jsp'">후기</li>
				<li id="menu" onclick="location.href='Qna_List.jsp'">QNA</li>
				<li id="menu" onclick="location.href='reservation_search.jsp'">예약조회</li>
				<li id="menu" onclick="location.href='Event_List.jsp'">행사정보</li>
			</ul>
		</div>

<%
String phonenumber = request.getParameter("phoneNumber");
String email = request.getParameter("email");
	registerDAO dao = new registerDAO();
	registerDTO dto = new registerDTO();
	String result = dao.findPassword(phonenumber, email);
	if(result == null)	{
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('존재하지 않는 정보입니다. 다시 입력해주세요!')");
		pw.println("location.href = 'findPassword.jsp'");
		pw.println("</script>");
	} else{
%>
		<div id="background">
			<h3 style="text-align: center; padding-top: 20px;">비밀번호 재설정</h3>
			<div id="reviewbox">
				<!-- 이메일 찾기 -->
				<div id="r_search">
					
				<form action="findPasswordUpdate.jsp" method="post">
							<label for="password">비밀번호 재설정 :</label>
							<input type="password" id="password" name="password" required><br>
							<input type="hidden" name="email" value="<%=email%>">
						<input type="submit" value="확인" onclick="Check()">
				</form>
				</div>
			</div>
			<%} %>
		</div>
		
		
		    <script language="javascript">
        function Check() {
            var password = document.getElementById("password");


            var passwordCh = RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/)
            // !password.test(passwordCheck.value) =  test는 passwordCheck.value의 값을 검색해줌
            if (!passwordCh.test(password.value)) {
                alert("비밀번호를 형식에 맞게 적어주세요");
                password.value = "";
                password.focus();
                return false;
            }

            
        };
        </script>
</body>
</html>