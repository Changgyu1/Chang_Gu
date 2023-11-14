

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class reservation_update
 */
@WebServlet("/mypage_info_update")
public class mypage_info_update extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcURL="jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUserName="kiga";
		String jdbcPassword="kiga1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Connection conn = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phonenumber");
			
			String sql = "update users set phonenumber = ? where email = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, phonenumber);
			ps.setString(2, email);
			
			ps.executeUpdate();
			
			response.sendRedirect("mypage_update_success.jsp");
		} catch (SQLException e) {
			response.sendRedirect("mypage_update_error.jsp");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}

}
