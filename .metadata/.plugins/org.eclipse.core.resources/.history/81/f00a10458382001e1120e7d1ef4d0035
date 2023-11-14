

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServelt
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUsername="kiga";
		String jdbcPassword="kiga1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			//유저가 존재하는지 확인
			String sql = "select email, name, phonenumber from users where email=? and password=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("name", resultSet.getString("name"));
				session.setAttribute("phonenumber", resultSet.getString("phonenumber"));
				
				response.sendRedirect("login_success.jsp");
			}else {
				request.setAttribute("loginError", "true");
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
