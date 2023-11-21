<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약</title>
    <link rel="stylesheet" type="text/css" href="./css/event.css">
    <style>
        .container {
            width: 50%;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .label-input-container {
                width: 900px;
            box-sizing: border-box;
            display: flex;
            flex-direction: row;
            align-items: center;
            margin-bottom: 10px;
        }

        .label-input-container label {
            padding: 10px 0;
            width: 20%;
            box-sizing: border-box;
            text-align: right;
        }

        .label-input-container input {
padding: 10px;
    width: 300px;
    box-sizing: border-box;
    margin: -16px -46px 0px 97px;
        }

        .label-input-container .checkButton {
            padding: 10px;
            width: 20%;
            box-sizing: border-box;
        }

        #register-add {
            width: 60%;
        }

        .register-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .checkButton {
            margin-left: 10px;
        }
        label{
        text-align:left;
            margin: 0px 0px 22px 87px;
        }
        input{
        width: 300px;
        }
        #register-add{
   margin: -11px 0px 0px 97px;
    width: 110px;
    height: 36px;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <!-- 로고이미지 -->
        <img src="./image/로고1.png" id="logo" onclick="location.href='home.jsp'">
        <!-- 로그인 버튼 -->
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
            <!-- 안에 글넣는 하얀 박스 -->
            <div id="reviewbox">
                <!-- 회원가입 -->
                
                    <div class="container">
                        
                            <form action="registerEmailCheck" method="post">
                                 <div class="label-input-container">
								        <label for="email">* 이메일</label>
										<%
									//String notNull = "a";
									String useremail=request.getParameter("email");
									int notNull;
									try{
										notNull = Integer.parseInt(request.getParameter("isTrue"));										
									}catch(NumberFormatException e){
										e.printStackTrace();
										notNull = 0;
									}
									System.out.println(notNull);
									System.out.println(useremail);
									if(useremail!=null && notNull==1){
								%>
								<script>alert("사용가능한 아이디입니다.")</script>
								<input type="email" id="email" name="email" value="<%=request.getParameter("email")%>" class="input-reg" required readonly></th>
								<input type="submit" value="중복확인" id="emailCheck" name="emailCheck" class="checkButton" disabled></th>						
								<%}else if(useremail==null && notNull==0){ %>
									<input type="email" id="email" name="email" class="input-reg" required ></th>
								<input type="submit" value="중복확인" id="emailCheck" name="emailCheck" class="checkButton" ></th>
								<%}else {%>
								<script>alert("중복된 아이디입니다.")</script>
								<input type="email" id="email" name="email" class="input-reg" required ></th>
								<input type="submit" value="중복확인" id="emailCheck" name="emailCheck" class="checkButton" ></th>
								<%} %>
									
								    </div>
								    
					<script>

					</script>
										
										
								     </form>
								     <form action="register" method="post" onsubmit="return Check()" class="register-form">
								     <input type="hidden" id="email" name="email" value="<%=request.getParameter("email")%>">
                                <!-- 나머지 입력창에 대한 label-input-container 추가 -->
                                <div class="label-input-container">
                                    <label for="name">* 이름</label>
                                    <input type="text" id="name" name="name" required>
                                </div>
                                <div class="label-input-container">
                                    <label for="phonenumber">* 연락처</label>
                                    <input type="text" id="phonenumber" name="phonenumber" required>
                                </div>
                                <div class="label-input-container">
                                    <label for="password">* 비밀번호</label>
                                    <input type="password" id="password" name="password" required><br>
                                </div>
                                <p>비밀번호는 숫자, 소문자, 특수문자가 하나 이상 포함되어야 합니다.</p>
                                <div class="label-input-container">
                                    <label for="passwordcheck">* 비밀번호 확인</label>
                                    <input type="password" id="passwordcheck" name="passwordcheck" required>
                                </div>
                                <input type="submit" onclick="Check()" value="회원가입" id="register-add" ><br>
                            
                        </form>
                    </div>
               
            </div>
        </div>
    </div>
    <script language="javascript">
        function Check() {
            var password = document.getElementById("password");
            var passwordCheck = document.getElementById("passwordcheck");
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
        

        function disableEmailInput() {
            var emailInput = document.getElementById("email");
            var emailCheckButton = document.getElementById("emailCheck");

            emailInput.disabled = true;
            emailCheckButton.disabled = true;
        }
        

        
        
    </script>
    </script>
</body>
</html>
