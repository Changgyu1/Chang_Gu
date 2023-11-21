package sa_event;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/QnaDeleteServlet")
public class QnaDeleteServlet extends HttpServlet {
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	String jdbcUsername = "kiga";
	String jdbcPassword = "kiga1234";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			String qna_number = request.getParameter("qna_number");
			String qna_password = request.getParameter("qna_password");

			
			String sql = "DELETE FROM qna WHERE qna_password = ? AND qna_number = ?";
			
			PreparedStatement ps = connection.prepareStatement(sql);
			
			ps.setString(1, qna_password);
			ps.setString(2, qna_number);
			
			ps.executeUpdate();
			
			request.getSession().setAttribute("qna_number", qna_number);
			request.getSession().setAttribute("qna_password", qna_password);
			
			response.sendRedirect("Qna_List.jsp");
			
			
		} catch (SQLException e) {
			response.sendRedirect("QnaDelete_error.jsp");
			e.printStackTrace();
		}
		
	}

}
