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
		// JDBC �ҷ�����
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
			
			// �ְ����ϴ� DB �� ����
			
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String phonenumber = request.getParameter("phonenumber");
			String password = request.getParameter("password");
			// ȸ������ Insert �� �ۼ�
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
			// ������ ��� �̵��� ������ �������ְ� �ٽ� ����
			response.sendRedirect("registersuccess.jsp");
			
		} catch (SQLIntegrityConstraintViolationException e) {
			// ������ ��� �̵��� ������ ����
			response.sendRedirect("registerSel.jsp");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("registerError.jsp");
			e.printStackTrace();
		}
	}

}