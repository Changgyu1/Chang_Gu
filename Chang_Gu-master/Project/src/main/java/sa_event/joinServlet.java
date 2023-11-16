package sa_event;


import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/joinServlet")
public class joinServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//JDBC 불러오기
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUsername = "kiga";
		String jdbcPassword = "kiga1234";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phonenumber");
			String password = request.getParameter("password");
			
			//회원가입 insert
			String sql = "INSERT INTO users (name, email, phonenumber, password) VALUES (?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, phonenumber);
			preparedStatement.setString(4, password);
			
			preparedStatement.executeUpdate();  //여기까지는 jdbc
			
			
			//가입 성공할 경우 회원 정보를 세션에 저장
			
			//세션 객체를 통해 클라이언트와 서버간에 전송할 데이터를 저장하고 공유하는 작업을 수행한다.
			//session "mno"라는 이름으로 데이터를 저장하는 역할을 한다.
			//request : 현재 클라이언트의 요청에 대한 정보를 제공하는 역할을 한다.
			//session 이란? 웹이나 애플리케이션 상태를 유지하고 데이터를 저장하기 위해 사용한다.
			//getSession() : request에서 현재 세션을 가지고 온다.
			//setAttribute("mno", mno) : 세션에 데이터를 저장하는 메서드
			//"mno"에 데이터를 저장하고, "mno" 변수 값이 해당 데이터로 설정되게 한다.
			//이렇게 저장된 데이터는 다른 서블릿이나 jsp 페이지에서 접근가능하다.
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("email", email);
			request.getSession().setAttribute("phonenumber", phonenumber);
			request.getSession().setAttribute("password", password);
			
			//성공할 경우 이동할 페이지 설정해주고 다시 전송을 해준다
			response.sendRedirect("join_success.jsp");
						
			
		} catch (SQLException e) {
			//실패할 경우 이동할 페이지 설정해준다.
			response.sendRedirect("join_error.jsp");
			e.printStackTrace();
		}
		
	}

}