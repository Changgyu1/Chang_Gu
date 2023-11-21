<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="gaeul.review.festivalDTO" %>
     <%@ page import="gaeul.review.selectDAO" %>
     <%@ page import="gaeul.review.deleteDAO" %>
     <%@ page import="java.util.*" %>
     <%@ page import="gaeul.review.commentDTO" %>
     <%@ page import="gaeul.review.select_comment_DAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 검색 조회</title>
<link rel="stylesheet" href="review.css">
</head>
<body>


		<!-- 로고 이미지 -->
	<img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">


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
		 <button type="button" onclick="location.href='login.jsp'" style="width:60px;background:none;border:none;">로그인</button>
		 <h>|</h>
	    <button type="button" onclick="location.href='join.jsp'" style="width:100px;background:none;border:none;">회원가입</button>
	    
	  <%
	  }
	  %>
	    
	</div>

	<div id="buttons">
	<!--로그인 버튼-->
   <ul style="list-style:none;">
			<li style="float:left;margin-left:170px;" onclick="location.href='Event_List.jsp'">행사정보</li>
			<li style="float:left;margin-left:170px;" onclick="location.href='reservation_search.jsp'">예약조회</li>
			<li style="float:left;margin-left:170px;" onclick="location.href='Qna_List.jsp'">QNA</li>
			<li style="float:left;margin-left:170px;" onclick="location.href='review_list.jsp'">후기</li>
		</ul>
	</div>
		
	 
	<!-- 가운데 가장 큰 박스 -->
	<div id="background">
	
		<h3 style="text-align:center">검색결과</h3>
 	 	
 	 	<div id="reviewbox">
 	 	
 	 	<%
 	 	 	selectDAO dao = new selectDAO();
 			festivalDTO friview = new festivalDTO();
 			int event_number = Integer.parseInt(request.getParameter("event_number"));
 			ArrayList<festivalDTO> reviewlist=dao.searchlist(event_number);
 			
 	 	 	 	%>
		<div>
			<table id=list>
		    <tr style="font-size:14px;">
		        <th>행사</th>
		        <th>리뷰 제목</th>
		        <th>리뷰 작성일</th>
		    </tr>
		    
		    <%
		    		//검색창에서 리뷰 검색결과
		    		int rnum=0;
		            for(int i=0; i<reviewlist.size(); i++){
		            	festivalDTO riviewarray= (festivalDTO) reviewlist.get(i);
		            	rnum = riviewarray.getReviewnumber();
		            	String content=riviewarray.getReview();
		            	String title=riviewarray.getReview_title();
		            	Date date=riviewarray.getReviewdate();
		            	String eventname = riviewarray.getEvent_name();
		            	
				        %>
				        
					        <!-- 리뷰 리스트 -->
					  		<tr style="font-size:14px;background:white;">
					        <td style="background:white;"><%=eventname %></td>
					        <td><a href="choose_result.jsp?review_number=<%=rnum%>"><%=title%></a></td>
					        <td><%=date %></td>
					        </tr>
				    	<%
				    }
				    %>
				    
		    </table>
	  		</div>
 	 	</div>
	</div>
</body>

</html>
</html>