<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의수정 실패</title>
<link rel="stylesheet" href="./saCss/saCss.css">
</head>
<body>
<img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">
 <!--로그인 버튼-->
    <div style="text-align: right; width: 1215px;">
    <%
    	if(session.getAttribute("email")!=null){
    %>
	 	<button type="button" onclick="location.href='logout.jsp'" style="width:75px;">로그아웃</button>
	 	 <h>|</h>
	    <button type="button" onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'" style="width:100px;">마이페이지</button>
	 <%
    	}else{
	 %>
		 <button type="button" onclick="location.href='login.jsp'" style="width:60px;">로그인</button>
		 <h>|</h>
	    <button type="button" onclick="location.href='join.jsp'" style="width:100px;">회원가입</button>
	  <%
    	}
	  %>
	    
	</div>
	<div id="buttons">
		<ul>
			<li onclick="location.href='Event_List.jsp'">행사정보</li>
			<li onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li onclick="location.href='Qna_List.jsp'">QNA</li>
			<li onclick="location.href='review_list.jsp'">후기</li>
		</ul>
	</div>
<h3>문의글 수정에 실패했습니다. 다시 시도해주세요.</h3>

<button type="button" onclick="location.href='Qna_List.jsp'">돌아가기</button>

</body>
</html>