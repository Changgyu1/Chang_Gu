<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.postingImg_Detail {
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
.reserButton2{
    float: left;
    border: none;
    background-color: moccasin;
    width: 140px;
    height: 40px;
    text-align: center;
    margin: 0px -4px 8px 86px
}
.reserButton3{
    float: left;
    border: none;
    background-color: moccasin;
    width: 140px;
    height: 40px;
    text-align: center;
    margin: -60px -25px 22px 88px;
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
    .buttonLeft{
    float: left;
    }
    .test{
    margin-top: -80px;
    }
    .Event_Detail_Div{
        margin-bottom: 182px;
    }
	</style>

</head>

<script>
var testString = "<%=session.getAttribute("event_day") %>";
var number = /[^0-9]/g;
var result = testString.replace(number, "");

var result3 = result.substr(8);


const date = new Date();

const year = date.getFullYear();
const month = ('0' + (date.getMonth() + 1)).slice(-2);
const day = ('0' + date.getDate()).slice(-2);
const dateStr = year + month +  day;

const num1 = parseInt(dateStr);
const num2 = parseInt(result3);
console.log(num1);
console.log(num2);

const target = document.getElementById('target');

function limit(){
	if(num1 > num2){
		alert('에약날짜가 지났습니다')
		return false;
	} else{
		location.href = 'reservation.jsp?event_number=<%=request.getParameter("event_number")%>'
		return true;
	}
}
</script>

<body>
	<div class="Event_Detail_Div">
		<!-- 로고 이미지 -->
		<img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">

		<!--로그인 버튼-->
	 	<div style="text-align: right; width: 1215px;">
    	<% if(session.getAttribute("email")!=null){ %>
	 		<button type="button" onclick="location.href='logout.jsp'" style="background:none;border:none;width:75px;">로그아웃</button>
	 	 	<h>|</h>
	    	<button type="button" onclick="location.href='mypageServlet?email=<%=session.getAttribute("email")%>'" style="background:none;border:none;width:100px;">마이페이지</button>
	 	<% }else{ %>
			 <button type="button" onclick="location.href='login.jsp'" style="background:none;border:none;width:60px;">로그인</button>
		 	<h>|</h>
	    	<button type="button" onclick="location.href='join.jsp'" style="background:none;border:none;width:100px;">회원가입</button>
	  	<% } %>
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
			<div>
				<img src="<%=session.getAttribute("event_img") %>" alt="event_img" class="postingImg_Detail">
			</div>
			<h1 class="postingName"><%=session.getAttribute("event_name")%></h1> <br>
			<div class="sese3">
				<table>
					<thead>
						<tr>
							<th><img src="./image/지도아이콘.png" style="width: 20px; height: 20px;"> 장 소 :</th>
							<th><%=session.getAttribute("event_location")%></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="./image/달력.png" style="width: 20px; height: 20px;"> 행사 기간 :</td>
							<td><%=session.getAttribute("event_day")%></td>
						</tr>
						<tr>
							<td><img src="./image/시계.png" style="width: 20px; height: 20px;"> 진행 시간 :</td>
							<td><%=session.getAttribute("event_time")%></td>
						</tr>
						<tr>
							<td>연 령 :</td>
							<td><%=session.getAttribute("event_age")%>세 이상</td>
						</tr>
						<tr>
							<td>가 격 :</td>
							<td><%=session.getAttribute("event_price")%>원</td>
						</tr>

					</tbody>
				</table>
				<div class="buttontype">
					<div class="buttonLeft">
						<div>
							<input type="button" class="reserButton" name="target" value="예약하기" onclick="return limit()">
					
						    <input type="submit" class="reserButton" value="후기보기" onclick="location.href='review_searchlist.jsp?event_number=<%=request.getParameter("event_number")%>'">
									    
				   			<input type="submit" class="reserButton" value="후기 작성하기" onclick="location.href='review_write.jsp?event_number=<%=request.getParameter("event_number")%>'">
				    
				    	</div>
				   		<div>
				    		<input type="submit" class="reserButton2" value="문의하기" onclick="location.href='Qna_Write2.jsp?event_number=<%=request.getParameter("event_number")%>'">
					
							<input type="submit" class="reserButton2" value="목록가기"  onclick="location.href='Event_List.jsp'"> 
						</div>
					</div>
				</div>
			</div>
			
	<!-- 페이지 넘기는 버튼-->
		</div>
		<details class="pagExplain">
   			<summary>자세히 보기</summary>
    		<div>
				<%=session.getAttribute("event_explain") %>
    		</div>
		</details>
		<div class="test">
	<% if (session.getAttribute("email") != null ) {
		if(session.getAttribute("email").equals("kiga1234@kiga1234")){ %>
			<form action="EventServlet" method="post">
				<input type="hidden" name="event_number" value="<%=request.getParameter("event_number")%>">
				<input type="submit" name="moveupdate" value="수정하기" class="reserButton3">
			</form>
			<form action="EventServlet" method="post">
				<input type="hidden" name="event_number" value="<%=request.getParameter("event_number")%>">
    			<input type="submit" name="delete" value="삭제하기" class="reserButton3">
			</form>
			<%} } %>
		</div>
	</div>
</body>
</html>