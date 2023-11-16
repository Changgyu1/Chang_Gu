package register.event;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/registerEmailCheck")
public class registerEmailCheck extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

			String email = request.getParameter("email");
			String sql = "SELECT email FROM USERS WHERE email = ?";
			
			
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			ResultSet rs = preparedStatement.executeQuery();
		
			String redirectURL;
			if (rs.next()) {
			    redirectURL = "register.jsp";
			} else {
			    redirectURL = "register.jsp?email=" + email;
			}
			
			response.sendRedirect(redirectURL);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}