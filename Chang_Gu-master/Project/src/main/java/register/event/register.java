package register.event;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class register extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// JDBC 불러오기
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUsername = "kiga";
		String jdbcPassword = "kiga1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			/*
			CREATE TABLE MemberInfo (
    		MNO INT PRIMARY KEY,
    		MName VARCHAR(50),
    		MEmail VARCHAR(100),
    		MBirth  DATE
			);
			 */
			
			// 넣고자하는 DB 값 설정
			
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String phonenumber = request.getParameter("phonenumber");
			String password = request.getParameter("password");
			// 회원가입 Insert 문 작성
			String sql = "INSERT INTO USERS (email, name, phonenumber, password) VALUES (?, ?, ?, ?)";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, phonenumber);
			preparedStatement.setString(4, password);
			preparedStatement.executeUpdate();
		
			request.getSession().setAttribute("email", email);
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("phonenumber", phonenumber);
			request.getSession().setAttribute("password", password);
			// 성공할 경우 이동할 페이지 설정해주고 다시 전송
			response.sendRedirect("registersuccess.jsp");
			
		} catch (SQLIntegrityConstraintViolationException e) {
			// 실패할 경우 이동할 페이지 설정
			response.sendRedirect("registerSel.jsp");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("registerError.jsp");
			e.printStackTrace();
		}
	}

}