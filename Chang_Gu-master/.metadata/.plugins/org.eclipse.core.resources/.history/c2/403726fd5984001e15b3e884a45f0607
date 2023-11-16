package sa_event;


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
 * Servlet implementation class QnaComment_Delete_Servlet
 */
@WebServlet("/QnaComment_Delete_Servlet")
public class QnaComment_Delete_Servlet extends HttpServlet {
	private static final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String jdbcUsername = "kiga";
	private static final String jdbcPassword = "kiga1234";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		
		try {
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			String sql = "DELETE FROM qna_comment WHERE qna_comment_password=? AND qna_comment_number=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			
			int qna_comment_password = Integer.parseInt(request.getParameter("qna_comment_password"));
			int qna_comment_number = Integer.parseInt(request.getParameter("qna_comment_number"));
			
			ps.setObject(1, qna_comment_password);
			ps.setInt(2, qna_comment_number);
			
			System.out.println(qna_comment_password);
			System.out.println(qna_comment_number);
			
			ps.executeUpdate();
			
			response.sendRedirect("Qna_List.jsp");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}

}
