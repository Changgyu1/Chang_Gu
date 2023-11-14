

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
 * Servlet implementation class reservationCancel
 */
@WebServlet("/reservationCancel")
public class reservationCancel extends HttpServlet {
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
			
			int r_id = Integer.parseInt(request.getParameter("r_id"));
			
			String sql = "delete from reservation where r_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, r_id);
			
			ps.executeUpdate();
			response.sendRedirect("reservation_cancel_success.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("reservation_cancel_error.jsp");
			e.printStackTrace();
		}
	}

}
