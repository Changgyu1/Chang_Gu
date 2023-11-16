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

import sa_event.Qna;

@WebServlet("/QnaUpdateServlet")
public class QnaUpdateServlet extends HttpServlet {
	
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	String jdbcUsername = "kiga";
	String jdbcPassword = "kiga1234";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			try {
				connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
				
				int qna_number = Integer.parseInt(request.getParameter("qna_number"));
				String qna_title = request.getParameter("qna_title");
				String qna_content = request.getParameter("qna_content");
				
				String sql = "UPDATE qna SET qna_title = ?, qna_content = ? WHERE qna_number = ?";
				
				PreparedStatement ps = connection.prepareStatement(sql);
				
				ps.setString(1, qna_title);
				ps.setString(2, qna_content);
				ps.setInt(3, qna_number);
				
				ps.executeUpdate();
				
				request.getSession().setAttribute("qna_number", qna_number);
				request.getSession().setAttribute("qna_title", qna_title);
				request.getSession().setAttribute("qna_content", qna_content);
				
				response.sendRedirect("QnaUpdate_success.jsp");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("QnaUpdate_error.jsp");
			e.printStackTrace();
		}
		
	}

}
