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
 * Servlet implementation class Qna_comment_servlet
 */
@WebServlet("/Qna_comment_servlet")
public class Qna_comment_servlet extends HttpServlet {
	
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	String jdbcUsername = "kiga";
	String jdbcPassword = "kiga1234";
	
	Connection connection = null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			

			int qna_number = Integer.parseInt(request.getParameter("qna_number"));
			String qna_comment_content = request.getParameter("qna_comment_content");
			String qna_comment_password = request.getParameter("qna_comment_password");

			
			String sql = "INSERT INTO qna_comment(qna_comment_content, qna_comment_password, qna_number, qna_comment_date) VALUES(?,?,?,sysdate)";
			
			PreparedStatement ps = connection.prepareStatement(sql);
			
			ps.setString(1, qna_comment_content);
			ps.setString(2, qna_comment_password);
			ps.setInt(3, qna_number);
			
			ps.executeUpdate();
			
			request.getSession().setAttribute("qna_number", qna_number);
			request.getSession().setAttribute("qna_comment_content", qna_comment_content);
			request.getSession().setAttribute("qna_comment_password", qna_comment_password);
			
			response.sendRedirect("Qna_Detail.jsp?qna_number="+qna_number);
		
	} catch (Exception e) {
				
		e.printStackTrace();	
		
	}

	
	}

}
