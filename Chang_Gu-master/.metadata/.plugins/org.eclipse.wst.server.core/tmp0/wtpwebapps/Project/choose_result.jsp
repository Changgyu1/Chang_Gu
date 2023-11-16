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
<meta charset="utf-8">
<title>GO, festival 후기 상세보기</title>
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
		
	 
	
 	 	
 	 	<%
 	 	 	selectDAO dao = new selectDAO();
 			festivalDTO friview = new festivalDTO();
 			int review_number = Integer.parseInt(request.getParameter("review_number"));
 			ArrayList<festivalDTO> reviewlist=dao.listreview(review_number);
 			
 	 	 	 	%>
	
    
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
		        
		        
		        <!-- 가운데 가장 큰 박스 -->
					<div id="background" style="height:550px;">
				
					<h3 style="text-align:center">[<%=eventname %>]</h3>
			 	 	
			 	 	<div id="reviewbox">
		        
			        <div style=" font-size:14px;box-shadow:0px 1px 3px gray; width:900px; margin-left:auto; margin-right:auto; height:160px;">
			        <p style="float:left;font-size:17px;font-weight:600;margin-left:20px;"> <%= title %></p>
			        <p style="float:right;margin-right:20px;">작성일 : <%=date%></p>
			        <p style="float:left; background:rgb(247, 247, 249);width:850px;height:80px;margin-left:24px;padding-top:15px;margin-top:1px; "><%=content %></p>
			        <br>
			        
		    	<%
		    }
		    %>
		    
   
    
    	
				
				<%
			    if(session.getAttribute("email")!=null){
			    %>
				
				<input style="margin-top:5px; width:85px;float:right;" type="submit" value="리뷰 삭제" onclick="location.href='review_delete.jsp?rnum=<%=rnum%>'">		
				<input style="margin-top:5px; width:85px; float:right; margin-right:10px;" type="submit" value="리뷰 수정" onclick="location.href='review_update.jsp?rnum=<%=rnum%>'">
			
			
			
				<div style="height:100px;">	
				<!-- 댓글서블렛으로 데이터 전송 -->
				<form action="insertCommentDAO" method="post">
				<!-- 댓글입력창 -->
		 	 	<input id="comment_content" type="text" name="comment_content" style="text-align:center;float:left;border:1px solid gray;border-radius:5px;height:70px;margin-top: 10px;margin-bottom: 10px; width:700px" required placeholder="댓글을 입력해주세요.">
		 	 	<br>
		 	 	<br>
		 	 	<!-- 비밀번호 입력창 -->
		 	 	<input type="password" name="comment_password" style="text-align:center; float:right;border:1px solid gray;border-radius:5px;height:20px;width:175px; margin-top:5px;" required placeholder= "비밀번호를 입력해주세요.">
		 	 	<input type="hidden" name="rnum" value="<%=rnum%>">
		 	 	<!-- 댓글등록 버튼 -->
		 	 	<input type="submit" value="댓글 등록하기" style="float:right;border-radius:5px;margin-top:4px;height:26px;width:180px;">
		 	 	</form>
		 	 	</div>			
				<%
			    }else{
				%>
				<br>
				
				<!-- 댓글서블렛으로 데이터 전송 -->
				<form action="insertCommentDAO" method="post">
				<!-- 댓글입력창 -->
		 	 	<input id="comment_content" type="text" name="comment_content" style="float:left;border:1px solid gray;border-radius:5px;height:70px;margin-top: 10px;margin-bottom: 10px; width:700px" required placeholder="댓글을 입력해주세요.">
		 	 	<br>
		 	 	<br>
		 	 	<!-- 비밀번호 입력창 -->
		 	 	<input type="password" id="comment_password" name="comment_password" required placeholder= "비밀번호">
		 	 	<input type="hidden" name="rnum" value="<%=rnum%>">
		 	 	<!-- 댓글등록 버튼 -->
		 	 	<input type="submit" value="댓글 등록하기" style="float:right;border-radius:5px;margin-top:4px;height:26px;width:180px;">
		 	 	</form>

				<%
			    }
				%>
				<div class="commentbox" >
				
				<!-- 댓글이 담길 곳 -->
			
				
			<table style="text-align:left;padding-left:15px;">
 				<%
				select_comment_DAO selectdao = new select_comment_DAO();
				ArrayList<commentDTO> listcomment = selectdao.commentlist(review_number);
				
				//댓글 검색결과
				for(int i=0; i<listcomment.size(); i++){
					commentDTO riviewarray= (commentDTO) listcomment.get(i);
					int conum=riviewarray.getComment_number();
					String content=riviewarray.getComment_content();
					Date codate =riviewarray.getComment_date();
				%>
					<tr style="padding:10px;">
						<td style="width:720px;border:none;background-color:rgb(243, 241, 241);font-size:13px;"><%=content %></td>
						<td style="width:80px;border:none;background-color:rgb(243, 241, 241);font-size:12px;"><%=codate %></td>
						<td style="border:none;background-color:rgb(243, 241, 241);"><input type="submit" value="삭제하기"  onclick="location.href='comment_delete.jsp?conum=<%=conum%>'"></td>	
							
						
					</tr>
					
				<%
				}
				%>
				</table>
  			  </div>
  			  
  			  <br>
  		
 	 	</div>
 	
 	 	
	</div>
	
	</div>
    
</body>

</html>