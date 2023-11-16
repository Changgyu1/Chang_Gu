<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="gaeul.review.festivalDTO" %>
     <%@ page import="gaeul.review.selectDAO" %>
     <%@ page import="gaeul.review.deleteDAO" %>
     <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GO, festival 후기게시판</title>
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
		 <button type="button" onclick="location.href='login.jsp'" style="background:none;border:none;width:60px;">로그인</button>
		 <h>|</h>
	    <button type="button" onclick="location.href='join.jsp'" style="background:none;border:none;width:100px;">회원가입</button>
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
		
	
	 	 <div id="background"  >
	 	 
	 	 <!-- 축제 정보 검색하기 -->
	 	 
	 	 
	 	 <div id="searchbox" style="margin-left:90px;margin-top:10px;">
	 	 
	 	 	<select class="form-select" name="searchField" style="height:25px;border-radius:5px;">
								<option value="0">선택</option>
								<option value="review_title">[1]해달축제</option>
								<option value="review_title">[2]뭔헨 필하모익~클라스~강</option>
								<option value="review_title">[3]임영웅의 콘서트</option>
								<option value="review_title">[4]이무진의 전국투어 콘서트</option>
								<option value="review_title">[5]벤허</option>
								<option value="review_title">[6]렌트</option>
								
						</select>
						
						<!-- 리스트 검색창 -->
						<form method="post" action="review_searchlist.jsp">
							<input type="text" name="event_number" style="margin-top:10px;border-radius:5px;border:2px solid gray;width:400px;height:25px;" placeholder="검색할 축제번호를 입력해주세요 !"> 
							
							<!-- 검색버튼 -->
							<input type="submit" value="검색" style="width:80px;height:30px;border-radius:5px;border:2px solid gray;">
						</form>
		 	 
 	 	</div>
 	 	
 	 	<div id="reviewbox" style="margin-bottom:50px;">
 	 	<div id="reviewlist" >
            <table id="list" >
            
                <tr style="font-size:15px; height:30px;">
                <!-- 열 내용 -->
			       <th style="width:70px;background-color:rgb(223, 223, 224);">행사</th>
			        <th style="width:70px;background-color:rgb(223, 223, 224);">리뷰 제목</th>
			       <th style="width:50px;background-color:rgb(223, 223, 224);">리뷰 작성일</th>
                </tr>
        
        <%
                selectDAO fDAO = new selectDAO();
			        ArrayList<festivalDTO> list =fDAO.List();
			       
			        for(festivalDTO f: list){
			       	String content=f.getReview();
			       	String title=f.getReview_title();
			       	Date date=f.getReviewdate();
			       	String eventname=f.getEvent_name();
                %>
                
                <!-- 행 내용 -->
        		<tr style="font-size:13px;background:white; " >
        		<td style="padding:5px;;"><%= eventname%></td>
                <td style="width:300px"><a href="choose_result.jsp?review_number=<%=f.getReviewnumber()%>"><%=title%></a></td>
                <td><%=date%></td>
            
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