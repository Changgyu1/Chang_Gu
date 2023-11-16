<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="sa_event.Qna" %>
<%@ page import="sa_event.QnaDAO" %>
<%@ page import="sa_event.QnaComment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 리스트</title>
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


	<div id="background">
	 
 	
		<div id="posts">
        <!--게시물 추가하는 공간-->
        </div>
        <h3 style="text-align:center;">문의 게시판</h3>
        <div id="whitebox">
       	<div class="test_list">
        <table id="list">
         		 <tr>
         		 
                   	<th style="text-align:center;">문의번호 </th>
					<th style="text-align:center;">제목 </th>
					<th style="text-align:center;">이름 </th>
					<th style="text-align:center;">이메일 </th>
                </tr>
                <%
                QnaDAO qnaDAO = new QnaDAO();
                ArrayList<Qna> qnas = qnaDAO.getChoiceQna();
                for(Qna q : qnas) {
                %>
              	<tr>
              		
              	<td> 
	              	<%= q.getQna_number() %> 
	              	
              	</td>               
	
                	<td><a href="QnaDetailServlet?qna_number=<%=q.getQna_number()%>">
                	<%=q.getQna_title() %>
                	</a>
                	</td>
                	<td><%=q.getQna_name() %></td>
               		<td><%=q.getQna_email() %></td>
              		
                <tr>
                <%
               	}
                %>
				</tr>
				
            </table>
            </div>
    	<div class="test">
      	<input type="submit" value="문의 작성" style="margin-top:300px; width: 85px; height: 34px; border-radius: 5px;"
      	onclick="location.href='Qna_Write.jsp'">
      	</div>
   	 	
   	 	</div>
   	 </div>
        
</body>
</html>

